package com.sist.service;

import java.util.List;

import com.sist.dao.ReviewDAO;
import com.sist.vo.ReviewVO;

public class ReviewServiceImpl implements ReviewService {
	private ReviewDAO dao=new ReviewDAO();

	@Override
	public List<ReviewVO> reviewListData(int fno) {
		return dao.reviewListData(fno);
	}
	
	@Override
	public void insertReview(ReviewVO vo) {
		dao.insertReview(vo);
	}

	@Override
	public void deleteReview(int fno) {
		dao.deleteReview(fno);
	}

	@Override
	public void updateReview(ReviewVO vo) {
		dao.updateReview(vo);
	}

}
