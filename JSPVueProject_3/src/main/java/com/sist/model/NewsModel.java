package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.manager.NewsManager;
import com.sist.vo.NewsVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.*;
@Controller
public class NewsModel {
	@RequestMapping("news/find.do")
	public String news_news(HttpServletRequest request,HttpServletResponse response) {
		String fd=request.getParameter("fd");
		if(fd==null)
			fd="축구";
		List<NewsVO> list=NewsManager.newsFindData(fd);
		request.setAttribute("main_jsp", "../news/find.jsp");
		request.setAttribute("list", list);
		return "../main/main.jsp";
	}
}
