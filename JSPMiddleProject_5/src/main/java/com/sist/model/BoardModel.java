package com.sist.model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.text.SimpleDateFormat;
import java.util.*;
import com.sist.dao.*;
/*
 *     Controller  :  처리된 데이터 JSP 전송 : Servlet
 *     Model  :  데이터 처리 : Java => 메서드
 *     View  : JSP => JSTL/EL  ==>  화면 출력
 *             => Front (JS)
 */
public class BoardModel {
	public void boardList(HttpServletRequest request) {
		String strpage=request.getParameter("page");
		if(strpage==null)
			strpage="1";
		int curpage=Integer.parseInt(strpage);
		BoardDAO dao=BoardDAO.newInstance();
		List<BoardVO> list=dao.boardListData(curpage);
		int count=dao.boardRowCount();
		int totalpage=(int)(Math.ceil(count/10.0));
		count=count-((curpage*10)-10); // 순차적 숫자로 출력
		
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("count", count);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("today", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
	}
	public void boardInsert(HttpServletRequest request,HttpServletResponse response) {
		BoardDAO dao=BoardDAO.newInstance();
		BoardVO vo=new BoardVO();
		
		dao.boardInsertData(vo);
	}
}
