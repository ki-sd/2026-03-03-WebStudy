<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	EL데이터를 읽는 경우
	---------------
	1. request에 담긴 값
	   request.setAttribute("name","value")
	   => ${requestScope.name} => value
	        ------------ 생략가능
	2. session에 담긴 값
	   session.setAttribute("name","value")
	   => ${sessionScope.name} => value
	        ------------ 생략 불가 (requestScopr 우선)
	                     request 없는 경우 생략 가능
	3. application에 담긴 값
	   application.setAttribute("name","value")
	   => ${applicationScope.name} => value
	4. param => 다른 JSP에서 보낸 값
	   a.jsp?name=value
	   => ${param.name} => value
	      => request.getParameter("name")
	5. paramValues => 여러값을 동시에 받는 경우
	   => checkbox
	      a.jsp?name=a&name=b&name=c
	      => ${paramValues.name}
	   일반 변수는 출력이 불가능하다
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// 자바에서 코딩 => 데이터를 JSP로 전송 => 받아서 출력
	request.setAttribute("name", "홍길동");
	session.setAttribute("name", "심청이");
	application.setAttribute("name", "박문수");
%>
	이름: ${name }<br>
	이름: ${sessionScope.name }<br>
	이름: ${applicationScope.name }<br>
</body>
</html>