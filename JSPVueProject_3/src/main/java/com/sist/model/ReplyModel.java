package com.sist.model;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.commons.Commons;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.service.ReplyService;
import com.sist.service.ReplyServiceImpl;
import com.sist.vo.ReplyVO;

import java.util.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class ReplyModel {
	private ReplyService service=new ReplyServiceImpl();
	public void listData(int cno,int rno,HttpServletResponse response) {
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("cno", cno);
		map.put("rno", rno);
		
		List<ReplyVO> list=service.replyListData(map);
		
		for(ReplyVO vo:list) {
			vo.setUMsg(vo.getMsg());
		}
		
		try {
			ObjectMapper mapper=new ObjectMapper();
			String json=mapper.writeValueAsString(list);
			Commons.sendData(response, "text/plain", json);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	@RequestMapping("reply/list_vue.do")
	public void reply_list_vue(HttpServletRequest request,HttpServletResponse response) {
		String cno=request.getParameter("cno");
		String rno=request.getParameter("rno");
		
		listData(Integer.parseInt(cno), Integer.parseInt(rno), response);
	}
	@RequestMapping("reply/insert_vue.do")
	public void reply_insert(HttpServletRequest request,HttpServletResponse response) {
		String cno=request.getParameter("cno");
		String rno=request.getParameter("rno");
		String msg=request.getParameter("msg");
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		String name=(String)session.getAttribute("name");
		
		ReplyVO vo=new ReplyVO();
		vo.setCno(Integer.parseInt(cno));
		vo.setRno(Integer.parseInt(rno));
		vo.setMsg(msg);
		vo.setId(id);
		vo.setName(name);
		
		service.replyInsert(vo);
		
		listData(Integer.parseInt(cno), Integer.parseInt(rno), response);
	}
	@RequestMapping("reply/delete_vue.do")
	public void reply_delete(HttpServletRequest request,HttpServletResponse response) {
		String cno=request.getParameter("cno");
		String rno=request.getParameter("rno");
		String no=request.getParameter("no");
		service.replyDelete(Integer.parseInt(no));
		listData(Integer.parseInt(cno), Integer.parseInt(rno), response);
	}
	@RequestMapping("reply/update_vue.do")
	public void reply_update(HttpServletRequest request,HttpServletResponse response) {
		String no=request.getParameter("no");
		String cno=request.getParameter("cno");
		String rno=request.getParameter("rno");
		String msg=request.getParameter("msg");
		
		ReplyVO vo=new ReplyVO();
		vo.setNo(Integer.parseInt(no));
		vo.setMsg(msg);
		
		service.replyUpdate(vo);
		
		listData(Integer.parseInt(cno), Integer.parseInt(rno), response);
	}
}
