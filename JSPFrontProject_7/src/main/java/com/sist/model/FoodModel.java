package com.sist.model;

import java.io.PrintWriter;
import java.util.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.vo.*;
import com.sist.dao.*;

import jakarta.servlet.http.*;
import oracle.sql.json.OracleJsonArray;

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
	// 화면 변경
	@RequestMapping("food/find.do")
	public String food_find(HttpServletRequest request,HttpServletResponse response) {
		request.setAttribute("main_jsp", "../food/find.jsp");
		return "../main/main.jsp";
	}
	// 변경된 화면에서 작업
	@RequestMapping("food/find_ajax.do")
	public void food_find_ajax(HttpServletRequest request,HttpServletResponse response) {
		String fd=request.getParameter("fd");
		if(fd==null)
			fd="마포";
		String col=request.getParameter("col");
		if(col==null)
			col="address";
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		Map map=new HashMap<>();
		map.put("fd", fd);
		map.put("column", col);
		map.put("start", (curpage*12)-12);
		List<FoodVO> list=FoodDAO.foodFindData(map);
		int totalpage=FoodDAO.foodFindTotalPage(map);
		
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
			endPage=totalpage;
		//JSON으로 변경 후 전송
		try {
			// List => JSONArray
			// VO   => JSONObject
			JSONArray arr=new JSONArray();
			int j=0;
			for(FoodVO vo:list) {
				JSONObject obj=new JSONObject();
				obj.put("fno",vo.getFno());
				obj.put("name",vo.getName());
				obj.put("poster",vo.getPoster());
				obj.put("address", vo.getAddress());
				if(j==0) {
					obj.put("curpage", curpage);
					obj.put("totalpage", totalpage);
					obj.put("startPage", startPage);
					obj.put("endPage", endPage);
				}
				arr.add(obj);
				j++;
			}
			// arr에 있는 데이터를 Ajax => Restful
			response.setContentType("text/plain;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.write(arr.toJSONString());
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	@RequestMapping("food/movie.do")
	public String food_movie(HttpServletRequest request,HttpServletResponse response) {
		request.setAttribute("main_jsp", "../food/movie.jsp");
		return "../main/main.jsp";
	}
}
	
