package com.sist.model;
// 데이터 관리
// JSP안에서 관리 => 유지보수/확장성/분업 => 자바로 변경
// Model => DAO,VO 포함
import com.sist.dao.*;
import java.util.*;
import jakarta.servlet.http.HttpServletRequest;
public class MusicModel {
	public void musicList(HttpServletRequest request) {
		String strPage=request.getParameter("page");
		if(strPage==null)
			strPage="1";
		int curpage=Integer.parseInt(strPage);
		MusicDAO dao=MusicDAO.newInstance();
		List<MusicVO> list=dao.musicListData(curpage);
		int totalPage=dao.musicTotalPage();
		
		// list.jsp에서 출력할 데이터 전송
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalPage", totalPage);
	}
}
