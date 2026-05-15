package com.sist.dao;

import java.util.*;
import java.sql.*;
public class BoardDAO {
	private Connection conn;
	private PreparedStatement ps;
	private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
	
	public BoardDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	public void getConnection() {
		try {
			conn=DriverManager.getConnection(URL,"hr","happy");
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
	
	//NO      NOT NULL NUMBER         
	//NAME    NOT NULL VARCHAR2(51)   
	//SUBJECT NOT NULL VARCHAR2(2000) 
	//CONTENT NOT NULL CLOB           
	//PWD     NOT NULL VARCHAR2(10)   
	//REGDATE          DATE           
	//HIT              NUMBER     
	
	public List<BoardVO> boardListData(int page, int offsetCount){
		List<BoardVO> list=new ArrayList<BoardVO>();
		try {
			getConnection();
			String sql="SELECT no,name,subject,content,pwd,TO_CHAR(regdate,'YYYY-MM-DD'),hit "
					+ "FROM jspboard "
					+ "ORDER BY regdate DESC "
					+ "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, (page*offsetCount)-offsetCount);
			ps.setInt(2, offsetCount);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				BoardVO vo=new BoardVO();
				vo.setNo(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setSubject(rs.getString(3));
				vo.setContent(rs.getString(4));
				vo.setPwd(rs.getString(5));
				vo.setDbday(rs.getString(6));
				vo.setHit(rs.getInt(7));
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
	// 번호 순차적 출력을 위한 로우카운트 (가상번호 부여 예정)
	public int boardRowCount() {
		int count=0;
		try {
			getConnection();
			String sql="SELECT COUNT(*) "
					+ "FROM jspboard";
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
	public void insertBoard(BoardVO vo) {
		try {
			getConnection();
			String sql="INSERT INTO jspboard(name,subject,content,pwd) "
					+ "VALUES(?,?,?,?)";
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
	public BoardVO boardDetailData(int no) {
		BoardVO vo=new BoardVO();
		try {
			getConnection();
			String sql="UPDATE jspBoard SET "
					+ "hit=hit+1 "
					+ "WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ps.executeUpdate();
			sql="SELECT no,name,subject,content,TO_CHAR(regdate,'YYYY-MM-DD hh24:mi:ss'),hit "
					+ "FROM jspBoard "
					+ "WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setSubject(rs.getString(3));
			vo.setContent(rs.getString(4));
			vo.setDbday(rs.getString(5));
			vo.setHit(rs.getInt(6));
			rs.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			disConnection();
		}
		return vo;
	}
//	public boolean deleteBoard(int no,String pwd) {
//		boolean bCheck=false;
//		try {
//			getConnection();
//			String sql="SELECT pwd FROM jspBoard "
//					+ "WHERE no=?";
//			ps=conn.prepareStatement(sql);
//			ps.setInt(1, no);
//			ResultSet rs=ps.executeQuery();
//			rs.next();
//			String db_pwd=rs.getString(1);
//			rs.close();
//			if(db_pwd.equals(pwd)) {
//				bCheck=true;
//				sql="DELETE FROM jspBoard "
//						+ "WHERE no=?";
//				ps=conn.prepareStatement(sql);
//				ps.setInt(1, no);
//				ps.executeUpdate();
//			}
//		}catch(Exception ex) {
//			ex.printStackTrace();
//		}finally {
//			disConnection();
//		}
//		return bCheck;
//	}
	public boolean deleteBoard(int no, String pwd) {
	    boolean bCheck = false;
	    try {
	        getConnection();
	        String sql = "DELETE FROM jspBoard "
	        		+ "WHERE no=? AND pwd=?";
	        ps = conn.prepareStatement(sql);
	        ps.setInt(1, no);
	        ps.setString(2, pwd);
	        int result = ps.executeUpdate();
	        if(result == 1) {
	            bCheck = true;
	        }
	    } catch(Exception ex) {
	        ex.printStackTrace();
	    } finally {
	        disConnection();
	    }
	    return bCheck;
	}
	public BoardVO updateBoardData(int no) {
		BoardVO vo=new BoardVO();
		try {
			getConnection();
			String sql="SELECT no,name,subject,content "
					+ "FROM jspBoard "
					+ "WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setSubject(rs.getString(3));
			vo.setContent(rs.getString(4));
			rs.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			disConnection();
		}
		return vo;
	}
//	public boolean updateBoard(BoardVO vo) {
//		boolean bCheck=false;
//		try {
//			getConnection();
//			String sql="SELECT pwd FROM jspBoard "
//					+ "WHERE no=?";
//			ps=conn.prepareStatement(sql);
//			ps.setInt(1, vo.getNo());
//			ResultSet rs=ps.executeQuery();
//			rs.next();
//			String db_pwd=rs.getString(1);
//			rs.close();
//			if(db_pwd.equals(vo.getPwd())) {
//				bCheck=true;
//				sql="UPDATE jspBoard SET "
//						+ "name=?,subject=?,content=? "
//						+ "WHERE no=?";
//				ps=conn.prepareStatement(sql);
//				ps.setString(1, vo.getName());
//				ps.setString(2, vo.getSubject());
//				ps.setString(3, vo.getContent());
//				ps.setInt(4, vo.getNo());
//				ps.executeUpdate();
//			}
//		}catch(Exception ex) {
//			ex.printStackTrace();
//		}finally {
//			disConnection();
//		}
//		return bCheck;
//	}
	public boolean updateBoard(BoardVO vo) {
	    boolean bCheck = false;
	    try {
	        getConnection();
	        String sql = "UPDATE jspBoard SET "
	        		+ "name=?,subject=?,content=? "
	        		+ "WHERE no=? AND pwd=?";
	        ps = conn.prepareStatement(sql);
	        ps.setString(1, vo.getName());
			ps.setString(2, vo.getSubject());
			ps.setString(3, vo.getContent());
			ps.setInt(4, vo.getNo());
			ps.setString(5, vo.getPwd());
	        int result = ps.executeUpdate();
	        if(result == 1) {
	            bCheck = true;
	        }
	    } catch(Exception ex) {
	        ex.printStackTrace();
	    } finally {
	        disConnection();
	    }
	    return bCheck;
	}
	
}
