<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" autoFlush="true" buffer="16kb"%>
<%-- 
	out : JspWriter
	      => HTML을 저장하는 메모리 공간 (출력버퍼)를 관리하는 클래스
	      | JSP 실행 요청
	            |
	           톰캣(WAS => JSP/Servlet을 번역하는 엔진)
	           1) jsp => java파일로 변경
	              class a_jsp extends HttpServlet
	              {
	              	JSP에 출력한 모든 내용
	              	public void _jspService()
	              	{
	              		//HTML 태그
	              		out.write("")
	              	}
	              }
	           2) 컴파일 => servlet파일 생성
	           3) 실행하면 메모리에 HTML을 출력 => 브라우저에서 실행
	              ** 사용자당 출력버퍼는 한개만 생성
	              ** 브라우저에서 읽어가면 자동으로 reflush (autoFlush)
	           4) 출력버퍼의 크기는 8kb
	           5) 주요메서드
	              println() / print() / write() => <%= %>
	              버퍼 크기 확인 : getBufferSize()
	              잔여 버퍼 확인 : getRemaining()
	              <%= %> ===> ${} (EL)
	              최대한 <% %> => 제거 => 태그형 프로그램 : JSTL
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>전체 버퍼 크기:<%=out.getBufferSize() %> byte</h3>
	<h3>잔여 버퍼 크기:<%=out.getRemaining() %> byte</h3>
	<h3>사용중인 버퍼:<%=out.getBufferSize()-out.getRemaining() %> byte</h3>
	<%
		int a=11;
		if(a%2==0){
			out.write("짝수");
		}else{
			out.write("홀수");
		}
	%>
	<p>
	<%
		out.println("<h1>JSP</h1>");
		out.println("<h1>JSP</h1>");
		out.println("<h1>JSP</h1>");
		out.println("<h1>JSP</h1>");
		out.println("<h1>JSP</h1>");
	%>
<%--
	<%= %> : out.println() 으로 변경
 --%>
	</p>
</body>
</html>