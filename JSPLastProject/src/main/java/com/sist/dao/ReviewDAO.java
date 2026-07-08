package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.commons.CreateSqlSessionFactory;
import com.sist.vo.*;
public class ReviewDAO {
	private static SqlSessionFactory ssf;
	static{
		ssf=CreateSqlSessionFactory.getSsf();
	}
	
}
