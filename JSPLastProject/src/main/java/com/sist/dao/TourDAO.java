package com.sist.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import java.util.*;
import com.sist.commons.CreateSqlSessionFactory;
import com.sist.vo.TourVO;

public class TourDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf=CreateSqlSessionFactory.getSsf();
	}
	public List<TourVO> travelListData(Map map){
		SqlSession session=ssf.openSession();
		List<TourVO> list=session.selectList("travelListData",map);
		session.close();
		return list;
	}
	public int travelTotalPage(Map map) {
		SqlSession session=ssf.openSession();
		int total=session.selectOne("travelTotalPage",map);
		session.close();
		return total;
	}
}
