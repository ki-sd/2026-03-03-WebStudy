package com.sist.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.*;
import com.sist.model.*;
@WebServlet("*.do")
// 고정이 안되면 사이트는 동작 불가 => xml파일로
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String[] cls= {
		"com.sist.model.ListModel",
		"com.sist.model.InsertModel",
		"com.sist.model.DetailModel",
		"com.sist.model.DeleteModel"
	};
	private String[] keys= {
		"databoard/boardList.do",
		"databoard/boardInsert.do",
		"databoard/boardDetail.do",
		"databoard/boardDelete.do"
	};
	private Map<String,Model> clsMap=new HashMap<String, Model>();
	// <bean id="databoard/list.do" class="com.sist.model.ListModel">
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		try {
			for(int i=0;i<cls.length;i++) {
				Class clsName=Class.forName(cls[i]);
				// 클래스 메모리 할당
				Model model=(Model)clsName.getDeclaredConstructor().newInstance();
				clsMap.put(keys[i], model);
				// 리플렉션 : 클래스명으로 메모리할당 / 멤버변수 설정 / 생성자 호출 / 메서드 호출
			}
		}catch(Exception ex) {}
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			// 1. 요청받기
			String uri=request.getRequestURI();
			String key=uri.substring(request.getContextPath().length()+1);
//			System.out.println(uri);
//			System.out.println(key);
			// 2. 해당 Model 찾기
			Model model=clsMap.get(key);
			// 3. 메서드 호출 => JSP받음
			String jsp=model.requestHandler(request, response);
			// 이동 => request를 유지하지 않고 이동 => sendRedirect
			if(jsp.startsWith("redirect:")) {
				response.sendRedirect(jsp.substring(jsp.indexOf(":")+1));
			}else {
				// request를 유지하고 이동
				RequestDispatcher rd=request.getRequestDispatcher(jsp);
				rd.forward(request, response);
			}
			// 4. JSP => request 전송
//			RequestDispatcher rd=request.getRequestDispatcher(jsp);
//			rd.forward(request, response);
		}catch(Exception ex) {}
	}

}
