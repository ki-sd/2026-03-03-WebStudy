package com.sist.dao;

import java.util.*;
import java.sql.*;
public class FoodDAO {
	private Connection conn;
	private PreparedStatement ps;
	private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
	
	public FoodDAO() {
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
	
//	 FNO                                       NOT NULL NUMBER
//	 NAME                                      NOT NULL VARCHAR2(200)
//	 TYPE                                               VARCHAR2(100)
//	 PHONE                                              VARCHAR2(50)
//	 ADDRESS                                            VARCHAR2(500)
//	 SCORE                                              NUMBER(3,1)
//	 THEME                                              VARCHAR2(2000)
//	 POSTER                                             VARCHAR2(500)
//	 TIME                                               VARCHAR2(500)
//	 PARKING                                            VARCHAR2(500)
//	 CONTENT                                            CLOB
//	 HIT                                                NUMBER
//	 PRICE                                              VARCHAR2(100)
	public List<FoodVO> foodListData(int page){
		List<FoodVO> list=new ArrayList<FoodVO>();
		try {
			getConnection();
			String sql="SELECT fno,poster,name "
					+ "FROM food "
					+ "ORDER BY fno ASC "
					+ "OFFSET ? ROWS FETCH NEXT 12 ROWS ONLY";
			        // MySQL/MariaDB => LIMIT ?,12
			ps=conn.prepareStatement(sql);
			ps.setInt(1, (page*12)-12);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				FoodVO vo=new FoodVO();
				vo.setFno(rs.getInt(1));
				vo.setPoster(rs.getString(2));
				vo.setName(rs.getString(3));
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
	public int getTotalPage() {
		int total=0;
		try {
			getConnection();
			String sql="SELECT CEIL(COUNT(*)/12.0) "
					+ "FROM food";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			total=rs.getInt(1);
			rs.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			disConnection();
		}
		return total;
	}
	public FoodVO foodDetailData(int fno) {
		FoodVO vo=new FoodVO();
		try {
			getConnection();
			String sql="SELECT fno,name,type,phone,address,score,theme,poster,time,parking,content,price "
					+ "FROM food "
					+ "WHERE fno=? ";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, fno);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				vo.setFno(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setType(rs.getString(3));
				vo.setPhone(rs.getString(4));
				vo.setAddress(rs.getString(5));
				vo.setScore(rs.getDouble(6));
				vo.setTheme(rs.getString(7));
				vo.setPoster(rs.getString(8));
				vo.setTime(rs.getString(9));
				vo.setParking(rs.getString(10));
				vo.setContent(rs.getString(11));
				vo.setPrice(rs.getString(12));
			}
			rs.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			disConnection();
		}
		return vo;
	}
}
