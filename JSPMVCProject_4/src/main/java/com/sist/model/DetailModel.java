package com.sist.model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.sist.dao.*;
import com.sist.vo.*;
public class DetailModel implements Model {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String no=request.getParameter("no");
		DataBoardVO vo=DataBoardDAO.databoardDetailData(Integer.parseInt(no));
		
		request.setAttribute("vo", vo);
		return "boardDetail.jsp";
	}

}
