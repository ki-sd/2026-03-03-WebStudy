package com.sist.service;

import java.util.List;

import com.sist.vo.NoticeVO;

public interface NoticeService {
	public void noticeInsert(NoticeVO vo);
	public List<NoticeVO> noticeListData(int start);
	public int noticeTotalPage();
}
