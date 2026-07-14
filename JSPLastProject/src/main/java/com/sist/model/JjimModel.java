package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.service.JjimService;
import com.sist.service.JjimServiceImpl;
import com.sist.vo.JjimVO;
import java.util.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class JjimModel {
	private JjimService service=new JjimServiceImpl();
	@RequestMapping("jjim/jjim_insert.do")
	public String jjim_insert(HttpServletRequest request,HttpServletResponse response) {
		String no=request.getParameter("fno");
		int fno=Integer.parseInt(no);
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		JjimVO vo=new JjimVO();
		vo.setFno(fno);
		vo.setId(id);
		service.jjimInsert(vo);
		
		return "redirect:../food/detail.do?no="+no;
	}
	@RequestMapping("jjim/jjim_list.do")
	public String jjim_list(HttpServletRequest request,HttpServletResponse response) {
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		List<JjimVO> list=service.jjimListData(id);
		request.setAttribute("list", list);
		request.setAttribute("mypage_jsp", "../mypage/jjim.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("jjim/jjim_cancel.do")
	public String jjim_cancel(HttpServletRequest request,HttpServletResponse response) {
		String jno=request.getParameter("jno");
		service.jjimCancel(Integer.parseInt(jno));
		return "redirect:../jjim/jjim_list.do";
	}
}
