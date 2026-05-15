<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<%
	String strNo=request.getParameter("no");
	int no=Integer.parseInt(strNo);
	String pwd=request.getParameter("pwd");
	BoardDAO dao=new BoardDAO();
	boolean bCheck=dao.deleteBoard(no, pwd);
	if(bCheck==true){
		response.sendRedirect("boardList.jsp");
	}
	else{
%>
		<script>
			alert("비밀번호가 틀립니다!!");
			history.back();
		</script>
<% 		
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>