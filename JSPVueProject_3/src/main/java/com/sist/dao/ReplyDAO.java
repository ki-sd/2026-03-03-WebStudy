package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.commons.*;
import com.sist.vo.*;
public class ReplyDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf=CreateSqlSessionFactory.getSsf();
	}
	public List<ReplyVO> replyListData(Map map){
		SqlSession session=ssf.openSession();
		List<ReplyVO> list=session.selectList("replyListData",map);
		session.close();
		return list;
	}
	public void replyInsert(ReplyVO vo) {
		SqlSession session=ssf.openSession();
		session.insert("replyInsert",vo);
		session.commit();
		session.close();
	}
	public void replyDelete(int no) {
		SqlSession session=ssf.openSession();
		session.delete("replyDelete",no);
		session.commit();
		session.close();
	}
	public void replyUpdate(ReplyVO vo) {
		SqlSession session=ssf.openSession();
		session.insert("replyUpdate",vo);
		session.commit();
		session.close();
	}
}
