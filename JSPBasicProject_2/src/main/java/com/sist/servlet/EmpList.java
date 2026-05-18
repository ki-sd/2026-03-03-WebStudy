package com.sist.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.*;
import com.sist.dao.*;

@WebServlet("/EmpList")
public class EmpList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		// 어떤 메모리에 저장할지 설정 = 출력버퍼
		PrintWriter out=response.getWriter();
		// response안에는 해당 브라우저의 IP를 갖고있다
		// 서블릿은 각 틀라이언트당 1개씩 생성 => 쓰레드로 되어있다
		EmpDAO dao=new EmpDAO();
		List<EmpVO> list=dao.empListData();
		out.println("<html>");
		out.println("<head>");
		out.println("<style type=\"text/css\">");
		out.println("table{");
		out.println("margin: 50px auto;");
		out.println("}");
		out.println("</style>");
		out.println("</head>");
		out.println("<body>");
		out.println("<table border=1 bordercolor=black width=500>");
		out.println("<tr>");
		out.println("<th>사번</th>");
		out.println("<th>이름</th>");
		out.println("<th>직위</th>");
		out.println("<th>입사일</th>");
		out.println("<th>급여</th>");
		out.println("<th>부서명</th>");
		out.println("<th>근무지</th>");
		out.println("</tr>");
		for(EmpVO vo:list) {
		out.println("<tr>");
		out.println("<td>"+vo.getEmpno()+"</td>");
		out.println("<td>"+vo.getEname()+"</td>");
		out.println("<td>"+vo.getJob()+"</td>");
		out.println("<td>"+vo.getDbday()+"</td>");
		out.println("<td>"+vo.getStrsal()+"</td>");
		out.println("<td>"+vo.getDvo().getDname()+"</td>");
		out.println("<td>"+vo.getDvo().getLoc()+"</td>");
		out.println("</tr>");
		}
		out.println("</table>");
		out.println("</body>");
		out.println("</html>");
	}

}
