package com.sist.model;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.service.AdminService;
import com.sist.service.AdminServiceImpl;
import com.sist.vo.MemberVO;

import java.io.PrintWriter;
import java.util.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class AdminPageModel {
	private AdminService service=new AdminServiceImpl();
	@RequestMapping("adminpage/adminpage_main.do")
	public String adminpage_main(HttpServletRequest request,HttpServletResponse response) {
		request.setAttribute("admin_jsp", "../adminpage/admin_home.jsp");
		return "../adminpage/admin_main.jsp";
	}
	@RequestMapping("adminpage/member_list.do")
	public String adminpage_member_list(HttpServletRequest request,HttpServletResponse response) {
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		final int ROW=10;
		int start=(curpage*ROW)-ROW;
		int totalpage=service.memberTotalPage();
		List<MemberVO> list=service.memberListData(start);
		request.setAttribute("mList", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("admin_jsp", "../adminpage/member_list.jsp");
		return "../adminpage/admin_main.jsp";
	}
	@RequestMapping("adminpage/member_update.do")
	public void member_update(HttpServletRequest request,HttpServletResponse response) {
		String id=request.getParameter("id");
		String grade=request.getParameter("grade");
		MemberVO vo=new MemberVO();
		vo.setId(id);
		vo.setGrade(Integer.parseInt(grade));
		int count=service.memberUpdate(vo);
		try {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.write(String.valueOf(count));
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
}
