package com.sist.service;

import java.util.*;

import com.sist.dao.ReplyDAO;
import com.sist.vo.ReplyVO;

public class ReplyServiceImpl implements ReplyService {
	ReplyDAO dao=new ReplyDAO();
	@Override
	public List<ReplyVO> replyListData(Map map) {
		return dao.replyListData(map);
	}

	@Override
	public void replyInsert(ReplyVO vo) {
		dao.replyInsert(vo);
	}

	@Override
	public void replyDelete(int no) {
		dao.replyDelete(no);
	}
	
	@Override
	public void replyUpdate(ReplyVO vo) {
		dao.replyUpdate(vo);
	}
}
