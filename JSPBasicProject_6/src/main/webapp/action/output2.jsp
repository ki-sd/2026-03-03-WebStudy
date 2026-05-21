<%@page import="com.sist.bean.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name=request.getParameter("name");
	String sex=request.getParameter("sex");
	String addr=request.getParameter("address");
	String phone=request.getParameter("phone");
	String content=request.getParameter("content");
	
	MemberBean bean=new MemberBean();
	bean.setName(name);
	bean.setSex(sex);
	bean.setAddress(addr);
	bean.setPhone(phone);
	bean.setContent(content);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
						<th class="text-center" style="background-color: gray"><h3>받은 데이터</h3></th>
					</tr>
				</thead>
				<tbody style="margin-top: 10px">
					<tr>
						<th class="text-left" style="background-color: gray; border: thin;">이름</th>
						<td><%=bean.getName() %></td>
					</tr>
					<tr>
						<th class="text-left" style="background-color: gray">성별</th>
						<td><%=bean.getSex() %></td>
					</tr>
					<tr>
						<th class="text-left" style="background-color: gray">주소</th>
						<td><%=bean.getAddress() %></td>
					</tr>
					<tr>
						<th class="text-left" style="background-color: gray">연락처</th>
						<td><%=bean.getPhone() %></td>
					</tr>
					<tr>
						<th class="text-left" style="background-color: gray">소개</th>
						<td><%=bean.getContent() %></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>