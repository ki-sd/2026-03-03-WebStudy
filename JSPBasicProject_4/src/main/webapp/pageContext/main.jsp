<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border=1 bordercolor=black width=800 height="600">
		<tr>
			<td colspan="2" height="100" align=center>
			<%@ include file="header.jsp" %>
			</td>
		</tr>
		<tr>
			<td width=600 height=400 align=center>
			<%@ include file="section.jsp" %>
			</td>
			<td width=200 height=400 align=center>
			<%@ include file="aside.jsp" %>
			</td>
		</tr>
		<tr>
			<td colspan="2" height="100" align=center>
			<%@ include file="footer.jsp" %>
			</td>
		</tr>
	</table>
</body>
</html>