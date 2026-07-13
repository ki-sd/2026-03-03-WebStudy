package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.service.*;
import com.sist.vo.ReviewVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.util.*;

@Controller
public class ReviewModel {
	private ReviewService service=new ReviewServiceImpl();
	@RequestMapping("review/insert.do")
	public String review_insert(HttpServletRequest request,HttpServletResponse response) {
		String fno=request.getParameter("fno");
		String msg=request.getParameter("msg");
		HttpSession session=request.getSession();
		String id=session.getAttribute("id").toString();
		String name=session.getAttribute("name").toString();
		ReviewVO vo=new ReviewVO();
		vo.setFno(Integer.parseInt(fno));
		vo.setId(id);
		vo.setName(name);
		vo.setMsg(msg);
		service.insertReview(vo);
		service.updateReviewCount(Integer.parseInt(fno));
		return "redirect:../food/detail.do?no="+fno;
	}
	@RequestMapping("review/delete.do")
	public String review_delete(HttpServletRequest request,HttpServletResponse response) {
		String no=request.getParameter("no");
		String fno=request.getParameter("fno");
		service.deleteReview(Integer.parseInt(no));
		service.updateReviewCount(Integer.parseInt(fno));
		return "redirect:../food/detail.do?no="+fno;
	}
	@RequestMapping("review/update.do")
	public String review_update(HttpServletRequest request,HttpServletResponse response) {
		String no=request.getParameter("no");
		String fno=request.getParameter("fno");
		String msg=request.getParameter("msg");
		ReviewVO vo=new ReviewVO();
		vo.setNo(Integer.parseInt(no));
		vo.setMsg(msg);
		service.updateReview(vo);
		return "redirect:../food/detail.do?no="+fno;
	}
}
