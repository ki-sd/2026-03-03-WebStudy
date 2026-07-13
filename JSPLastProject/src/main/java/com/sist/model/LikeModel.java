package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.service.LikeService;
import com.sist.service.LikeServiceImpl;
import com.sist.vo.LikeVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class LikeModel {
	private LikeService service=new LikeServiceImpl();
	@RequestMapping("like/likeOn.do")
	public String like_on(HttpServletRequest request,HttpServletResponse response) {
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		String fno=request.getParameter("fno");
		LikeVO vo=new LikeVO();
		vo.setId(id);
		vo.setFno(Integer.parseInt(fno));
		service.likeOn(vo);
		service.foodLikeUpdate(Integer.parseInt(fno));
		return "redirect:../food/detail.do?no="+fno;
	}
	@RequestMapping("like/likeOff.do")
	public String like_off(HttpServletRequest request,HttpServletResponse response) {
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		String fno=request.getParameter("fno");
		LikeVO vo=new LikeVO();
		vo.setId(id);
		vo.setFno(Integer.parseInt(fno));
		service.likeOff(vo);
		service.foodLikeUpdate(Integer.parseInt(fno));
		return "redirect:../food/detail.do?no="+fno;
	}
}
