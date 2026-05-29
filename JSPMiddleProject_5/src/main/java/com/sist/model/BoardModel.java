package com.sist.model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.text.SimpleDateFormat;
import java.util.*;
import java.io.*;
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
		request.setAttribute("msg", "관리자가 삭제한 게시물입니다.");
	}
	public void boardInsert(HttpServletRequest request,
			HttpServletResponse response)
	{
		// => 화면 이동(response) => 다시 list.jsp로 이동
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
		// 오라클 데이터 추가 완료 
		// 화면 이동 
		try
		{
		   response.sendRedirect("list.jsp");
		}catch(Exception ex) {}
	}
	
	public void boardDetail(HttpServletRequest request)
	{
		String no=request.getParameter("no");
		BoardDAO dao=BoardDAO.newInstance();
		BoardVO vo=dao.baordDetail(Integer.parseInt(no));
		
		// JSP로 전송 
		request.setAttribute("vo", vo); // detail.jsp
	}
	
	// 수정 데이터 읽기
	public void boardUpdateData(HttpServletRequest request)
	{
		String no=request.getParameter("no");
		BoardDAO dao=BoardDAO.newInstance();
		BoardVO vo=dao.baordUpdateData(Integer.parseInt(no));
		
		// JSP 전송 
		request.setAttribute("vo", vo);
	}
	
	// 실제 수정 
	public void boardUpdate(HttpServletRequest request,
			HttpServletResponse response)
	{
		String name=request.getParameter("name");
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");
		String pwd=request.getParameter("pwd");
		String no=request.getParameter("no");//hidden
		System.out.println("pwd:"+pwd);
		System.out.println("no:"+no);
		BoardVO vo=new BoardVO();
		vo.setName(name);
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setPwd(pwd);
		vo.setNo(Integer.parseInt(no));
		
		BoardDAO dao=BoardDAO.newInstance();
		boolean bCheck=dao.boardUpdate(vo);
		
	  try
	  {
		    response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			if(bCheck==true)
			{
				out.write("yes");
			}
			else
			{
				out.write("no");
			}
			/*if(bCheck==true) // 비밀번호가 맞아서 수정 
			{
			   
				response.sendRedirect("detail.jsp?no="+no);
			}
			else
			{
				
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out=response.getWriter();
				out.write("<script>");
				out.write("alert(\"비밀번호가 틀립니다!!\");");
				out.write("history.back();");
				out.write("</script>");
			}*/
		    
	  }catch(Exception ex){}
	}
	// 답변
	public void boardReply(HttpServletRequest request, HttpServletResponse response) {
		String pno=request.getParameter("pno");
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
		dao.boardreply(Integer.parseInt(pno), vo);
		
		//화면 이동
		try {
			response.sendRedirect("list.jsp");
		}catch(Exception ex) {}
	}
	// 삭제
	public void boardDelete(HttpServletRequest request, HttpServletResponse response) {
		String no=request.getParameter("no");
		String pwd=request.getParameter("pwd");
		BoardDAO dao=BoardDAO.newInstance();
		boolean bCheck=dao.boardDelete(Integer.parseInt(no), pwd);
		
		// 화면 이동
		try {
			if(bCheck) {
				response.sendRedirect("list.jsp");
			}else {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out=response.getWriter();
				out.write("<script>");
				out.write("alert(\"비밀번호가 틀립니다\");");
				out.write("history.back();");
				out.write("</script>");
			}
		}catch(Exception ex) {}
	}
}
