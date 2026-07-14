package com.sist.service;

import java.util.List;

import com.sist.dao.JjimDAO;
import com.sist.vo.JjimVO;

public class JjimServiceImpl implements JjimService {
	private JjimDAO dao=new JjimDAO();
	@Override
	public int jjimCount(JjimVO vo) {
		return dao.jjimCount(vo);
	}
	@Override
	public void jjimInsert(JjimVO vo) {
		dao.jjimInsert(vo);
	}
	@Override
	public List<JjimVO> jjimListData(String id) {
		return dao.jjimListData(id);
	}
	@Override
	public void jjimCancel(int jno) {
		dao.jjimCancel(jno);
	}

}
