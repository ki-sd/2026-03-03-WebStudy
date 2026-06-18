package com.sist.model;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class FoodModel {
	@RequestMapping("food/list.do")
	public String food_list(HttpServletRequest request,HttpServletResponse response) {
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		final int ROWSIZE=12;
		int start=(curpage*ROWSIZE)-ROWSIZE;
		List<FoodVO> list=FoodDAO.foodListData(start);
		int totalpage=FoodDAO.foodTotalPage();
		
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
		request.setAttribute("main_jsp", "../food/list.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("food/detail_before.do")
	public String food_detail_before(HttpServletRequest request,HttpServletResponse response) {
		String fno=request.getParameter("fno");
		Cookie cookie=new Cookie("food_"+fno, fno);
		cookie.setPath("/");
		cookie.setMaxAge(60*60*24);
		// 브라우저로 전송
		response.addCookie(cookie);
		return "redirect:../food/detail.do?fno="+fno;
	}
	@RequestMapping("food/detail.do")
	public String food_detail(HttpServletRequest request,HttpServletResponse response) {
		String fno=request.getParameter("fno");
		FoodVO vo=FoodDAO.foodDetailData(Integer.parseInt(fno));
		String[] addrs=vo.getAddress().split(" ");
		List<FoodVO> nlist=FoodDAO.foodNearData(addrs[2]);
		request.setAttribute("vo", vo);
		request.setAttribute("nlist", nlist);
		request.setAttribute("main_jsp", "../food/detail.jsp");
		return "../main/main.jsp";
	}
}
