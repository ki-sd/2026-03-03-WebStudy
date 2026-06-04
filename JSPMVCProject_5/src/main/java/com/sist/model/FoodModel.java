package com.sist.model;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.sist.dao.*;
import com.sist.vo.*;
import java.util.*;

@Controller
public class FoodModel {
	// 1. 목록
	   @RequestMapping("main/main.do")
	   public String food_list(HttpServletRequest request,
			   HttpServletResponse response)
	   {
		   // 사용자 보낸 데이터 받기 => page
		   String page=request.getParameter("page");
		   if(page==null)
			   page="1";
		   // 현재 페이지 지정 
		   int curpage=Integer.parseInt(page);
		   // 해당 페이지의 목록 가지고 오기 
		   int start=(curpage*12)-12;
		   List<FoodVO> list=FoodDAO.foodListData(start);
		   int totalpage=FoodDAO.foodTotalPage();
		   
		   // 브라우저(JSP)에서 출력할 데이터 전송 
		   request.setAttribute("list", list);
		   request.setAttribute("totalpage", totalpage);
		   request.setAttribute("curpage", curpage);
		   
		   // include하는 JSP 확인 
		   request.setAttribute("main_jsp", "../food/list.jsp");
		   // 실제 화면 출력 
		   return "../main/main.jsp";
	   }
	   // 2. 상세보기 
	   @RequestMapping("food/detail.do")
	   public String food_detail(HttpServletRequest request,
			   HttpServletResponse response)
	   {
		   String msg="맛집 상세 보기";
		   // 데이터베이스 연동 
		   request.setAttribute("msg", msg); // 출력할 데이터 전송 
		   // include하는 JSP 확인 
		   request.setAttribute("main_jsp", "../food/detail.jsp");
		   // 실제 화면 출력 
		   return "../main/main.jsp";
	   }
	   // 기타 : 좋아요 / 찜하기 / 예약하기 / 추천 / 근처 맛집 / 길찾기 / 검색 ...
}
