package com.sist.dao;
import java.util.*;
import java.sql.*;
//////////////////// DBCP용
/*
 * 		MyBatis
 * 		  1. XML 기반
 *           ------- XML을 수업 => XML 파싱 => Spring 구조
 *        2. Annotation 기반 ==> Spring
 *      JQuery
 *        1. 데이터 읽기 => JSON
 *      ---------------------------------------------
 *      크롤링 => 오라클 => 데이터베이스 설계 / 요구사항 / 정규화
 *        JSoup / 셀레니움 / Playweight
 *      => Vue / React / Ajax => 크롤링 불가
 *      => data.go.kr
 *      ---------------------------------- 1차 프로젝트
 *      
 *      기초
 *       자바 / 오라클 / HTML / CSS / JavaScript / JSP
 *       나머지 => 라이브러리 => 활용 => 실제 사이트 구축
 */
import javax.sql.*;

import com.sist.vo.*;

import javax.naming.*;
public class MemberDAO {
	/*
	 *   DBCP : 데이터베이스 연결시에 가장 시간이 걸리는 것
	 *          => 연결 : 연결 줄이기 위해 미리 연결한 상태 (속도 빠르게)
	 *          => 몇개 저장? maxActive / maxIdle
	 *          => myBatis => 설정 => default => 8,8
	 *   사용법 : 1) server.xml에 등록 => 톰캣이 실행
	 *             ---------- <Resource>
	 *   => 1. 저장된 Connection 주소 읽기
	 *         ----------------------
	 *         = JDNI => 가상 탐색기 형식으로
	 *         java://comp/env => C드라이브 => Connection 주소 저장
	 *                                      ----------
	 *                                      이름 : jdbc:oracle
	 *      2. Connection 주소 대입
	 *         conn=ds.getConnection()
	 *  
	 */
	private Connection conn;
	private PreparedStatement ps;
	private static MemberDAO dao;
	
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
	
	public static MemberDAO newInstance() {
		if(dao==null)
			dao=new MemberDAO();
		return dao;
	}
	
	public MemberVO memberLogin(String id,String pwd) {
		MemberVO vo=new MemberVO();
		try {
			getConnection();
			String sql="SELECT COUNT(*) "
					+ "FROM member "
					+ "WHERE id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs=ps.executeQuery();
			rs.next();
			int count=rs.getInt(1);
			rs.close();
			if(count==0) {
				vo.setMsg("NOID");
			}else {
				sql="SELECT id,name,pwd,isadmin,post,addr1,addr2,phone "
					+ "FROM member "
					+ "WHERE id=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, id);
				rs=ps.executeQuery();
				rs.next();
				String db_id=rs.getString(1);
				String name=rs.getString(2);
				String db_pwd=rs.getString(3);
				String isAdmin=rs.getString(4);
				String post=rs.getString(5);
				String addr1=rs.getString(6);
				String addr2=rs.getString(7);
				String phone=rs.getString(8);
				// Session에 저장하는 사용자의 정보
				if(pwd.equals(db_pwd)) {
					vo.setId(db_id);
					vo.setName(name);
					vo.setIsadmin(isAdmin);
					vo.setPost(post);
					vo.setAddr1(addr1);
					vo.setAddr2(addr2);
					vo.setPhone(phone);
					vo.setMsg("OK");
				}else {
					vo.setMsg("NOPWD");
				}
				rs.close();
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			disConnection();
		}
		return vo;
	}
}
