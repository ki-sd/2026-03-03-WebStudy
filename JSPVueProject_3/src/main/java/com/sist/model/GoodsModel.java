package com.sist.model;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.commons.Commons;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.service.GoodsService;
import com.sist.service.GoodsServiceImpl;
import com.sist.vo.GoodsVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.*;
@Controller
public class GoodsModel {
	private GoodsService service=new GoodsServiceImpl();
	@RequestMapping("goods/list.do")
	public String goods_list(HttpServletRequest request,HttpServletResponse response) {
		return "../goods/list.jsp";
	}
	@RequestMapping("goods/list_vue.do")
	public void goods_list_vue(HttpServletRequest request,HttpServletResponse response) {
		String page=request.getParameter("page");
		int curpage=Integer.parseInt(page);
		int start=(curpage*12)-12;
		List<GoodsVO> list=service.goodsListData(start);
		int totalpage=service.goodsTotalPage();
		
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage) 
			endPage=totalpage;
		
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("curpage", curpage);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("totalpage", totalpage);
		map.put("list", list);
		
		try {
			ObjectMapper mapper=new ObjectMapper();
			String json=mapper.writeValueAsString(map);
			
			Commons.sendData(response, "text/plain", json);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	@RequestMapping("goods/detail.do")
	public String goods_detail(HttpServletRequest request,HttpServletResponse response) {
		String no=request.getParameter("no");
		request.setAttribute("no", no);
		request.setAttribute("cno", 1);
		request.setAttribute("main_jsp", "../goods/detail.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("goods/detail_vue.do")
	public void goods_detail_vue(HttpServletRequest request,HttpServletResponse response) {
		String strno=request.getParameter("no");
		int no=Integer.parseInt(strno);
		GoodsVO vo=service.goodsDetailData(no);
		String p=vo.getGoods_price();
		p=p.replaceAll("[^0-9]", "");
		vo.setPrice(Integer.parseInt(p));
		try {
			ObjectMapper mapper=new ObjectMapper();
			String json=mapper.writeValueAsString(vo);

			Commons.sendData(response, "text/plain", json);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
}
