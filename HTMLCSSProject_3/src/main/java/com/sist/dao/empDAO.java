package com.sist.dao;
import java.util.*;
import java.sql.*;
/*
 *     브라우저 => HTML
 *         요청 |  |
 *      자바 => 오라클 + 브라우저 연결
 *         | | 응답
 *      오라클 => 데이터 저장
 */
public class empDAO {
	private Connection conn;
	private PreparedStatement ps;
	private String URL="jdbc:oracle:thin:@localhost:1521:XE";
	
	public empDAO() {
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
	public List<empVO> getListData(){
		List<empVO> list=new ArrayList<empVO>();
		try {
			getConnection();
			String sql="SELECT empno,ename,job,TO_CHAR(hiredate,'YYYY-MM-DD'),sal,dname,isadmin "
					+ "FROM emp2 JOIN dept2 "
					+ "ON emp2.deptno=dept2.deptno "
					+ "ORDER BY empno ASC";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				empVO vo=new empVO();
				vo.setEmpno(rs.getInt(1));
				vo.setEname(rs.getString(2));
				vo.setJob(rs.getString(3));
				vo.setDbdate(rs.getString(4));
				vo.setSal(rs.getInt(5));
				vo.setDname(rs.getString(6));
				vo.setIsadmin(rs.getString(7));
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
	public static void main(String[] args) {
		empDAO dao=new empDAO();
		List<empVO> list=dao.getListData();
		for(empVO vo:list) {
			System.out.println(vo.getEmpno()+" "
					+ vo.getEname()+" "
					+ vo.getJob()+" "
					+ vo.getDbdate()+" "
					+ vo.getSal());
		}
	}
	
}
