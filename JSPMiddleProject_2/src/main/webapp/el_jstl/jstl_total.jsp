<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,java.text.*"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%--
		JSTL => Java Standard Tag Library
		             -------- 표준 (실무 => 사용자 정의도 가능 (별로 사용 안함))
		기본
		  -------------------------------------------------
		  가장 중요
		  core  ==>  prefix="c" uri="jakarta.tags.core"
		    => 변수 선언
		       String name="홍길동"
		       request.setAttribute("name",name)
		       => <c:set var="name" values="홍길동"/>
		    => 제어문
		       = 반복문
		         for(int i=1;i<=10;i++)
		         => <c:forEach var="i" begin="1" end="10" step="1">
		         for(String name:list)
		                       String name         list
		         => <c:forEach var="name" items="${list}">
		       = 조건문
		         if(i>10) ==> <c:if test="${i>10}">
		         if(name.equals("aaa")) ==> <c:if test="${name=='aaa'}">
		       = 다중 조건문
		         if ~ else / 다중조건문 / 선택문
		         <c:choose>
		           <c:when test="조건">출력값</c:when>  => if
		           <c:otherwise>출력값</c:otherwise>  => else
		         </c:choose>
		    => 화면이동
		       response.sendRedirect("list.jsp")
		       => <c:redirect url="list.jsp">
		  -------------------------------------------------
		  가끔 사용함
		  format  ==>  prefix="fmt" uri="jakarta.tags.format"
		     SimpleDateFormat
		     => <fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd">
		     Decimal Format
		     => <fmt:formatNumber value="1234567" type="currency"> => 1,234,567
		  functions   ==> prefix="fn" uri="jakarta.tags.functions"
		     => 자바의 String 클래스 메서드
		     fn:length(), fn:substring(), fn:trim() ...
		  
		  ---------------------------------------------------------
		  사용 안함 : 보안이슈
		  xml  ==>  prefix="xml" uri="jakarta.tags.xml"
		  sql  ==>  prefix="sql" uri="jakarta.tags.sql"
		  
		  EL / JSTL => 실무
 --%>
 <%
 	List<String> list=new ArrayList<String>();
 	list.add("홍길동");
 	list.add("심청이");
 	list.add("춘향이");
 	list.add("박문수");
 	list.add("이순신");
 	
 	request.setAttribute("list1", list);
 	session.setAttribute("list2", list);
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>고전 방식</h1>
	<ul>
	<%
		for(String name:list){
	%>
		<li><%=name %></li>
	<%
		}
	%>
	</ul>
	<h1>JSTL/EL</h1>
	<ul>
		<c:forEach var="name" items="${list1 }">
			<li>${name }</li>
		</c:forEach>
	</ul>
	<h1>Session값 출력</h1>
	<ul>
		<c:forEach var="name" items="${list2 }">
			<li>${name }</li>
		</c:forEach>
	</ul>
	<h1>조건 처리</h1>
	<%
		for(int i=1;i<=10;i++){
			if(i%2==0){
	%>
				<%=i %>&nbsp;
	<%
			}
		}
	%>
	<h1>JSTL/EL</h1>
	<c:forEach var="i" begin="1" end="10" step="1">
		<c:if test="${i%2==0}">${i }&nbsp;</c:if>
	</c:forEach>
	<h1>다중조건</h1>
	<%
		for(int i=1;i<=10;i++){
			if(i%2==0){
	%>
				<h3><%=i+"은(는) 짝수" %></h3>
	<%
			}
			else{
	%>
				<h3><%=i+"은(는) 홀수" %></h3>
	<%	
			}
		}
	%>
	<h1>JSTL/EL</h1>
	<%--
		1. JSTL : XML 형식
		          -------
		          1. 문법이 엄격
		          2. 문법
		             여는태그 / 닫는태그 동일
		             ------------- 독립태그도 반드시 닫는다 <input />
		             속성값은 반드시 "" 사용
		             대소문자 구분
		             반드시 루트 태그가 존재
		             <a>
		             	<b></b>
		             	<c></c>
		             </a>
		             
		             => 트리형태 => 소속 관계 명확함
		             <a><b><c></b></c></a>
		             => xml은 오류
		             => 사용자 정의 태그 / 설정 파일
		                              web.xml
		                              server.xml
		                              ---------- xml은 문서형 데이터베이스
		             => yml, yaml ...
		             => ci/cd => yml: 들여쓰기 (파이썬)
	 --%>
	<c:forEach var="i" begin="1" end="10" step="1">
		<c:choose>
			<c:when test="${i%2==0 }"><h3>${i }은(는) 짝수</h3></c:when>
			<c:otherwise><h3>${i }은(는) 홀수</h3></c:otherwise>
		</c:choose>
	</c:forEach>
	<h1>변환 : 날짜</h1>
	<%
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String today=sdf.format(date);
	%>
	실제 날짜:<%=date %><br>
	오늘 날짜:<%=today %><br>
	<c:set var="today" value="<%=date %>"></c:set>
	오늘 날짜: <fmt:formatDate value="${today }" pattern="yyyy-MM-dd"/>
	<h1>변환 : 숫자</h1>
	<%
		int n=1234567;
		DecimalFormat df=new DecimalFormat("###,###");
		String num=df.format(n);
	%>
	실제 값: <%=n %><br>
	출력 값: <%=num %><br>
	<c:set var="num" value="<%=n %>"></c:set>
	출력 값: <fmt:formatNumber value="${num }" type="currency" currencySymbol="$"/>
</body>
</html>