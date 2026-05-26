<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Java StringTokenizer</h1>
	<ul>
	<%
		String colors="red,blue,green,black,yellow";
		StringTokenizer st=new StringTokenizer(colors,",");
		while(st.hasMoreTokens()){
	%>
			<li><%=st.nextToken() %></li>
	<%
		}
	%>
	</ul>
	<h1>JSTL StringTokenizer</h1>
	<ul>
		<c:forTokens var="color" items="red,blue,green,black,yellow" delims=",">
			<li>${color }</li>
		</c:forTokens>
	</ul>
</body>
</html>