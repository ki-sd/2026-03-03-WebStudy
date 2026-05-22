<%@page import="com.sist.dao.*,com.sist.vo.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 사용자가 보내준 데이터 받기
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	
	//2. DB연동
	MemberDAO dao=MemberDAO.newInstance();
	MemberVO vo=dao.memberLogin(id, pwd);
	
	if(vo.getMsg().equals("NOID")){
%>
		<script>
			alert("존재하지 않는 ID입니다!!");
			history.back();
		</script>
<%
	}
	else if(vo.getMsg().equals("NOPWD")){
%>
		<script>
			alert("비밀번호가 틀립니다!!");
			history.back();
		</script>
<%	
	}else{
		// 로그인 상태
		// 정보를 세션에 저장 => 브라우저 종료/로그아웃 전까지 데이터 유지
		// request / session,cookie
		//           -------------- 전역변수 => 데이터를 모든 파일에서 공유
		// ------ 지역변수
		session.setAttribute("id", vo.getId());
		session.setAttribute("name", vo.getName());
		session.setAttribute("admin", vo.getIsadmin());
		session.setAttribute("post", vo.getPost());
		session.setAttribute("address", vo.getAddr1()+" "+vo.getAddr2());
		session.setAttribute("phone", vo.getPhone());
		// 이동 main.jsp
		response.sendRedirect("../main/main.jsp");
	}
%>