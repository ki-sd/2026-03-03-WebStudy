package com.sist.model;
import java.text.SimpleDateFormat;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;
import jakarta.servlet.http.*;
public class BoardModel {
	public void boardListData(HttpServletRequest request) {
		//1. 사용자 요청 정보 => page
		String strPage=request.getParameter("page");
		if(strPage==null)
			strPage="1";
		int curpage=Integer.parseInt(strPage);
		BoardDAO dao=BoardDAO.newInstance();
		List<BoardVO> list=dao.boardListData(curpage);
		int totalpage=dao.boardTotalPage();
		int rowcount=dao.boardRowCount();
		int count=rowcount-((curpage-1)*10);
		// JSP로 출력에 필요한 데이터 전송
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String today=sdf.format(new Date());
		request.setAttribute("today", today);
		request.setAttribute("count", count);
	}
	public void boardInsert(HttpServletRequest request,HttpServletResponse response) {
		String name=request.getParameter("name");
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");
		String pwd=request.getParameter("pwd");
		BoardVO vo=new BoardVO();
		vo.setName(name);
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setPwd(pwd);
		BoardDAO dao=BoardDAO.newInstance();
		dao.boardInsert(vo);
		
		try {
		response.sendRedirect("list.jsp");
		}catch(Exception ex) {}
	}
	public void boardDetailData(HttpServletRequest request) {
		String no=request.getParameter("no");
		BoardDAO dao=BoardDAO.newInstance();
		BoardVO vo=dao.boardDetailData(Integer.parseInt(no));
		
		request.setAttribute("vo", vo);
	}
}
