package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.service.BoardService;
import com.sist.service.BoardServiceImpl;
import com.sist.vo.BoardVO;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class BoardModel {
	private BoardService service=new BoardServiceImpl();
	@RequestMapping("board/list.do")
	public String board_list(HttpServletRequest request,HttpServletResponse response) {
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		final int ROWSIZE=10;
		int start=(curpage*ROWSIZE)-ROWSIZE;
		List<BoardVO> list=service.boardListData(start);
		int count=service.boardRowCount();
		int totalpage=(int)(Math.ceil(count/(double)ROWSIZE));
		count=count-((curpage*ROWSIZE)-ROWSIZE);
		
		request.setAttribute("list", list);
		request.setAttribute("count", count);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("today", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		request.setAttribute("main_jsp", "../board/list.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("board/insert.do")
	public String board_insert(HttpServletRequest request,HttpServletResponse response) {
		request.setAttribute("main_jsp", "../board/insert.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("board/insert_ok.do")
	public String board_insert_ok(HttpServletRequest request,HttpServletResponse response) {
		String name=request.getParameter("name");
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");
		String pwd=request.getParameter("pwd");
		BoardVO vo=new BoardVO();
		vo.setName(name);
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setPwd(pwd);
		service.boardInsert(vo);
		return "redirect:../board/list.do";
	}
	@RequestMapping("board/detail.do")
	public String board_detail(HttpServletRequest request,HttpServletResponse response) {
		String strno=request.getParameter("no");
		int no=Integer.parseInt(strno);
		BoardVO vo=service.boardDetailData(no);
		
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../board/detail.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("board/delete.do")
	public void board_delete(HttpServletRequest request,HttpServletResponse response) {
		String strno=request.getParameter("no");
		int no=Integer.parseInt(strno);
		String pwd=request.getParameter("pwd");
		String msg=service.boardDelete(no,pwd);
		try {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.write(msg);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	@RequestMapping("board/update.do")
	public String board_update(HttpServletRequest request,HttpServletResponse response) {
		String strno=request.getParameter("no");
		int no=Integer.parseInt(strno);
		BoardVO vo=service.boardDetailData(no);
		
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../board/update.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("board/update_ok.do")
	public void board_update_ok(HttpServletRequest request,HttpServletResponse response) {
		String strno=request.getParameter("no");
		int no=Integer.parseInt(strno);
		String pwd=request.getParameter("pwd");
		String name=request.getParameter("name");
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");
		BoardVO vo=new BoardVO();
		vo.setNo(no);
		vo.setName(name);
		vo.setSubject(subject);
		vo.setContent(content);
		String msg=service.boardUpdate(vo, pwd);
		try {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.write(msg);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
}
