<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>고전 방식</h1>
	<%
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	String[] hobby=request.getParameterValues("hobby");
	%>
	ID: <%=id %>
	PWD: <%=pwd %>
	취미: <%for(String h:hobby){ %> 
			<%=h%>
			<%
			}
			%>
	<h1>개선된 방식</h1>
	ID: ${param.id }
	PWD: ${param.pwd }
	취미: ${paramValues.hobby }
	
</body>
</html>