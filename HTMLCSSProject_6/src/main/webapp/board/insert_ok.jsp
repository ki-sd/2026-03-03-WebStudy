<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<%
	BoardDAO dao=new BoardDAO();
	BoardVO vo=new BoardVO();
	vo.setName(request.getParameter("name"));
	vo.setSubject(request.getParameter("subject"));
	vo.setContent(request.getParameter("content"));
	vo.setPwd(request.getParameter("pwd"));
	dao.insertBoard(vo);
	// 화면이동
	response.sendRedirect("boardList.jsp");
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