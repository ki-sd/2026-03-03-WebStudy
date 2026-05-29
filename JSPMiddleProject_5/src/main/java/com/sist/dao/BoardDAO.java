package com.sist.dao;
import java.util.*;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;
public class BoardDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static BoardDAO dao=new BoardDAO();
	private final int ROW=10;
	
	public static BoardDAO newInstance() {
		if(dao==null)
			dao=new BoardDAO();
		return dao;
	}
	public void getConnection() {
		try {
			Context init=new InitialContext();
			Context c=(Context)init.lookup("java://comp/env");
			DataSource ds=(DataSource)c.lookup("jdbc/oracle");
			conn=ds.getConnection();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	public void disConnection() {
		try {
			if(ps!=null) ps.close();
			if(conn!=null) conn.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	/*
	 *     SELECT no,subject,name,TO_CHAR(regdate,'yyyy-mm-dd'),hit 
	 *     FROM jspReplyBoard
	 *     FROM
	 */
	/*
	try {
		getConnection();
		String sql="";
	}catch(Exception ex) {
		ex.printStackTrace();
	}finally {
		disConnection();
	}
	*/
	public List<BoardVO> boardListData(int page){
		List<BoardVO> list=new ArrayList<BoardVO>();
		try {
			getConnection();
			String sql="SELECT no,subject,name,TO_CHAR(regdate,'yyyy-mm-dd'),hit,group_tab "
					+ "FROM jspReplyBoard "
					+ "ORDER BY group_id DESC, group_step ASC "
					+ "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, (page*ROW)-ROW);
			ps.setInt(2, ROW);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				BoardVO vo=new BoardVO();
				vo.setNo(rs.getInt(1));
				vo.setSubject(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setDbday(rs.getString(4));
				vo.setHit(rs.getInt(5));
				vo.setGroup_tab(rs.getInt(6));
				list.add(vo);
			}
			rs.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			disConnection();
		}
		return list;
	}
	public int boardRowCount() {
		int count=0;
		try {
			getConnection();
			String sql="SELECT COUNT(*) FROM jspReplyBoard";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			count=rs.getInt(1);
			rs.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			disConnection();
		}
		return count;
	}
	public void boardInsert(BoardVO vo) {
		try {
			getConnection();
			String sql="INSERT INTO jspReplyBoard(no,name,subject,content,pwd,group_id) "
					+ "VALUES(jrb_no_seq.nextval,?,?,?,?) "
					+ "(SELECT NVL(MAX(group_id)+1,1) FROM jspReplyBoard))";
			// JOIN => select만 사용 , subquery => DML전체 사용이 가능 
			// JOIN => table+table => 필요한 데이터 추출 
			// SubQuery => SQL+SQL => 한개의 SQL을 만든다 
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getSubject());
			ps.setString(3, vo.getContent());
			ps.setString(4, vo.getPwd());
			ps.executeUpdate();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			disConnection();
		}
	}
	public BoardVO baordDetail(int no)
	   {
		   BoardVO vo=new BoardVO();
		   try
		   {
			   getConnection();
			   String sql="UPDATE jspReplyBoard SET "
					     +"hit=hit+1 "
					     +"WHERE no=?";
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, no);
			   ps.executeUpdate();
			   
			   // 실제 데이터 읽기 
			   sql="SELECT no,name,subject,content,hit,"
				  +"TO_CHAR(regdate,'yyyy-MM-dd hh24:mi:ss') "
				  +"FROM jspReplyBoard "
				  +"WHERE no=?";
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, no);
			   
			   // 결과값 
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   vo.setNo(rs.getInt(1));
			   vo.setName(rs.getString(2));
			   vo.setSubject(rs.getString(3));
			   vo.setContent(rs.getString(4));
			   vo.setHit(rs.getInt(5));
			   vo.setDbday(rs.getString(6));
			   rs.close();
			   // Model => 요청 처리하는 메소드 => 해당 데이터 전송 : request/session
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   disConnection();
		   }
		   return vo;
	}
	public BoardVO baordUpdateData(int no)
	{
		   BoardVO vo=new BoardVO();
		   try
		   {
			   getConnection();
			   String sql="SELECT no,name,subject,content "
				  +"FROM jspReplyBoard "
				  +"WHERE no=?";
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, no);
			   
			   // 결과값 
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   vo.setNo(rs.getInt(1));
			   vo.setName(rs.getString(2));
			   vo.setSubject(rs.getString(3));
			   vo.setContent(rs.getString(4));
			  
			   rs.close();
			   // Model => 요청 처리하는 메소드 => 해당 데이터 전송 : request/session
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   disConnection();
		   }
		   return vo;
	}
	public boolean boardUpdate(BoardVO vo)
	   {
		   boolean bCheck=false;
		   try
		   {
			   getConnection();
			   String sql="SELECT pwd FROM jspReplyBoard "
					     +"WHERE no=?";
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, vo.getNo());
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   String db_pwd=rs.getString(1);
			   rs.close();
			   
			   // 본인 여부 확인 
			   if(db_pwd.equals(vo.getPwd()))
			   {
				   bCheck=true;
				   
				   // 수정
				   sql="UPDATE jspReplyBoard SET "
					  +"name=?,subject=?,content=? "
					  +"WHERE no=?";
				   ps=conn.prepareStatement(sql);
				   ps.setString(1, vo.getName());
				   ps.setString(2, vo.getSubject());
				   ps.setString(3, vo.getContent());
				   ps.setInt(4, vo.getNo());
				   ps.executeUpdate();
			   }
			   
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   disConnection();//반환
		   }
		   return bCheck;
	   }
	   /////////////////////////
	   // 4-5. 답변 올리기 => SQL 4개 수행 
	   // 일괄처리 => 동시 Commit / 동시 Rollback
	   // 비절차언어 => 에러 무시 => 다음 문장을 수행 => 한번 처리 => 트랜젝션 
	   // 위치 지정 savepoint
	   public void boardreply(int pno,BoardVO vo)
	   {
		   try
		   {
			   getConnection();
			   conn.setAutoCommit(false);
			   // 답변 대상의 정보 읽기 
			   String sql="SELECT group_id,group_step,group_tab "
					     +"FROM jspReplyBoard "
					     +"WHERE no=?";
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, pno);
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   int gi=rs.getInt(1);
			   int gs=rs.getInt(2);
			   int gt=rs.getInt(3);
			   rs.close();
			   /*              gi  gs  gt
			    *    AAAAA      1   0   0
			    *     =>EEEEE   1   1   1
			    *     =>BBBBB   1   2   1
			    *      =>CCCCC  1   3   2
			    *       =>DDDDD 1   4   3
			    *     
			    *     
			    */
			   // 답변 => 핵심 
			   sql="UPDATE jspReplyBoard SET "
				  +"group_step=group_step+1 "
				  +"WHERE group_id=? AND group_step>?";
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, gi);
			   ps.setInt(2, gs);
			   ps.executeUpdate();
			   
			   // insert 
			   sql="INSERT INTO jspReplyBoard(no,name,subject,content,pwd,group_id,group_step,group_tab,root) "
				  +"VALUES(jrb_no_seq.nextval,?,?,?,?,?,?,?,?)";
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, vo.getName());
			   ps.setString(2, vo.getSubject());
			   ps.setString(3, vo.getContent());
			   ps.setString(4, vo.getPwd());
			   ps.setInt(5, gi);
			   ps.setInt(6, gs+1);
			   ps.setInt(7, gt+1);
			   ps.setInt(8, pno);
			   ps.executeUpdate();
			   // update
			   sql="";
			   
			   conn.commit();
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
			   try
			   {
				   conn.rollback();
			   }catch(Exception e) {}
		   }
		   finally
		   {
			   try
			   {
				   conn.setAutoCommit(true);
			   }catch(Exception ex) {}
			   disConnection();
		   }
	   }
	   // 4-6. 삭제하기   => 4개 수행 
	   ///////////////////////// 트랙젝션 처리 => INSERT / UPDATE / DELETE
	
	
}
