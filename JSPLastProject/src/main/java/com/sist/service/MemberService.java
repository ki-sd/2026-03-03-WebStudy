package com.sist.service;

import com.sist.vo.MemberVO;

public interface MemberService {
	public void memberInsert(MemberVO vo);
	public int memberIdCheck(String id);
	public MemberVO isLogin(String id,String pwd);
}
