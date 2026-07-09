package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.service.FoodService;
import com.sist.service.FoodServiceImpl;
import com.sist.service.ReviewService;
import com.sist.service.ReviewServiceImpl;
import com.sist.vo.*;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.*;
@Controller
public class FoodModel {
	private FoodService service=new FoodServiceImpl();
	private ReviewService Rservice=new ReviewServiceImpl();
	@RequestMapping("food/food_main.do")
	public String food_main(HttpServletRequest request,HttpServletResponse response) {
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		final int ROWSIZE=12;
		int start=(curpage*ROWSIZE)-ROWSIZE;
		List<FoodVO> list=service.foodListData(start);
		int totalpage=service.foodTotalPage();
		
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
			endPage=totalpage;
		
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		request.setAttribute("food_jsp", "../food/list.jsp");
		request.setAttribute("main_jsp", "../food/food_main.jsp");
		
		List<FoodVO> cList=new ArrayList<FoodVO>();
		Cookie[] cookies=request.getCookies();
		if(cookies!=null) {
			for(int i=cookies.length-1;i>=0;i--) {
				if(cookies[i].getName().startsWith("food_")) {
					String no=cookies[i].getValue();
					if(no!=null) {
						FoodVO vo=service.foodCookieData(Integer.parseInt(no));
						cList.add(vo);
					}
				}
			}
		}
		request.setAttribute("cList", cList);
		return "../main/main.jsp";
	}
	@RequestMapping("food/detail_before.do")
	public String food_detail_before(HttpServletRequest request,HttpServletResponse response) {
		String no=request.getParameter("no");
		Cookie[] cookies=request.getCookies();
		if(cookies!=null) {
			for(int i=0;i<cookies.length;i++) {
				if(cookies[i].getName().equals("food_"+no)) {
					cookies[i].setPath("/");
					cookies[i].setMaxAge(0);
					response.addCookie(cookies[i]);
					break;
				}
			}
		}
		Cookie cookie=new Cookie("food_"+no, no);
		cookie.setMaxAge(60*60*24);
		cookie.setPath("/");
		response.addCookie(cookie);
		return "redirect:../food/detail.do?no="+no;
	}
	@RequestMapping("food/detail.do")
	public String food_detail(HttpServletRequest request,HttpServletResponse response) {
		String strno=request.getParameter("no");
		int no=Integer.parseInt(strno);
		FoodVO vo=service.foodDetailData(no);
		
		request.setAttribute("vo", vo);
		request.setAttribute("food_jsp", "../food/detail.jsp");
		request.setAttribute("main_jsp", "../food/food_main.jsp");
		
		List<ReviewVO> list=Rservice.reviewListData(no);
		request.setAttribute("reList", list);
		int rCount=list.size();
		request.setAttribute("rCount", rCount);
		
		return "../main/main.jsp";
	}
	@RequestMapping("food/find.do")
	public String food_find(HttpServletRequest request,HttpServletResponse response) {
		request.setAttribute("food_jsp", "../food/find.jsp");
		request.setAttribute("main_jsp", "../food/food_main.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("food/find_vue.do")
	public String food_find_vue(HttpServletRequest request,HttpServletResponse response) {
		String page=request.getParameter("page");
		String column=request.getParameter("column");
		String fd=request.getParameter("fd");
		int curpage=Integer.parseInt(page);
		final int ROWSIZE=12;
		int start=(curpage*ROWSIZE)-ROWSIZE;
		
		return "../main/main.jsp";
	}
}
