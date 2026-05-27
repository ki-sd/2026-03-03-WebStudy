package com.sist.model;
import com.sist.dao.*;

import jakarta.servlet.http.HttpServletRequest;

import java.util.*;
public class FoodModel {
	
	public void foodListData(HttpServletRequest request) {
		String strpage=request.getParameter("page");
		if(strpage==null)
			strpage="1";
		int curpage=Integer.parseInt(strpage);
		FoodDAO dao=FoodDAO.newInstance();
		List<FoodVO> list=dao.foodListData(curpage);
		int totalpage=dao.foodTotalPage();
		
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
			endPage=totalpage;
		
		request.setAttribute("list", list);
		request.setAttribute("curpage",	curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
	}
	public void foodDetailData(HttpServletRequest request) {
		String strno=request.getParameter("no");
		int no=Integer.parseInt(strno);
		FoodDAO dao=FoodDAO.newInstance();
		FoodVO vo=dao.foodDetailData(no);
		
		request.setAttribute("vo", vo);
	}
}
