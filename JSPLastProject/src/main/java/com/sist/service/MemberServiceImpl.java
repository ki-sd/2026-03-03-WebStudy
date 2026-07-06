package com.sist.service;

import com.sist.dao.MemberDAO;
import com.sist.vo.MemberVO;

public class MemberServiceImpl implements MemberService {
	private MemberDAO dao=new MemberDAO();
	@Override
	public void memberInsert(MemberVO vo) {
		dao.memberInsert(vo);
	}

	@Override
	public int memberIdCheck(String id) {
		return dao.memberIdCheck(id);
	}

	@Override
	public MemberVO isLogin(String id, String pwd) {
		MemberVO vo=new MemberVO();
		int count=dao.memberIdCheck(id);
		if(count==0) {
			vo.setMsg("NOID");
		}
		else {
			MemberVO dbVO=dao.isLogin(id);
			if(dbVO.getPwd().equals(pwd)){
				vo.setMsg("OK");
				vo.setId(dbVO.getId());
				vo.setName(dbVO.getName());
				vo.setSex(dbVO.getSex());
				vo.setPhone(dbVO.getPhone());
				vo.setAddr1(dbVO.getAddr1());
				vo.setAddr2(dbVO.getAddr2());
				vo.setPost(dbVO.getPost());
				vo.setEmail(dbVO.getEmail());
				vo.setAdmin(dbVO.getAdmin());
			}else {
				vo.setMsg("NOPWD");
			}
		}
		return vo;
	}

}
