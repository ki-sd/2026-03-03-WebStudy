package com.sist.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import java.util.*;
import com.sist.commons.CreateSqlSessionFactory;
import com.sist.vo.*;

public class MainDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf=CreateSqlSessionFactory.getSsf();
	}
//	<select id="mainSeoulOne" resultType="TourVO">
//	SELECT contentid,firstimage,addr1,likecount,replycount,rownum
//	FROM (SELECT contentid,firstimage,addr1,likecount,replycount
//		FROM tour
//		WHERE areacode=1 AND contenttypeid=12
//		ORDER BY hit DESC
//		)
//	WHERE rownum=1
//	</select>
	public TourVO mainSeoulOne() {
		TourVO vo=new TourVO();
		try(SqlSession session=ssf.openSession()){
			vo=session.selectOne("mainSeoulOne");
			session.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return vo;
	}
//	<select id="mainBusanTop4" resultType="TourVO">
//		SELECT contentid,firstimage,addr1,likecount,replycount,rownum
//		FROM (SELECT contentid,firstimage,addr1,likecount,replycount
//			FROM tour
//			WHERE areacode=6 AND contenttypeid=12
//			ORDER BY hit DESC
//			)
//		WHERE rownum&lt;=4
//	</select>
	public List<TourVO> mainBusanTop4(){
		List<TourVO> list=new ArrayList<TourVO>();
		try(SqlSession session=ssf.openSession()){
			list=session.selectList("mainBusanTop4");
			session.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
//	<select id="mainJejuTop4" resultType="TourVO">
//		SELECT contentid,firstimage,addr1,likecount,replycount,rownum
//		FROM (SELECT contentid,firstimage,addr1,likecount,replycount
//			FROM tour
//			WHERE areacode=39 AND contenttypeid=12
//			ORDER BY hit DESC
//			)
//		WHERE rownum&lt;=4
//	</select>
	public List<TourVO> mainJejuTop4(){
		List<TourVO> list=new ArrayList<TourVO>();
		try(SqlSession session=ssf.openSession()){
			list=session.selectList("mainJejuTop4");
			session.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
//	<select id="mainFoodTop7" resultType="FoodVO">
//		SELECT no,name,type,poster,likecount,replycount,address,rownum
//		FROM (SELECT no,name,type,poster,likecount,replycount,address
//			FROM food
//			ORDER BY hit DESC
//			)
//		WHERE rownum&lt;=7
//	</select>
	public List<FoodVO> mainFoodTop7(){
		List<FoodVO> list=new ArrayList<FoodVO>();
		try(SqlSession session=ssf.openSession()){
			list=session.selectList("mainFoodTop7");
			session.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
}
