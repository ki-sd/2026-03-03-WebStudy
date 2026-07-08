package com.sist.service;

import java.util.*;

import com.sist.dao.BoardDAO;
import com.sist.vo.BoardVO;

public class BoardServiceImpl implements BoardService {
	private BoardDAO dao=new BoardDAO();

	@Override
	public List<BoardVO> boardListData(int start) {
		return dao.boardListData(start);
	}

	@Override
	public int boardRowCount() {
		return dao.boardRowCount();
	}

	@Override
	public void boardInsert(BoardVO vo) {
		dao.boardInsert(vo);
	}

	@Override
	public BoardVO boardDetailData(int no) {
		return dao.boardDetailData(no);
	}

	@Override
	public String boardDelete(int no,String pwd) {
		String dbPwd=dao.boardGetPassword(no);
		String msg="";
		if(pwd.equals(dbPwd)) {
			dao.boardDelete(no);
			msg="yes";
		}else {
			msg="no";
		}
		return msg;
	}

	@Override
	public String boardUpdate(BoardVO vo,String pwd) {
		String dbPwd=dao.boardGetPassword(vo.getNo());
		String msg="";
		if(pwd.equals(dbPwd)) {
			dao.boardUpdate(vo);
			msg="yes";
		}else {
			msg="no";
		}
		return msg;
	}
}
