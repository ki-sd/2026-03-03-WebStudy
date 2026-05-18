package com.sist.dao;
import java.util.*;
import java.sql.*;
public class EmpDAO {
	private PreparedStatement ps;
	private Connection conn;
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
	//EMPNO    NOT NULL NUMBER(4)    
	//ENAME             VARCHAR2(10) 
	//JOB               VARCHAR2(9)  
	//MGR               NUMBER(4)    
	//HIREDATE          DATE         
	//SAL               NUMBER(7,2)  
	//COMM              NUMBER(7,2)  
	//DEPTNO            NUMBER(2)   
	public List<EmpVO> empListData(){
		List<EmpVO> list=new ArrayList<EmpVO>();
		try {
			getConnection();
			String sql="SELECT empno,ename,job,mgr,TO_CHAR(hiredate,'YYYY-MM-DD'),TO_CHAR(sal,'999,999'),comm,dname,loc "
					+ "FROM emp JOIN dept "
					+ "ON emp.deptno=dept.deptno "
					+ "ORDER BY sal DESC";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				EmpVO vo=new EmpVO();
				vo.setEmpno(rs.getInt(1));
				vo.setEname(rs.getString(2));
				vo.setJob(rs.getString(3));
				vo.setMgr(rs.getInt(4));
				vo.setDbday(rs.getString(5));
				vo.setStrsal(rs.getString(6));
				vo.setComm(rs.getInt(7));
				vo.getDvo().setDname(rs.getString(8));
				vo.getDvo().setLoc(rs.getString(9));
				list.add(vo);
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			disConnection();
		}
		return list;
	}
}
