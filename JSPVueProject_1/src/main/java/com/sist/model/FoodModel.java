package com.sist.model;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.FoodDAO;
import com.sist.vo.FoodVO;

import java.io.PrintWriter;
import java.util.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class FoodModel {
	@RequestMapping("food/list.do")
	public String food_list(HttpServletRequest request,HttpServletResponse response) {
		return "../food/list.jsp";
	}
	@RequestMapping("food/list_vue.do")
	public void food_list_vue(HttpServletRequest request,HttpServletResponse response) {
		try {
			String page=request.getParameter("page");
			int curpage=Integer.parseInt(page);
			final int ROW=12;
			int start=(curpage*ROW)-ROW;
			List<FoodVO> list=FoodDAO.foodListData(start);
			int totalpage=FoodDAO.foodTotalPage();
			
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
			map.put("food_list", list);
			
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
		return "../food/detail.jsp";
	}
	@RequestMapping("food/detail_vue.do")
	public void food_detail_vue(HttpServletRequest request,HttpServletResponse response) {
		try {
			String no=request.getParameter("no");
			FoodVO vo=FoodDAO.foodDetailData(Integer.parseInt(no));
			
			ObjectMapper mapper=new ObjectMapper();
			String json=mapper.writeValueAsString(vo);
			response.setContentType("text/plain;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.write(json);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	@RequestMapping("food/find.do")
	public String food_find(HttpServletRequest request,HttpServletResponse response) {
		return "../food/find.jsp";
	}
	@RequestMapping("food/find_vue.do")
	public void food_find_vue(HttpServletRequest request,HttpServletResponse response) {
		try {
			String page=request.getParameter("page");
			int curpage=Integer.parseInt(page);
			final int ROW=12;
			int start=(curpage*ROW)-ROW;
			String column=request.getParameter("column");
			String ss=request.getParameter("ss");
			
			Map<String,Object> map=new HashMap<String, Object>();
			map.put("start", start);
			map.put("column", column);
			map.put("ss", ss);
			
			List<FoodVO> list=FoodDAO.foodFindData(map);
			int totalpage=FoodDAO.foodFindTotalPage(map);
			
			final int BLOCK=10;
			int startPage=((curpage-1)/BLOCK*BLOCK)+1;
			int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
			if(endPage>totalpage) 
				endPage=totalpage;
			
			Map<String,Object> result=new HashMap<String,Object>();
			result.put("startPage", startPage);
			result.put("endPage", endPage);
			result.put("curpage", curpage);
			result.put("totalpage",totalpage);
			result.put("find_list", list);
			
			ObjectMapper mapper=new ObjectMapper();
			String json=mapper.writeValueAsString(result);
			// @RestController : 자동 jackson사용 => JSON
			
			response.setContentType("text/plain;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.write(json);
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
}
