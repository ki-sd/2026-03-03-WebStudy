package com.sist.model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.*;
import com.sist.vo.*;
import com.sist.dao.*;

public class ListModel implements Model {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String strPage=request.getParameter("page");
		if(strPage==null)
			strPage="1";
		int curpage=Integer.parseInt(strPage);
		int start=(curpage*10)-10;
		List<DataBoardVO> list=DataBoardDAO.databoardListData(start);
		int totalpage=DataBoardDAO.databoardTotalPage();
		
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		return "boardList.jsp";
	}

}
