package com.sist.service;

import java.util.List;

import com.sist.dao.AdminDAO;
import com.sist.vo.MemberVO;

public class AdminServiceImpl implements AdminService {
	private AdminDAO dao=new AdminDAO();
	@Override
	public List<MemberVO> memberListData(int start) {
		return dao.memberListData(start);
	}

	@Override
	public int memberTotalPage() {
		return dao.memberTotalPage();
	}

	@Override
	public int memberUpdate(MemberVO vo) {
		return dao.memberUpdate(vo);
	}

}
