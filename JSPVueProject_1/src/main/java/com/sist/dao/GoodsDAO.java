package com.sist.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import java.util.*;
import com.sist.vo.*;
import com.sist.commons.CreateSqlSessionFactory;

public class GoodsDAO {
	private static SqlSessionFactory ssf;
	static{
		ssf=CreateSqlSessionFactory.getSsf();
	}
//	<select id="goodsListData" resultType="FoodVO" parameterType="int">
//	SELECT no,goods_name,goods_poster,goods_price
//	FROM goods_all
//	ORDER BY no ASC
//	OFFSET #{start} ROWS FETCH NEXT 12 ROWS ONLY
//	</select>
	public List<GoodsVO> goodsListData(int start) {
		SqlSession session=ssf.openSession();
		List<GoodsVO> list=session.selectList("goodsListData",start);
		session.close();
		return list;
	}
//	<select id="goodsTotalPage" resultType="int">
//	SELECT CEIL(COUNT(*)/12.0)
//	FROM goods_all
//	</select>
	public int goodsTotalPage() {
		SqlSession session=ssf.openSession();
		int total=session.selectOne("goodsTotalPage");
		session.close();
		return total;
	}
}
