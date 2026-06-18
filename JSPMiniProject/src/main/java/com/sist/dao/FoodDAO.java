package com.sist.dao;
import java.util.*;
import com.sist.commons.*;
import com.sist.vo.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
public class FoodDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf=CreateSqlSessionFactory.getSsf();
	}
//	<select id="foodListData" resultType="FoodVO" parameterType="int">
//	SELECT fno,name,poster,address,phone,likecount,replycount,theme,content
//	FROM food
//	ORDER BY fno ASC
//	OFFSET #{start} ROWS FETCH NEXT 12 ROWS ONLY
//	</select>
	public static List<FoodVO> foodListData(int start){
		SqlSession session=ssf.openSession();
		List<FoodVO> list=session.selectList("foodListData",start);
		session.close();
		return list;
	}
//	<select id="foodTotalPage" resultType="int">
//	SELECT CEIL(COUNT(*)/12.0)
//	FROM food
//	</select>
	public static int foodTotalPage() {
		SqlSession session=ssf.openSession();
		int total=session.selectOne("foodTotalPage");
		session.close();
		return total;
	}
	public static FoodVO foodDetailData(int fno) {
		SqlSession session=ssf.openSession();
		session.update("foodHitIncrement",fno);
		FoodVO vo=session.selectOne("foodDetailData",fno);
		session.commit();
		session.close();
		return vo;
	}
	public static List<FoodVO> foodNearData(String address){
		SqlSession session=ssf.openSession();
		List<FoodVO> list=session.selectList("foodNearData",address);
		session.close();
		return list;
	}
}
