package com.sist.dao;

import java.io.Reader;
import java.util.*;
import com.sist.vo.*;


import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

//SELECT fno,poster,name
//FROM food
//ORDER BY fno
//OFFSET #{start} ROWS FETCH NEXT 12 ROWS ONLY
public class FoodDAO {
	private static SqlSessionFactory ssf;
	static {
		try {
			Reader reader=Resources.getResourceAsReader("config.xml");
			ssf=new SqlSessionFactoryBuilder().build(reader);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	public static List<FoodVO> foodListData(int start) {
		List<FoodVO> list=new ArrayList<FoodVO>();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("foodListData",start);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		return list;
	}
	public static int foodTotalPage() {
		int total=0;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			total=session.selectOne("foodTotalPage");
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		return total;
	}
	public static FoodVO foodDetailData(int fno)
	  {
		  SqlSession session=ssf.openSession();
		  // => connection을 이용해서 => ps/rs
		  FoodVO vo=session.selectOne("foodDetailData",fno);
		  session.close();
		  return vo;
	  }
}
