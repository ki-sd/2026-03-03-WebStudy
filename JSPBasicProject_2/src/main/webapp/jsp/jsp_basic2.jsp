<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
    Chapter 05장 
          JSP 기본 문법 
          1. 스크립트릿 => HTML / 자바 구분 
          2. 지시자 : page / include / taglib 
          3. 내장 객체 
             => 9개 => request/response/session/pageContext/application
          4. 상태 관리 : session / cookie 
          5. 데이터베이스 연동 
          6. 기본 사이트 
          7. JSTL / EL 
          8. MVC 
          
     1. 자바 소스 코딩 
        113page 
        1) 선언문 : => 멤버변수 / 메소드 => 사용빈도가 거의 없다 
           <%! %> : 클래스 영역 
        -------------------------------------------------
        2) 스크립트릿 : 자바소스 => 지역변수 / 연산자 / 메소드 호출 
           <% %>
        3) 표현식 : 브라우저에 출력 
           <%= %> 
        ------------------------------------ _jspService() 메소드에 첨부
        4) 주석 : 번역이 안되는 영역 
        ------------------------ 자동으로 사라진다 
        HTML주석은 그대로 출력 
        
        1. 스크립트릿 <% %> => 지역변수 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200..900&display=swap" rel="stylesheet">
<style type="text/css">
body{
	font-family: sans-serig, Arial;
	margin: 20px;
}
h2{
	margin-top: 40px;
	border-bottom: 2px solid #333;
	padding-bottom: 5px;
}
.exam{
	margin: 10px 0px;
	padding: 5px;
	border-left: 4px solid #888;
}
.noto-serif-kr-<uniquifier> {
  font-family: "Noto Serif KR", serif;
  font-optical-sizing: auto;
  font-weight: <weight>;
  font-style: normal;
}
</style>
</head>
<body>
	<%
	String title="글자 속성";
	String h2="글자 색상";
	String[] colors={"빨간색","파란색","초록색"};
	%>
	<h1><%=title %></h1>
	<h2><%=h2 %></h2>
	<p class="exam" style="color:red"><%=colors[0] %></p>
	<p class="exam" style="color:#0000FF"><%=colors[1] %></p>
	<p class="exam" style="color:rgb(0,255,0)"><%=colors[2] %></p>
	<%
		h2="글자 크기(font-size)";
	/*
		주석 => 자바 문법 따름
		px => 14px;
		em => 배수 => 2em => 14*2 => 28px
				% => 200% => 28px
	*/
	String[] sizes={"12px","20px","2em","150%"};
	%>
	<h2><%=h2 %></h2>
	<p class="exam" style="font-size:12px"><%=sizes[0] %></p>
	<p class="exam" style="font-size:20px"><%=sizes[1] %></p>
	<p class="exam" style="font-size:2em"><%=sizes[2] %></p>
	<p class="exam" style="font-size:150%"><%=sizes[3] %></p>
	<%
		h2="글꼴 (font-family)";
		String[] families={"궁서체","맑은 고딕","구글폰트"};
	%>
	<h2><%out.println(h2); %></h2>
	<p class="exam" style="font-family: 궁서체"><%=families[0] %></p>
	<p class="exam" style="font-family: 맑은 고딕"><%=families[1] %></p>
	<p class="exam" style="font-family: Noto Serif KR"><%=families[2] %></p>
	<%
		h2="폰트 스타일(font-style)";
		String[] style={"normal","Italic","Oblique"};
	%>
	<h2><%=h2 %></h2>
	<p class="exam" style="font-style: normal"><%=style[0] %></p>
	<p class="exam" style="font-style: italic;"><%=style[1] %></p>
	<p class="exam" style="font-style: oblique;"><%=style[2] %></p>
	<%
		h2="폰트 두께 (font-weight)";
		String[] weight={"보통","굵은 글자","얇은 글자","아주 굵은 글자"};
	%>
	<h2><%=h2 %></h2>
	<p class="exam" style="font-weight: normal;"><%=weight[0] %></p>
	<p class="exam" style="font-weight: bold;"><%=weight[1] %></p>
	<p class="exam" style="font-weight: lighter;"><%=weight[2] %></p>
	<p class="exam" style="font-weight: 900;"><%=weight[3] %></p>
	<%
		h2="정렬 (text-align)";
		String[] sort={"왼쪽","가운데","오른쪽","양쪽"};
	%>
	<h2><%=h2 %></h2>
	<p class="exam" style="text-align: left;"><%=sort[0] %></p>
	<p class="exam" style="text-align: center;"><%=sort[1] %></p>
	<p class="exam" style="text-align: right;"><%=sort[2] %></p>
	<p class="exam" style="text-align: justify;"><%=sort[3] %></p>
	<%
		h2="선 (text-decoration)";
		String[] line={"없음","밑줄","윗줄","취소선"};
	%>
	<h2><%=h2 %></h2>
	<p class="exam" style="text-decoration: none;"><%=line[0] %></p>
	<p class="exam" style="text-decoration: underline;"><%=line[1] %></p>
	<p class="exam" style="text-decoration: overline;"><%=line[2] %></p>
	<p class="exam" style="text-decoration: line-through;"><%=line[3] %></p>
	<%
		h2="글자 간격(*-spacing)";
		String[] spacing={"글자 간격 5px","글자 간격 -2px","글자 간격 20px"};
	%>
	<h2><%=h2 %></h2>
	<p class="exam" style="letter-spacing: 5px;"><%=spacing[0] %></p>
	<p class="exam" style="letter-spacing: -2px;"><%=spacing[1] %></p>
	<p class="exam" style="letter-spacing: 20px;"><%=spacing[2] %></p>
	<%
		h2="단어 간격(*-spacing)";
		String[] wspacing={"단어 간격 5px","단어 간격 -2px","단어 간격 20px"};
	%>
	<h2><%=h2 %></h2>
	<p class="exam" style="word-spacing: 5px;"><%=wspacing[0] %></p>
	<p class="exam" style="word-spacing: -2px;"><%=wspacing[1] %></p>
	<p class="exam" style="word-spacing: 20px;"><%=wspacing[2] %></p>
	<%
		h2="줄바꿈 (white-space)";
		String[] space={"normal","nowrap","pre-wrap","pre-line"};
	%>
	<h2><%=h2 %></h2>
	<p class="exam" style="white-space: normal;"><%=space[0] %> : 줄바꿈 자동 적용</p>
	<p class="exam" style="white-space: nowrap;"><%=space[1] %> : 줄바꿈 없음 => overflow:hidden</p>
	<p class="exam" style="white-space: pre-wrap;"><%=space[2] %> : 강제 줄바꿈 &lt;pre&gt;</p>
	<p class="exam" style="white-space: pre-line;"><%=space[3] %> : 줄바꿈 유지</p>
</body>
</html>