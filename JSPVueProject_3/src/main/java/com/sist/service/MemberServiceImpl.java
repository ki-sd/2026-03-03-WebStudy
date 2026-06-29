package com.sist.service;
import com.sist.dao.*;
import com.sist.vo.*;
public class MemberServiceImpl implements MemberService {
	MemberDAO dao=new MemberDAO();
	@Override
	public MemberVO isLogin(String id, String pwd) {
		return dao.isLogin(id, pwd);
	}

}
