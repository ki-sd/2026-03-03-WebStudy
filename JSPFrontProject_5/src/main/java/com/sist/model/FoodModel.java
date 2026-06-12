package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.FoodDAO;
import com.sist.vo.*;

import java.io.PrintWriter;
import java.util.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class FoodModel {
	@RequestMapping("food/foodList.do")
	public String foodListData(HttpServletRequest request,HttpServletResponse response) {
		String strpage=request.getParameter("page");
		if(strpage==null)
			strpage="1";
		int curpage=Integer.parseInt(strpage);
		List<FoodVO> list=new ArrayList<FoodVO>();
		list=FoodDAO.foodListData((curpage*12)-12);
		int totalpage=FoodDAO.foodTotalPage();
		
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		
		if(endPage>totalpage)
			endPage=totalpage;
		// jsp
		request.setAttribute("list", list);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("curpage",curpage);
		request.setAttribute("endPage",endPage);
		request.setAttribute("startPage",startPage);
		return "../food/foodList.jsp";
	}
	@RequestMapping("food/foodList_ajax.do")
	public void foodListData_ajax(HttpServletRequest request,HttpServletResponse response) {
		String strpage=request.getParameter("page");
		if(strpage==null)
			strpage="1";
		int curpage=Integer.parseInt(strpage);
		List<FoodVO> list=new ArrayList<FoodVO>();
		list=FoodDAO.foodListData((curpage*12)-12);
		int totalpage=FoodDAO.foodTotalPage();
		
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		
		if(endPage>totalpage)
			endPage=totalpage;
		
		JSONArray arr=new JSONArray(); // List => JS에서 인식
		int i=0;
		for(FoodVO vo:list) {
			// vo와 일치 => JSONObject {} => RestFul
			JSONObject obj=new JSONObject();
			obj.put("fno",vo.getFno());
			obj.put("poster", vo.getPoster());
			obj.put("name", vo.getName());
			if(i==0) {
				obj.put("curpage",curpage);
				obj.put("totalpage", totalpage);
				obj.put("startPage", startPage);
				obj.put("endPage", endPage);
			}
			arr.add(obj);
			i++;
		}
		try
		   {
			   response.setContentType("text/plain;charset=UTF-8");
			   PrintWriter out=response.getWriter(); // 브라우저 찾기
			   out.write(arr.toJSONString());
		   }catch(Exception ex) {}
	}
	@RequestMapping("food/foodDetail.do")
	   // "food/detail.do"이 중복되면 실행 안된다 
	   public String foodDetailData(HttpServletRequest request,HttpServletResponse response)
	   {
		   String fno=request.getParameter("fno");
		   FoodVO vo=FoodDAO.foodDetailData(Integer.parseInt(fno));
		   request.setAttribute("vo", vo);
		   String[] address=vo.getAddress().split(" ");
		   request.setAttribute("addr", address[2]);
		   System.out.println(address[2]);
		   request.setAttribute("rcount", 0);
		   return "../food/foodDetail.jsp";
	   }
}
