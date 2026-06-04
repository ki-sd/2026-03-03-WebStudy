package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.vo.*;
import com.sist.dao.*;

import java.util.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class FoodModel {
	
	@RequestMapping("food/foodDetail.do")
	public String food_detail(HttpServletRequest request,HttpServletResponse response) {
		request.setAttribute("main_jsp", "../food/foodDetail.jsp");
		String fno = request.getParameter("fno");
		
		// 2. DAO를 호출하여 DB에서 상세 데이터 가져오기 (String을 int로 변환)
		FoodVO vo = FoodDAO.foodDetailData(Integer.parseInt(fno));
		
		// 3. JSP(View)에서 사용할 수 있도록 'vo'라는 키값으로 데이터 세팅하기 (가장 핵심!)
		request.setAttribute("vo", vo);
		
		// 4. 화면 전환 처리
		request.setAttribute("main_jsp", "../food/foodDetail.jsp");
		
		// include
		return "../main/main.jsp";
	}
}
