package com.sist.service;

import java.util.List;
import com.sist.dao.*;
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

}
