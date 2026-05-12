<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%--
	 JSP (Java Server Page) : 서버에서 실행되는 파일
	 장점)
	 	  자바 + HTML
	 	  ---  -----
	 	   |     |
	 	   -------
	 	      |
	 	   자바 : <% %>
	 	        ------ 스크립트릿 <% %> : 일반 자바
	 	               => 변수 선언 / 메서드 호출 / 제어문
	 	        ------ 표현식 <%= %>
	 	               => println() => 화면에 변수값 출력
	 	        ------ 선언식 <%! %>
	 	               => 멤버 변수 선언 / 메서드 선언 (사용 빈도 거의 없음)
	 HTML : 정적 페이지 (데이터 변경이 불가)
	 JSP : 동적 페이지 (데이터 변경 가능) => ASP, PHP, DJango
	 
	 동작
	   브라우저에서 요청 : URL => sawon.jsp
	   Tomcat
	      |
	   자바파일로 변경 : Servlet
	      | 컴파일
	    .class
	      |
	     실행 => HTML만 메모리에 저장 => 브라우저에서 읽어간다
	     
	   지시자: page => 파일정보
	         => 속성 : import => 다른 파일 불러온다
	         
	   1. 자바에서 데이터 수집
	   2. HTML 이용해서 데이터 출력
	   3. CSS 이용해 화면 UI
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table{
	margin: 50px auto;
	border-collapse: collapse;
	width: 700px;
	border-radius: 8px;
	box-shadow: 0 2px 10px rgba(0,0,0,0.05)
}
thead{
	background-color: #4F46E5;
	color: white;
}
th,td{
	padding: 12px 16px;
	text-align: left;
}
tbody tr{
	border-bottom: 1px solid #eee;
}
tbody tr:nth-child(even) {
	background-color: #F2F2F2;
}
tbody tr:hover{
	background-color: #F5F7FF;
}
tbody tr:last-child {
	border-bottom: none;
}
</style>
</head>
<body>
	<Table>
		<thead>
			<tr>
				<th>사번</th>
				<th>이름</th>
				<th>직위</th>
				<th>입사일</th>
				<th>급여</th>
				<th>부서</th>
				<th>관리자여부</th>
			</tr>
		</thead>
		<tbody>
			<%
				empDAO dao=new empDAO();
				List<empVO> list=dao.getListData();
				for(empVO vo:list){			
			%>
			<tr>
				<td><%= vo.getEmpno() %></td>
				<td><%= vo.getEname() %></td>
				<td><%= vo.getJob() %></td>
				<td><%= vo.getDbdate() %></td>
				<td><%= vo.getSal() %></td>
				<td><%= vo.getDname() %></td>
				<td><%= vo.getIsadmin() %></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</Table>
</body>
</html>