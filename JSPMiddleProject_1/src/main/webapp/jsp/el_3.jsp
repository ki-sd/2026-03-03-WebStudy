<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	경로 pageContext.request.contextPath
	    css읽기 <link href="${pageContext.request.contextPath}/jsp/a.css"> => react / VueJS
	    채팅 / JS로 값 전송
	    
	 중심 : 출력
	      ${값}
	       --- request/session에 있는 값
	       --- 키
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	${pageContext.request.contextPath }
</body>
</html>