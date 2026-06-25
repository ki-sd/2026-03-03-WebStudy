package com.sist.model;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.service.*;

import java.io.PrintWriter;
import java.util.*;
import com.sist.vo.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@Controller
public class BoardModel {
	private BoardService service=new BoardServiceImpl();
	@RequestMapping("board/list.do")
	public String board_list(HttpServletRequest request,HttpServletResponse response) {
		return "../board/list.jsp";
	}
	@RequestMapping("board/list_vue.do")
	public void board_list_vue(HttpServletRequest request,HttpServletResponse response) {
		String page=request.getParameter("page");
		int curpage=Integer.parseInt(page);
		int start=(curpage*10)-10;
		List<BoardVO> list=service.boardListData(start);
		int count=service.boardRowCount();
		int totalpage=(int)Math.ceil(count/10.0);
		count=count-((curpage*10)-10);
		
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("curpage", curpage);
		map.put("count", count);
		map.put("totalpage", totalpage);
		map.put("list", list);
		
		try {
			ObjectMapper mapper=new ObjectMapper();
			String json=mapper.writeValueAsString(map);
			
			response.setContentType("text/plain;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.write(json);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	@RequestMapping("board/insert.do")
	public String board_insert(HttpServletRequest request,HttpServletResponse response) {
		return "../board/insert.jsp";
	}
	@RequestMapping("board/insert_ok.do")
	public void board_insert_ok(HttpServletRequest request,HttpServletResponse response) {
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
	}
	@RequestMapping("board/detail.do")
	public String board_detail(HttpServletRequest request,HttpServletResponse response) {
		return "../board/detail.jsp";
	}
	@RequestMapping("board/detail_vue.do")
	public void board_detail_vue(HttpServletRequest request,HttpServletResponse response) {
		String strno=request.getParameter("no");
		int no=Integer.parseInt(strno);
		BoardVO vo=service.boardDetailData(no);
		
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("no", no);
		map.put("name", vo.getName());
		map.put("subject", vo.getSubject());
		map.put("content", vo.getContent());
		map.put("hit", vo.getHit());
		map.put("dbday", vo.getDbday());
		
		try {
			ObjectMapper mapper=new ObjectMapper();
			String json=mapper.writeValueAsString(map);
			
			response.setContentType("text/plain;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.write(json);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
}
