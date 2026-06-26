package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.commons.*;
import com.sist.vo.*;
public class BoardDAO {
	private static SqlSessionFactory ssf;
	static{
		ssf=CreateSqlSessionFactory.getSsf();
	}
	public List<BoardVO> boardListData(int start){
		SqlSession session=ssf.openSession();
		List<BoardVO> list=session.selectList("boardListData",start);
		session.close();
		return list;
	}
	public int boardRowCount() {
		SqlSession session=ssf.openSession();
		int row=session.selectOne("boardRowCount");
		session.close();
		return row;
	}
	public void boardInsert(BoardVO vo) {
		SqlSession session=ssf.openSession();
		try {
		session.insert("boardInsert",vo);
		session.commit();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		session.close();
	}
	public BoardVO boardDetailData(int no) {
		SqlSession session=ssf.openSession();
		session.update("hitIncrement",no);
		BoardVO vo=session.selectOne("boardDetailData",no);
		session.commit();
		session.close();
		return vo;
	}
	public String getPassword(int no) {
		SqlSession session=ssf.openSession();
		String dbPwd=session.selectOne("boardGetPassword",no);
		session.close();
		return dbPwd;
	}
	public void boardDelete(int no) {
		SqlSession session=ssf.openSession();
		session.delete("boardDelete",no);
		session.commit();
		session.close();
	}
	public BoardVO boardUpdateDetail(int no) {
		SqlSession session=ssf.openSession();
		BoardVO vo=session.selectOne("boardDetailData",no);
		session.close();
		return vo;
	}
	public void boardUpdate(BoardVO vo) {
		SqlSession session=ssf.openSession();
		session.update("boardUpdate",vo);
		session.commit();
		session.close();
	}
}
