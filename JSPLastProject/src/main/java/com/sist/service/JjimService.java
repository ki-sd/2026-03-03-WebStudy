package com.sist.service;

import java.util.List;

import com.sist.vo.JjimVO;

public interface JjimService {
	public int jjimCount(JjimVO vo);
	public void jjimInsert(JjimVO vo);
	public List<JjimVO> jjimListData(String id);
	public void jjimCancel(int jno);
}
