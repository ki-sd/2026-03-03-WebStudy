package com.sist.dao;


import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.commons.*;
import com.sist.vo.FoodVO;
public class FoodDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf=CreateSqlSessionFactory.getSsf();
	}
	/*
	<select id="foodListData" resultType="FoodVO" parameterType="int">
		SELECT fno,name,poster,address
		FROM food
		ORDER BY fno ASC
		OFFSET #{start} ROWS FETCH NEXT 12 ROWS ONLY
	</select>
	<select id="foodTotalPage" resultType="int">
		SELECT CEIL(COUNT(*)/12.0)
		FROM food
	</select>
	<select id="foodDetailData" resultType="FoodVO" parameterType="int">
		SELECT *
		FROM food
		WHERE fno=#{fno}
	</select>
	 */
	public static List<FoodVO> foodListData(int start){
		SqlSession session=ssf.openSession();
		List<FoodVO> list=session.selectList("foodListData",start);
		session.close();
		return list;
	}
	public static int foodTotalPage() {
		SqlSession session=ssf.openSession();
		int total=session.selectOne("foodTotalPage");
		session.close();
		return total;
	}
	public static FoodVO foodDetailData(int fno) {
		SqlSession session=ssf.openSession();
		FoodVO vo=session.selectOne("foodDetailData",fno);
		session.close();
		return vo;
	}
}
