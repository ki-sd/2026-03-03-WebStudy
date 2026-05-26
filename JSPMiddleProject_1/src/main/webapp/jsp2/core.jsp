<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%--
		JSTL => Java Standard Tag Library
		core
		  1) 변수 설정 : < c:set var="vo" value="<%= new SawonVO()%>">
		              => request.setAttribute("vo",new SawonVO())
		  2) 화면 출력 : < c:out value=""> => 자바스크립트에서 출력시
		  3) 제어문
		     <c:forEach> : for~each (반복문)
		     <c:if> : 단일 조건문
		     <c:choose> : 다중 조건문
		     <c:forTokens> : StringTokenizer
		  4) URL => 화면 이동 : <c:redirect url=""> : sendRedirect()
	    -------------------------------------------------------
		fmt
		  1) 날짜 변경 : <fmt:formatDate> : SimpleDateFormat
		  2) 숫자 변경 : <fmt:formatNumber> : DecimalFormat
		fn
		  1) String클래스의 메서드
		     fn:length() , fn:substring() , fn:trim() ....
		-------------------------------------------------------- 보통 자바에서 처리
		--------
		sql
		xml
		-------- X
 --%>
<%
	String name="홍길동";
	request.setAttribute("name", name);
%>
<c:set var="name1" value="심청이"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	이름:${name }<br>
	이름2:${name1 }
</body>
</html>