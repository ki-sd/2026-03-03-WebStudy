package com.sist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class EmpDAO {
	private Connection conn;
	private PreparedStatement ps;
	private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
	
	public EmpDAO() {
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
	
	//EMPNO    NOT NULL NUMBER       
	//ENAME    NOT NULL VARCHAR2(50) 
	//JOB      NOT NULL VARCHAR2(50) 
	//HIREDATE NOT NULL DATE         
	//SAL      NOT NULL NUMBER(10,2) 
	//DEPTNO   NOT NULL NUMBER       
	//ISADMIN           CHAR(1)     
	
	public List<EmpVO> empListData(int page, int offsetCount){
		List<EmpVO> list=new ArrayList<EmpVO>();
		try {
			getConnection();
			String sql="SELECT empno,ename,job,TO_CHAR(hiredate,'YYYY-MM-DD'),dept2.dname,TO_CHAR(sal,'99,999') "
					+ "FROM Emp2 JOIN dept2 "
					+ "ON emp2.deptno=dept2.deptno "
					+ "ORDER BY empno ASC "
					+ "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, (page*offsetCount)-offsetCount);
			ps.setInt(2, offsetCount);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				EmpVO vo=new EmpVO();
				vo.setEmpno(rs.getInt(1));
				vo.setEname(rs.getString(2));
				vo.setJob(rs.getString(3));
				vo.setDbday(rs.getString(4));
				vo.getDvo().setDname(rs.getString(5));
				vo.setSal2(rs.getString(6));
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
	public int empRowCount() {
		int count=0;
		try {
			getConnection();
			String sql="SELECT COUNT(*) "
					+ "FROM Emp2";
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
//	public void insertEmp(EmpVO vo) {
//		try {
//			getConnection();
//			String sql="INSERT INTO Emp2(name,subject,content,pwd) "
//					+ "VALUES(?,?,?,?)";
//			ps=conn.prepareStatement(sql);
//			ps.setString(1, vo.getEname());
//			ps.setString(2, vo.getSubject());
//			ps.setString(3, vo.getContent());
//			ps.setString(4, vo.getPwd());
//			ps.executeUpdate();
//		}catch(Exception ex) {
//			ex.printStackTrace();
//		}finally {
//			disConnection();
//		}
//	}
//	public EmpVO EmpDetailData(int no) {
//		EmpVO vo=new EmpVO();
//		try {
//			getConnection();
//			String sql="UPDATE Emp2 SET "
//					+ "hit=hit+1 "
//					+ "WHERE no=?";
//			ps=conn.prepareStatement(sql);
//			ps.setInt(1, no);
//			ps.executeUpdate();
//			sql="SELECT no,name,subject,content,TO_CHAR(regdate,'YYYY-MM-DD hh24:mi:ss'),hit "
//					+ "FROM Emp2 "
//					+ "WHERE no=?";
//			ps=conn.prepareStatement(sql);
//			ps.setInt(1, no);
//			ResultSet rs=ps.executeQuery();
//			rs.next();
//			vo.setNo(rs.getInt(1));
//			vo.setName(rs.getString(2));
//			vo.setSubject(rs.getString(3));
//			vo.setContent(rs.getString(4));
//			vo.setDbday(rs.getString(5));
//			vo.setHit(rs.getInt(6));
//			rs.close();
//		}catch(Exception ex) {
//			ex.printStackTrace();
//		}finally {
//			disConnection();
//		}
//		return vo;
//	}
////	public boolean deleteEmp(int no,String pwd) {
////		boolean bCheck=false;
////		try {
////			getConnection();
////			String sql="SELECT pwd FROM Emp2 "
////					+ "WHERE no=?";
////			ps=conn.prepareStatement(sql);
////			ps.setInt(1, no);
////			ResultSet rs=ps.executeQuery();
////			rs.next();
////			String db_pwd=rs.getString(1);
////			rs.close();
////			if(db_pwd.equals(pwd)) {
////				bCheck=true;
////				sql="DELETE FROM Emp2 "
////						+ "WHERE no=?";
////				ps=conn.prepareStatement(sql);
////				ps.setInt(1, no);
////				ps.executeUpdate();
////			}
////		}catch(Exception ex) {
////			ex.printStackTrace();
////		}finally {
////			disConnection();
////		}
////		return bCheck;
////	}
//	public boolean deleteEmp(int no, String pwd) {
//	    boolean bCheck = false;
//	    try {
//	        getConnection();
//	        String sql = "DELETE FROM Emp2 "
//	        		+ "WHERE no=? AND pwd=?";
//	        ps = conn.prepareStatement(sql);
//	        ps.setInt(1, no);
//	        ps.setString(2, pwd);
//	        int result = ps.executeUpdate();
//	        if(result == 1) {
//	            bCheck = true;
//	        }
//	    } catch(Exception ex) {
//	        ex.printStackTrace();
//	    } finally {
//	        disConnection();
//	    }
//	    return bCheck;
//	}
//	public EmpVO updateEmpData(int no) {
//		EmpVO vo=new EmpVO();
//		try {
//			getConnection();
//			String sql="SELECT no,name,subject,content "
//					+ "FROM Emp2 "
//					+ "WHERE no=?";
//			ps=conn.prepareStatement(sql);
//			ps.setInt(1, no);
//			ResultSet rs=ps.executeQuery();
//			rs.next();
//			vo.setNo(rs.getInt(1));
//			vo.setName(rs.getString(2));
//			vo.setSubject(rs.getString(3));
//			vo.setContent(rs.getString(4));
//			rs.close();
//		}catch(Exception ex) {
//			ex.printStackTrace();
//		}finally {
//			disConnection();
//		}
//		return vo;
//	}
////	public boolean updateEmp(EmpVO vo) {
////		boolean bCheck=false;
////		try {
////			getConnection();
////			String sql="SELECT pwd FROM Emp2 "
////					+ "WHERE no=?";
////			ps=conn.prepareStatement(sql);
////			ps.setInt(1, vo.getNo());
////			ResultSet rs=ps.executeQuery();
////			rs.next();
////			String db_pwd=rs.getString(1);
////			rs.close();
////			if(db_pwd.equals(vo.getPwd())) {
////				bCheck=true;
////				sql="UPDATE Emp2 SET "
////						+ "name=?,subject=?,content=? "
////						+ "WHERE no=?";
////				ps=conn.prepareStatement(sql);
////				ps.setString(1, vo.getName());
////				ps.setString(2, vo.getSubject());
////				ps.setString(3, vo.getContent());
////				ps.setInt(4, vo.getNo());
////				ps.executeUpdate();
////			}
////		}catch(Exception ex) {
////			ex.printStackTrace();
////		}finally {
////			disConnection();
////		}
////		return bCheck;
////	}
//	public boolean updateEmp(EmpVO vo) {
//	    boolean bCheck = false;
//	    try {
//	        getConnection();
//	        String sql = "UPDATE Emp2 SET "
//	        		+ "name=?,subject=?,content=? "
//	        		+ "WHERE no=? AND pwd=?";
//	        ps = conn.prepareStatement(sql);
//	        ps.setString(1, vo.getName());
//			ps.setString(2, vo.getSubject());
//			ps.setString(3, vo.getContent());
//			ps.setInt(4, vo.getNo());
//			ps.setString(5, vo.getPwd());
//	        int result = ps.executeUpdate();
//	        if(result == 1) {
//	            bCheck = true;
//	        }
//	    } catch(Exception ex) {
//	        ex.printStackTrace();
//	    } finally {
//	        disConnection();
//	    }
//	    return bCheck;
//	}
}
