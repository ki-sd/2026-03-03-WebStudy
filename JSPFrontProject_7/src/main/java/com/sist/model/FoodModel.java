package com.sist.model;

import java.util.*;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.vo.*;
import com.sist.dao.*;

import jakarta.servlet.http.*;

@Controller
public class FoodModel {
	@RequestMapping("food/detail_before.do")
	public String food_detail_before(HttpServletRequest request,HttpServletResponse response) {
		String fno=request.getParameter("fno");
		Cookie cookie=new Cookie("food_"+fno,fno);
		cookie.setMaxAge(60*60*24);
		cookie.setPath("/");
		response.addCookie(cookie);

		return "redirect:../food/detail.do?fno="+fno;
	}
	@RequestMapping("food/detail.do")
	public String food_detail(HttpServletRequest request,HttpServletResponse response) {
		String fno=request.getParameter("fno");
		FoodVO vo=FoodDAO.foodDetailData(Integer.parseInt(fno));
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../food/detail.jsp");
		
		List<ReplyVO> list=ReplyDAO.replyListData(Integer.parseInt(fno));
		request.setAttribute("rList", list);
		request.setAttribute("rcount", list.size());
		return "../main/main.jsp";
	}
}
	
