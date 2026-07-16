package com.sist.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.sist.vo.*;
import java.util.*;
import com.sist.commons.CreateSqlSessionFactory;

public class RecommendDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf=CreateSqlSessionFactory.getSsf();
	}
//	<select id="foodGetType" resultType="string" parameterType="string">
//		SELECT type
//		FROM food
//		WHERE no=(
//		        SELECT no
//		        FROM (
//		            SELECT no,COUNT(*) AS review_cnt
//		            FROM foodReview
//		            WHERE id=#{id}
//		            GROUP BY no
//		            ORDER BY review_cnt DESC
//		            )
//		        WHERE rownum=1
//		    )
//	</select>
	public String foodGetType(String id) {
		SqlSession session=ssf.openSession();
		String type=session.selectOne("foodGetType",id);
		session.close();
		return type;
	}
//	<select id="memberGetAddress" resultType="string" parameterType="string">
//		SELECT addr1
//		FROM member1
//		WHERE id=#{id}
//	</select>
	public String memberGetAddress(String id) {
		SqlSession session=ssf.openSession();
		String address=session.selectOne("memberGetAddress",id);
		session.close();
		return address;
	}
//	<select id="foodRecommendData" resultType="FoodVO" parameterType="hashmap">
//		SELECT * 
//		FROM 
//		    (SELECT * FROM food
//		    WHERE type LIKE '%'||#{type}||'%' 
//		    AND address LIKE '%'||#{address}||'%'
//		    ORDER BY score DESC
//		    )
//		WHERE rownum&lt;=5
//	</select>
	public List<FoodVO> foodRecommendData(Map map) {
		SqlSession session=ssf.openSession();
		List<FoodVO> list=session.selectList("foodRecommendData",map);
		session.close();
		return list;
	}
}
