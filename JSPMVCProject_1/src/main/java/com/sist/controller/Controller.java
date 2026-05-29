package com.sist.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.*;

import com.sist.model.*;

/*
 *   서블릿 동작 방식
 *      Init()  :  환경 설정 => web.xml
 *        |
 *     service() : 
 *        | ---------- doGet() : GET / doPost() : POST
 *                     | sendRedirect() | <form>
 *                     | <a>            | ajax
 *                     | location.href  | vue , react
 *                                        -----------
 *                                        axios / fetch => header에 첨부
 *                                        |axios.get(), axios.post()
 *                 doGet + doPost = service
 *                  |         |
 *                  -----------
 *                    |Contoller => 처리 방식이 동일 => 찾기 + 보내기
 *                    
 *     destroy() : 메모리 해제
 *     
 *             요청
 *     브라우저 ====== Controller === 해당Model을 찾음 === 처리결과를 갖고온다 === JSP에 전송 
 *                                                                    --------- 공통 : session
 *                                                                              JSP마다 처리 : request
 *     View (브라우저) : JSP => 사용자 (손님)
 *        | 주문받기 : 요청
 *     Controller : Servlet => 서빙 ==> 메뉴
 *        | 오더     | 응답
 *     Model : Java => 주방
 */
@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		// Model클래스 메모리 할당
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 1. 요청을 받는다
		// http://localhost/JSPMVCProject_1/Controller?cmd=list
		String cmd=request.getParameter("cmd");
		if(cmd==null)
			cmd="list";
		// 2. 요청에 해당되는 Model클래스 = 메서드
		String jsp="";
		if(cmd.equals("list")) {
			ListModel model=new ListModel();
			model.execute(request);
			jsp="view/board_list.jsp";
		}
		else if(cmd.equals("detail")) {
			DetailModel model=new DetailModel();
			model.execute(request);
			jsp="view/board_detail.jsp";
		}
		else if(cmd.equals("insert")) {
			InsertModel model=new InsertModel();
			model.execute(request);
			jsp="view/board_insert.jsp";
		}
		else if(cmd.equals("update")) {
			UpdateModel model=new UpdateModel();
			model.execute(request);
			jsp="view/board_update.jsp";
		}
		else if(cmd.equals("delete")) {
			DeleteModel model=new DeleteModel();
			model.execute(request);
			jsp="view/board_delete.jsp";
		}
		// 3. 요청 처리=> Model이 갖고있는 메서드 호출
		// 4. JSP를 찾는다
		// 5. Request/Session 에 결과값을 담아 보내준다
		RequestDispatcher rd=request.getRequestDispatcher(jsp);
		rd.forward(request, response);
	}

}
