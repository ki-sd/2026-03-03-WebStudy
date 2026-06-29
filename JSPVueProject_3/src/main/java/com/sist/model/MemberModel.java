package com.sist.model;

import com.sist.commons.Commons;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.service.MemberService;
import com.sist.service.MemberServiceImpl;
import com.sist.vo.MemberVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class MemberModel {
	MemberService service=new MemberServiceImpl();
	@RequestMapping("member/login.do")
	public void member_login(HttpServletRequest request,HttpServletResponse response) {
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		MemberVO vo=service.isLogin(id, pwd);
		if(vo.getMsg().equals("OK")) {
			HttpSession session=request.getSession();
			session.setAttribute("id", vo.getId());
			session.setAttribute("name", vo.getName());
			session.setAttribute("isAdmin", vo.getIsadmin());
		}
		Commons.sendData(response, "text/html", vo.getMsg());
	}
	@RequestMapping("member/logout.do")
	public void member_logout(HttpServletRequest request,HttpServletResponse response) {
		
	}
}
