package com.sist.model;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.service.RecommendService;
import com.sist.service.RecommendServiceImpl;

import java.io.PrintWriter;
import java.util.*;
import com.sist.vo.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class RecommendModel {
	private RecommendService service=new RecommendServiceImpl();
	@RequestMapping("recommend/recommend.do")
	public void recommend(HttpServletRequest request,HttpServletResponse response) {
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		List<FoodVO> list=service.foodRecommendData(id);
		try {
			ObjectMapper mapper=new ObjectMapper();
			String json=mapper.writeValueAsString(list);
			response.setContentType("text/json/charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.write(json);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
}
