package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.commons.*;
import com.sist.vo.*;
public class MemberDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf=CreateSqlSessionFactory.getSsf();
	}
	public static MemberVO memberLogin(String id,String pwd){
		MemberVO vo=new MemberVO();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			int count=session.selectOne("memberIdCount",id);
			if(count==0) {
				vo.setMsg("NOID");
			}else {
				MemberVO dbVO=session.selectOne("memberGetPassword",id);
				if(pwd.equals(dbVO.getPwd())) {
					vo.setId(dbVO.getId());
					vo.setName(dbVO.getName());
					vo.setMsg("OK");
				}else {
					vo.setMsg("NOPWD");
				}
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		session.close();
		return vo;
	}
}
