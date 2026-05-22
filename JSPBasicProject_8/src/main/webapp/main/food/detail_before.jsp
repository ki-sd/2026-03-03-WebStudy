<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String no=request.getParameter("no");
	//1. 쿠키생성
	Cookie cookie=new Cookie("food_"+no,no);
	//2. 기간
	cookie.setMaxAge(60*60*24); //하루
	// => session(default : 1800초 (30분))
	// 삭제 => cookie.setMaxAge(0);
	//3. 저장하는 위치 지정
	cookie.setPath("/");
	//4. 해당 브라우저로 전송
	response.addCookie(cookie);
	//5. 화면 이동
	response.sendRedirect("../main.jsp?mode=2&no="+no);
	// sendRedirect() : 서버에서 화면 이동
	// GET => request 초기화
	/*
		1. 브라우저에 저장
		2. 문자열만 저장 가능
		3. 저장 공간 작음 (4kb)
		4. 보안 낮음
		5. 사용처
		   최근 방문 / 자동 로그인
		6. 주요 메서드
		   new Cookie(키,값)
		   setPath() 저장 위치
		   setMaxAge() 초단위
		   => getName() / getValue()
		      => 키         값
		      
		response는 전송
		   쿠키전송 / HTML 전송 => 한 파일에서 두개를 동시에 처리하지 못한다
		   detail_before.jsp : 쿠키 전송
		   detail.jsp : HTML 전송
		   
		Cookie 읽기
		----------
		1. 쿠키 전체 읽기
		   Cookie[] cookies=request.getCookies()
		2. key / value 읽기
		   cookies[i].getName() / cookies[i].getValue()
		3. 삭제
		   cookies[i].setMaxAge(0)
	*/
%>