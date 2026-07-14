package com.sist.service;

import java.util.List;

import com.sist.vo.MemberVO;

public interface AdminService {
	public List<MemberVO> memberListData(int start);
	public int memberTotalPage();
	public int memberUpdate(MemberVO vo);
}
