package com.sist.service;

import com.sist.dao.LikeDAO;
import com.sist.vo.LikeVO;

public class LikeServiceImpl implements LikeService {
	private LikeDAO dao=new LikeDAO();
	@Override
	public void likeOn(LikeVO vo) {
		dao.likeOn(vo);
	}

	@Override
	public void likeOff(LikeVO vo) {
		dao.likeOff(vo);
	}

	@Override
	public int likeCount(int fno) {
		return dao.likeCount(fno);
	}

	@Override
	public int likeCheck(LikeVO vo) {
		return dao.likeCheck(vo);
	}

	@Override
	public void foodLikeUpdate(int fno) {
		dao.foodLikeUpdate(fno);
	}

}
