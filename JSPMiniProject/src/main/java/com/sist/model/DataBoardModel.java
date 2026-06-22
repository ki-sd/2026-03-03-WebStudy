package com.sist.model;

import java.io.*;
import java.net.URLEncoder;
import java.util.List;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.DataBoardDAO;
import com.sist.vo.DataBoardVO;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class DataBoardModel {
	@RequestMapping("board/list.do")
	public String board_list(HttpServletRequest request,HttpServletResponse response) {
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		final int ROWSIZE=10;
		int count=DataBoardDAO.boardRowCount();
		int start=(curpage*ROWSIZE)-ROWSIZE;
		List<DataBoardVO> list=DataBoardDAO.boardListData(start);
		int totalpage=(int)(Math.ceil(count/(double)ROWSIZE));
		count=count-((curpage*ROWSIZE)-ROWSIZE);
		
		
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("count",count);
		request.setAttribute("main_jsp", "../board/list.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("board/detail.do")
	public String board_detail(HttpServletRequest request,HttpServletResponse response) {
		String no=request.getParameter("no");
		DataBoardVO vo=DataBoardDAO.boardDetailData(Integer.parseInt(no));
		
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../board/detail.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("board/insert.do")
	public String board_insert(HttpServletRequest request,HttpServletResponse response) {
		request.setAttribute("main_jsp", "../board/insert.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("board/download.do")
	   public void board_download(HttpServletRequest request,
			   HttpServletResponse response)
	   {
		   try
		   {
			   request.setCharacterEncoding("UTF-8");
			   String fn=request.getParameter("fn");
			   ServletContext context=request.getServletContext();
			   
			   String path=context.getRealPath("")+File.separator+"uploads";
			   System.out.println(path);
			   File file=new File(path+File.separator+fn);
			   response.setHeader("Content-Disposition", "attachment;filename="
					         +URLEncoder.encode(fn,"UTF-8"));
			   response.setContentLength((int)file.length());
			   
			   BufferedInputStream bis=
					   new BufferedInputStream(new FileInputStream(file));
			   BufferedOutputStream bos=
					   new BufferedOutputStream(response.getOutputStream());
			   
			   byte[] buffer=new byte[1024];
			   int i=0;
			   while((i=bis.read(buffer, 0, 1024))!=-1)
			   {
				   bos.write(buffer, 0, i);
			   }
			   bis.close();
			   bos.close();
		   }catch(Exception ex) {}
	   }
}
