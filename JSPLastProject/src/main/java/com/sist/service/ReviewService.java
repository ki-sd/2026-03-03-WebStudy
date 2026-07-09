package com.sist.service;

import java.util.List;

import com.sist.vo.ReviewVO;

public interface ReviewService {
	public List<ReviewVO> reviewListData(int fno);
	public void insertReview(ReviewVO vo);
	public void deleteReview(int fno);
	public void updateReview(ReviewVO vo);
}
