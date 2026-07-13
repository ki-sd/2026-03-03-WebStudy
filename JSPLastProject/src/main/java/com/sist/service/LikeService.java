package com.sist.service;

import com.sist.vo.LikeVO;

public interface LikeService {
	public void likeOn(LikeVO vo);
	public void likeOff(LikeVO vo);
	public int likeCount(int fno);
	public int likeCheck(LikeVO vo);
	public void foodLikeUpdate(int fno);
}
