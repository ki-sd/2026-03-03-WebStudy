package com.sist.dao;
import java.util.*;
import java.sql.*;
import javax.sql.*; // DataSource : 데이터베이스 정보를 갖고있는 클래스
import javax.naming.*; // Context => 이름으로 객체 생성
//이름으로 객체 찾는 경우 => lookup("mydb") => 객체를 찾는다
//JNDI
//Pool => 메모리 공간 => java://comp//env
public class EmpDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static EmpDAO dao;
	
	public void getConnection() {
		try {
			// 탐색기 형식으로 저장
			// 1. 탐색기를 연다
			Context init=new InitialContext();
			// 2. C드라이브 열기
			Context c=(Context)init.lookup("java://comp/env");
			// => connection 객체가 들어가있다
			// 3. 해당 파일 얻어오기
			DataSource ds=(DataSource)c.lookup("jdbc/oracle"); // name값
			// 4. Connection 저장
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
	public static EmpDAO newInstance() {
		if(dao==null)
			dao=new EmpDAO();
		return dao;
	}
	public List<EmpBean> empListData(){
		List<EmpBean> list=new ArrayList<EmpBean>();
		try {
			getConnection();
			String sql="SELECT empno,ename,job,TO_CHAR(hiredate,'yyyy-MM-dd'),sal "
					+ "FROM emp "
					+ "ORDER BY empno ASC";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				EmpBean bean=new EmpBean();
				bean.setEmpno(rs.getInt(1));
				bean.setEname(rs.getString(2));
				bean.setJob(rs.getString(3));
				bean.setDbday(rs.getString(4));
				bean.setSal(rs.getInt(5));
				list.add(bean);
			}
			rs.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			disConnection();
		}
		return list;
	}
}
