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

	@Override
	public boolean boardDelete(int no, String pwd) {
		boolean bCheck=false;
		String db_pwd=dao.getPassword(no);
		if(db_pwd.equals(pwd)) {
			bCheck=true;
			dao.boardDelete(no);
		}
		return bCheck;
	}

	@Override
	public BoardVO boardUpdateDetail(int no) {
		return dao.boardDetailData(no);
	}

	@Override
	public boolean boardUpdate(BoardVO vo) {
		boolean bCheck=false;
		String db_pwd=dao.getPassword(vo.getNo());
		if(db_pwd.equals(vo.getPwd())) {
			bCheck=true;
			dao.boardUpdate(vo);
		}
		return bCheck;
	}

}
