<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name=request.getParameter("name");
	String sex=request.getParameter("sex");
	String addr=request.getParameter("address");
	String phone=request.getParameter("phone");
	String content=request.getParameter("content");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
	margin-top: 50px;
}
.row{
	margin: 0px auto;
	width: 500px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<table>
				<thead>
					<tr>
						<th><h3>받은 데이터</h3></th>
					</tr>
				</thead>
				<tbody style="margin-top: 10px">
					<tr>
						<th>이름</th>
						<td><%=name %></td>
					</tr>
					<tr>
						<th>성별</th>
						<td><%=sex %></td>
					</tr>
					<tr>
						<th>주소</th>
						<td><%=addr %></td>
					</tr>
					<tr>
						<th>연락처</th>
						<td><%=phone %></td>
					</tr>
					<tr>
						<th>소개</th>
						<td><%=content %></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>