package com.sist.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import java.util.*;
import com.sist.commons.CreateSqlSessionFactory;
import com.sist.vo.*;
public class MemberDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf=CreateSqlSessionFactory.getSsf();
	}
	public MemberVO isLogin(String id,String pwd) {
		SqlSession session=ssf.openSession();
		MemberVO vo=new MemberVO();
		int count=session.selectOne("memberIdCount",id);
		if(count==0) {
			vo.setMsg("NOID");
		}else {
			MemberVO dbVO=session.selectOne("memberInfoData",id);
			if(pwd.equals(dbVO.getPwd())) {
				vo.setMsg("OK");
				vo.setId(dbVO.getId());
				vo.setName(dbVO.getName());
				vo.setIsAdmin(dbVO.getIsAdmin());
			}else {
				vo.setMsg("NOPWD");
			}
		}
		session.close();
		return vo;
	}
}
