package com.sist.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import java.util.*;
import com.sist.commons.CreateSqlSessionFactory;
import com.sist.vo.FoodVO;

public class FoodDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf=CreateSqlSessionFactory.getSsf();
	}
	
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
//	<select id="foodFindListData" resultType="FoodVO" parameterType="hashmap">
//	SELECT fno,name,poster,address
//	FROM food
//	WHERE ${column} LIKE '%'||#{ss}||'%'
//	ORDER BY fno ASC
//	OFFSET #{start} ROWS FETCH NEXT 12 ROWS ONLY
//	</select>
	public static List<FoodVO> foodFindData(Map map){
		SqlSession session=ssf.openSession();
		List<FoodVO> list=session.selectList("foodFindListData",map);
		session.close();
		return list;
	}
//	<select id="foodFindTotalPage" resultType="int" parameterType="hashmap">
//	SELECT CEIL(COUNT(*)/12.0)
//	FROM food
//	WHERE ${column} LIKE '%'||#{ss}||'%'
//	</select>
	public static int foodFindTotalPage(Map map) {
		SqlSession session=ssf.openSession();
		int total=session.selectOne("foodFindTotalPage",map);
		session.close();
		return total;
	}
}
