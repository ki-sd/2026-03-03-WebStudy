<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
		JSP
		 지시자 : page / taglib
		        ----   ------
		               | prefix / uri => JSTL
		        | contentType / import / errorPage
		        | isErrorPage => web.xml
		 내장 객체
		     = request
		     = response
		     = session
		     = application
		 cookie / fileupload
		 데이터 베이스 연동 : JDBC => ConnectionPool
		 ----------------------------------------
		 + EL / JSTL
		 + MV / MVC 구조
		 <% %> <%= %> 제거
		       ------ ${} => 태그형으로 변경 => 유지보수가 편리 / 협업
		 ---- 자바파일로
		 
		 => EL/JSTL 나온 이유
		    1) 유지보수가 어려워서
		    2) HTML + Java + DB 연동 > 복잡함
		       ----------------
		       | 분리 => 여러명 동시에 작업
		    EL (Expression Language) => 표현식
		    -----------------------
		    | <%= %> 대체 (화면 출력)
		    => 사용 목적
		       JSP안에서 Java코드를 줄이고 데이터를 간단하게 출력하기 위해
		    예)
		       <%= request.getAttribute("name") %>
		     => ${name}
		    방식
		       ${값}
		    ---------------- 자바구조
		    1. 연산자
		       = 산술연산자
		         + , - , * , / , %
		         -------------
		         + : 순수하게 덧셈만 가능 => 문자열 결합 안됨
		             (문자열 결합 : +=)
		         / : 정수/정수=실수  ${5/2} , ${5 div 2}
		         % : $(5%2) , ${5 mod 2}
		         1) ${5 + null} => 5 => null을 0으로 인식
		         2) ${"5"+"4"} => 자동으로 정수형으로 변경 => 9
		            ${"5" += "4"} => 54
		       = 비교연산자
		         
		       = 논리연산자
		       = 삼항연산자
		       = Empty
		    2. 내장객체
		       ***requestScope => request.getAttribute()
		          |
		      *** sessionScope => session.getAttribute()
		          | -----------------------------------------
		       applicationScope => application.getAttribute()
		          |
		       param => request.getParameter()
		          |
		       paramValues => request.getParameterValues()
		       ---------------------------------------------- Java에서 처리
		       
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- <h1> EL 연산자 : 산술연산자</h1> -->
	<%-- 
	&#36;{10+10}=${10+10 }<br>
	&#36;{10+null}=${10+null }<br> null은 0으로 인식
	&#36;{"10"+10}=${"10"+10 }<br> 자동으로 정수형으로 변경
	&#36;{"10"+=10}=${"10"+=10 }<br> - , * 까지 동일
	&#36;{10/3}=${10/3 }<br>
	&#36;{10 div 3}=${10 div 3 }<br>
	&#36;{10 % 3}=${10 % 3 }<br>
	&#36;{10 mod 3}=${10 mod 3 }<br> 
	--%>
	<h1> EL 연산자 : 비교연산자 => 조건식으로 많이 사용(결과: true/false)</h1>
	<h2>비교연산자 (==(eq),!=(ne),<(gt),>(lt),>=(ge),<=(le))</h2>
	<h3>비교연산자는 문자열,날짜,숫자 비교시에도 사용</h3>
	<%-- 
	&#36;{10==10}=${10==10 }<br>
	&#36;{"hong"=="shim"}=${"hong"=="shim" }<br>
	&#36;{10 eq 10}=${10 eq 10 }<br>
	&#36;{"hong"eq"shim"}=${"hong"eq"shim" }<br>
	&#36;{10!=10}=${10!=10 }<br>
	&#36;{10 ne 10}=${10 ne 10 }<br>
	&#36;{"hong"ne"shim"}=${"hong"ne"shim" }<br>
	&#36;{10 > 10}=${10 > 10 }<br>
	&#36;{10 gt 10}=${10 gt 10 }<br>
	&#36;{10 < 10}=${10 < 10 }<br>
	&#36;{10 lt 10}=${10 lt 10 }<br>
	&#36;{10 >= 10}=${10 >= 10 }<br>
	&#36;{10 ge 10}=${10 ge 10 }<br>
	&#36;{10 <= 10}=${10 <= 10 }<br>
	&#36;{10 le 10}=${10 le 10 }<br> 
	--%>
	<%-- 
	<h1>논리연산자 (and , or, not)</h1>
	&#36;{10==10 and 10!=10}=${10==10 and 10!=10 }<br>
	&#36;{10==10 or 10!=10}=${10==10 or 10!=10 }<br>
	&#36;{not(10==10)}=${not(10==10) }<br> 
	--%>
	
	<h1>Empty 연산자 공백 : true / false</h1>
	<%
		// ${}는 일반 변수값이 아니라
		// session / request에 있는 경우에만 값을 출력 할 수 있다
		// String name="홍길동" => EL로 출력 못함  &lt;= &gt;
		// request.setAttribute("name", ""); => EL 사용 가능
		// session.setAttribute("name", "");
		request.setAttribute("name", "aaa");
	%>
	&#36;{empty name}=${empty name) }<br>
	<%
		String name="심청이";
		session.setAttribute("name", name);
	%>
	이름:${sessionScope.name }
	<br>
	${requestScope.name }
</body>
</html>