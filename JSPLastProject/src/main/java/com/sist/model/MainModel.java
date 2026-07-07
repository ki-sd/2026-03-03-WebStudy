package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.service.MainService;
import com.sist.service.MainServiceImpl;
import com.sist.vo.*;
import java.util.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class MainModel {
	MainService service=new MainServiceImpl();
	@RequestMapping("main/main.do")
	public String main_main(HttpServletRequest request,HttpServletResponse response) {
		TourVO tvo=service.mainSeoulOne();
		List<TourVO> blist=service.mainBusanTop4();
		List<TourVO> jlist=service.mainJejuTop4();
		List<FoodVO> flist=service.mainFoodTop7();
		request.setAttribute("tvo", tvo);
		request.setAttribute("blist", blist);
		request.setAttribute("jlist", jlist);
		request.setAttribute("flist", flist);
		request.setAttribute("main_jsp", "../main/home.jsp");
		return "../main/main.jsp";
	}
}
