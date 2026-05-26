<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Java 날짜 변환</h1>
	<%
	Date date=new Date();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	String today=sdf.format(date);
	%>
	오늘날짜:<%=today %>
	<h1>JCTL 날짜 변환</h1>
	<c:set var="today" value="<%=new Date() %>"/>
	오늘날짜: <fmt:formatDate value="${today }" pattern="yyyy-MM-dd"/>
	<h1>Java 숫자 변환</h1>
	<%
		int won=1234567;
		DecimalFormat df=new DecimalFormat("###,###");
		String data=df.format(won);
	%>
	<%=data %>
	<h1>JSTL 숫자 변환</h1>
	<%-- Java 혹은 오라클에서 우선적으로 처리 : JSTL처리는 차선책 --%>
	<fmt:formatNumber value="1234567" type="currency"/>
	<%--
		오라클 => TO_CHAR
	 --%>
	 <br>
	 <fmt:setLocale value="en_US"/>
	 <fmt:formatNumber value="1234567" type="currency"/>
	 <br>
	 <fmt:formatNumber value="0.75" type="percent"/>
</body>
</html>