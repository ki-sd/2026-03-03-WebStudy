package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.NoticeDAO;
import com.sist.service.NoticeService;
import com.sist.service.NoticeServiceImpl;
import com.sist.vo.NoticeVO;
import java.util.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class NoticeModel {
	NoticeService service=new NoticeServiceImpl();
	@RequestMapping("adminpage/insert.do")
	public String admin_insert(HttpServletRequest request,HttpServletResponse response) {
		request.setAttribute("admin_jsp", "../notice/insert.jsp");
		return "../adminpage/admin_main.jsp";
	}
	@RequestMapping("adminpage/list.do")
	public String admin_list(HttpServletRequest request,HttpServletResponse response) {
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		final int ROWSIZE=10;
		int start=(curpage*ROWSIZE)-ROWSIZE;
		int totalpage=service.noticeTotalPage();
		List<NoticeVO> list=service.noticeListData(start);
		request.setAttribute("nList", list);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("curpage", curpage);
		request.setAttribute("admin_jsp", "../notice/admin_list.jsp");
		return "../adminpage/admin_main.jsp";
	}
	@RequestMapping("notice/insert.do")
	public String admin_insert_ok(HttpServletRequest request,HttpServletResponse response) {
		String type=request.getParameter("type");
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");
		NoticeVO vo=new NoticeVO();
		vo.setType(Integer.parseInt(type));
		vo.setSubject(subject);
		vo.setContent(content);
		service.noticeInsert(vo);
		return "redirect:../adminpage/list.do";
	}
	@RequestMapping("notice/user_list.do")
	public String user_list(HttpServletRequest request,HttpServletResponse response) {
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		final int ROWSIZE=10;
		int start=(curpage*ROWSIZE)-ROWSIZE;
		int totalpage=service.noticeTotalPage();
		List<NoticeVO> list=service.noticeListData(start);
		request.setAttribute("nList", list);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("curpage", curpage);
		request.setAttribute("main_jsp", "../notice/user_list.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("notice/delete.do")
	public String notice_delete(HttpServletRequest request,HttpServletResponse response) {
		String no=request.getParameter("no");
		service.noticeDelete(Integer.parseInt(no));
		return "redirect:../adminpage/list.do";
	}
	@RequestMapping("notice/update.do")
	public String notice_update(HttpServletRequest request,HttpServletResponse response) {
		String no=request.getParameter("no");
		NoticeVO vo=service.noticeUpdateDetail(Integer.parseInt(no));
		request.setAttribute("vo", vo);
		request.setAttribute("admin_jsp", "../notice/update.jsp");
		return "../adminpage/admin_main.jsp";
	}
	@RequestMapping("notice/update_ok.do")
	public String notice_update_ok(HttpServletRequest request,HttpServletResponse response) {
		String no=request.getParameter("no");
		String type=request.getParameter("type");
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");
		NoticeVO vo=new NoticeVO();
		vo.setNo(Integer.parseInt(no));
		vo.setType(Integer.parseInt(type));
		vo.setSubject(subject);
		vo.setContent(content);
		service.noticeUpdateData(vo);
		return "redirect:../adminpage/list.do";
	}
	@RequestMapping("notice/detail.do")
	public String notice_detail(HttpServletRequest request,HttpServletResponse response) {
		String no=request.getParameter("no");
		NoticeVO vo=service.noticeDetailData(Integer.parseInt(no));
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../notice/user_detail.jsp");
		return "../main/main.jsp";
	}
}
