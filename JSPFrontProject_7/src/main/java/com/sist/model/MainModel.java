package com.sist.model;

import java.io.*;
import java.util.*;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class MainModel {
	@RequestMapping("main/main.do")
	public String main_main(HttpServletRequest request,HttpServletResponse response) {
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		List<FoodVO> list=FoodDAO.foodListData((curpage*12)-12);
		int totalpage=FoodDAO.foodTotalPage();
		
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
			endPage=totalpage;
		
		request.setAttribute("curpage", curpage);
		request.setAttribute("list", list);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("main_jsp", "../food/list.jsp");
		
		
		Cookie[] cookies=request.getCookies();
		List<FoodVO> cList=new ArrayList<FoodVO>();
		int j=0;
		if(cookies!=null) {
			for(int i=cookies.length-1;i>=0;i--) {
				if(cookies[i].getName().startsWith("food_")) {
					if(j>=9) break;
					// getName() => key읽기
					String no=cookies[i].getValue();
					FoodVO vo = FoodDAO.foodDetailData(Integer.parseInt(no));
					cList.add(vo);
					j++;
				}
			}
		}
		request.setAttribute("cList", cList);
		request.setAttribute("size", cList.size());
		
		return "../main/main.jsp";
	}
	@RequestMapping("member/login.do")
	public void member_login(HttpServletRequest request,HttpServletResponse response) {
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		MemberVO vo=MemberDAO.memberLogin(id, pwd);
		if(vo.getMsg().equals("OK")) {
			HttpSession session=request.getSession();
			session.setAttribute("id", vo.getId());
			session.setAttribute("name", vo.getName());
		}
		try {
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out=response.getWriter();
			out.println(vo.getMsg());
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	@RequestMapping("member/logout.do")
	public void member_logout(HttpServletRequest request,HttpServletResponse response) {
		HttpSession session=request.getSession();
		session.invalidate();
		try {
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out=response.getWriter();
			out.println("yes");
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
}
