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
//	<select id="foodListData" resultType="FoodVO" parameterType="int">
//	SELECT no,name,poster,type,phone,likecount,replycount
//	FROM food
//	ORDER BY no
//	OFFSET #{start} ROWS FETCH NEXT 12 ROWS ONLY
//	</select>
	public List<FoodVO> foodListData(int start){
		List<FoodVO> list=new ArrayList<FoodVO>();
		try(SqlSession session=ssf.openSession()){
			list=session.selectList("foodListData",start);
			session.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
//	<select id="foodTotalPage" resultType="int">
//	SELECT CEIL(COUNT(*)/12.0)
//	FROM food
//	</select>
	public int foodTotalPage() {
		int total=0;
		try(SqlSession session=ssf.openSession()){
			total=session.selectOne("foodTotalPage");
			session.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return total;
	}
//	<select id="foodDetailData" resultType="FoodVO" parameterType="int">
//	SELECT *
//	FROM food
//	WHERE no=#{no}
//	</select>
	public FoodVO foodDetailData(int no) {
		FoodVO vo=new FoodVO();
		try(SqlSession session=ssf.openSession()){
			vo=session.selectOne("foodDetailData");
			session.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return vo;
	}
}
