package com.sist.service;

import java.util.List;

import com.sist.dao.NoticeDAO;
import com.sist.vo.NoticeVO;

public class NoticeServiceImpl implements NoticeService {
	private NoticeDAO dao=new NoticeDAO();
	@Override
	public void noticeInsert(NoticeVO vo) {
		dao.noticeInsert(vo);
	}
	@Override
	public List<NoticeVO> noticeListData(int start) {
		return dao.noticeListData(start);
	}
	@Override
	public int noticeTotalPage() {
		return dao.noticeTotalPage();
	}
	@Override
	public void noticeDelete(int no) {
		dao.noticeDelete(no);
	}
	@Override
	public NoticeVO noticeDetailData(int no) {
		dao.noticeHitIncrement(no);
		return dao.noticeDetailData(no);
	}
	@Override
	public NoticeVO noticeUpdateDetail(int no) {
		return dao.noticeDetailData(no);
	}
	@Override
	public void noticeUpdateData(NoticeVO vo) {
		dao.noticeUpdateData(vo);
	}

}
