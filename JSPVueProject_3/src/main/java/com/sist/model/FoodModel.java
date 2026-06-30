package com.sist.model;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.commons.Commons;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.FoodDAO;
import com.sist.service.FoodService;
import com.sist.service.FoodServiceImpl;
import com.sist.vo.FoodVO;

import java.io.PrintWriter;
import java.util.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class FoodModel {
	private FoodService service=new FoodServiceImpl();
	@RequestMapping("food/list.do")
	public String food_list(HttpServletRequest request,HttpServletResponse response) {
		request.setAttribute("main_jsp", "../food/list.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("food/list_vue.do")
	public void food_list_vue(HttpServletRequest request,HttpServletResponse response) {
		try {
			String page=request.getParameter("page");
			int curpage=Integer.parseInt(page);
			final int ROW=12;
			int start=(curpage*ROW)-ROW;
			List<FoodVO> list=service.foodListData(start);
			int totalpage=service.foodTotalPage();
			
			final int BLOCK=10;
			int startPage=((curpage-1)/BLOCK*BLOCK)+1;
			int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
			if(endPage>totalpage) 
				endPage=totalpage;
			
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("startPage", startPage);
			map.put("endPage", endPage);
			map.put("curpage", curpage);
			map.put("totalpage",totalpage);
			map.put("list", list);
			
			ObjectMapper mapper=new ObjectMapper();
			String json=mapper.writeValueAsString(map);
			// @RestController : 자동 jackson사용 => JSON
			
			response.setContentType("text/plain;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.write(json);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	@RequestMapping("food/detail.do")
	public String food_detail(HttpServletRequest request,HttpServletResponse response) {
		String no=request.getParameter("no");
		request.setAttribute("no", no);
		request.setAttribute("cno", 2);
		request.setAttribute("main_jsp", "../food/detail.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("food/detail_vue.do")
	public void food_detail_vue(HttpServletRequest request,HttpServletResponse response) {
		try {
			String no=request.getParameter("no");
			FoodVO vo=service.foodDetailData(Integer.parseInt(no));
			
			ObjectMapper mapper=new ObjectMapper();
			String json=mapper.writeValueAsString(vo);
			Commons.sendData(response, "text/plain", json);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
}
