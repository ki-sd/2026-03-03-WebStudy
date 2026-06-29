package com.sist.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import java.util.*;
import com.sist.vo.*;
import com.sist.commons.CreateSqlSessionFactory;

public class GoodsDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf=CreateSqlSessionFactory.getSsf();
	}
	public List<GoodsVO> goodsListData(int start){
		SqlSession session=ssf.openSession();
		List<GoodsVO> list=session.selectList("goodsListData",start);
		session.close();
		return list;
	}
	public int goodsTotalPage() {
		SqlSession session=ssf.openSession();
		int total=session.selectOne("goodsTotalPage");
		session.close();
		return total;
	}
	public GoodsVO goodsDetailData(int no) {
		SqlSession session=ssf.openSession();
		session.update("goodsHitIncrement",no);
		GoodsVO vo=session.selectOne("goodsDetailData",no);
		session.commit();
		session.close();
		return vo;
	}
}
