package com.sist.dao;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.vo.DataBoardVO;

import java.io.*;
/*
 *     데이터베이스 연동
 *     JDBC ========> DBCP ========> ORM
 *                                   데이터베이스 처리하는 라이브러리 집합
 *                                    Mybatis / JPA
 *                                    | = XML 이용 : JSP사이트
 *                                    | = Annotation : Spring-Boot
 *     1) MyBatis(3버전) : IBatis(2버전) => OpenSource
 *        | Google에서 인수
 *        SQL을 작성 => MyBatis로 전송
 *                    | 자동으로 처리 (연결 / 전송 / 실행 / 결과값 담기)
 *             | 설정 => XML
 *             | => 1) SQL문장 / 2) VO설정 / 3) ?에 값 채우기
 *               => 반복적 구조를 없앤다
 *     2) 동작 구조
 *        = Config.xml => Connection => 한개만 설정
 *        = mapper.xml => PreparedStatement / ResultSet
 *          => 테이블당 1개 생성
 *        1. Config.xml을 이요해서 => getConnection() / disConnection()
 *        2. mapper를 읽어서 JDBC 이용해 처리
 *     3) 장점
 *        SQL문장 직접 제어 => 개발자
 *        성능 최적화 => 튜닝
 *        복잡한 SQL문장 제어
 *     4) 단점
 *        SQL문장 직접 제어 => JPA에서는 SQL문장 자동화
 *        DB변경시 수정
 *        객체 지향 ORM이 약함
 *     ----------------------------------------
 *     SQL문장은 동일 / 동적 쿼리 (다중 검색) / #{} / ${}
 *                                     ----  ----
 *                                           | ''없이 처리 => table명, column명 등
 *                                     | ?에 값을 채운다 => '' 자동으로 붙음
 *     => resultType : 결과값 담기 (ResultSet)
 *     => parameterType : ?에 값이 들어간다
 *        => 1. ?여러개인 경우 => VO
 *           2. VO에 없는 변수 여러개 => Map
 *           
 *     => SqlSessionFactoty : SqlSession 생성 / XML 파싱
 *     => SqlSession : PreparedStatement/ResultSet 담당
 *        ----------- conn.preparedStatement()
 *                    ps.executeQuery()
 */
public class DataBoardDAO {
	// 1. XML 파싱
	private static SqlSessionFactory ssf;
	static {
		try {
			Reader reader=Resources.getResourceAsReader("Config.xml");
			// classpath영역(Root폴더)에 파일저장 => 경로명 없이 파일명만 지정
			ssf=new SqlSessionFactoryBuilder().build(reader);
			/*
			 * map.put("id","sql")
			 * map1.put("id",resultType)
			 * map2.put("id",parameterType)
			 * 
			 */
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	// 2. 기능
	public static List<DataBoardVO> databoardListData(int start){
		List<DataBoardVO> list=new ArrayList<DataBoardVO>();
		SqlSession session=null; //conn 생성
		try {
			session=ssf.openSession();
			list=session.selectList("databoardListData",start);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null) session.close(); // disConnection()
		}
		return list;
	}
	public static int databoardTotalPage() {
		int total=0;
		SqlSession session=null; //conn 생성
		try {
			session=ssf.openSession();
			total=session.selectOne("databoardTotalPage");
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null) session.close(); // disConnection()
		}
		return total;
	}
//	public static int databoardTotalPage2() {
//		int total=0;
//		SqlSession session=null; //conn 생성
//		session=ssf.openSession();
//		total=session.selectOne("databoardTotalPage");
//		session.close(); // disConnection()
//		return total;
//	}
	public static void databoardInsert(DataBoardVO vo) {
		SqlSession session=null; //conn 생성
		try {
			// ssf.openSession() => conn.setAutoCommit(false) 
			session=ssf.openSession(true);
			session.insert("databoardInsert",vo);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null) session.close(); // disConnection()
		}
	}
	public static DataBoardVO databoardDetailData(int no) {
		DataBoardVO vo=new DataBoardVO();
		SqlSession session=null; //conn 생성
		try {
			// ssf.openSession() => conn.setAutoCommit(false) 
			session=ssf.openSession();
			session.update("databoardDetailHit",no);
			session.commit();
			vo=session.selectOne("databoardDetailData", no);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null) session.close(); // disConnection()
		}
		return vo;
	}
}
