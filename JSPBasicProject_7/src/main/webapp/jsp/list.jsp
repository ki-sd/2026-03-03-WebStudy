<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%--
		11장 데이터베이스 / 12장 Cookie/Session / 13장 파일 업로드 => JSP
		--------------------------Spring / Spring-Boot
		JSP 장점 / 단점
		 => 스트립트 <% %> <%= %> (X)
		 => 지시자 page : contentType / import / errorPage (Default)
		 => 내장 객체
		    request / response / application / session
		                         ----------- JSP에서만
		 => 자바빈즈 => VO (getter/setter)
		 => jsp 액션 태그
		    <jsp:include>
		 
		 ---------------------------------------------------------
		 | DBCP : DataBase Connection Pool
		                   ---------- 연결 부분
		   Pool => 저장 공간
		   => DB연결을 미리 여러개 만든 후에 재사용하는 기술
		   1. DB연결은 생성 비용이 크다
		      요청마다 새로 Connection 생성 => 성능 저하
		      Connection객체 생성이 많아지면 메모리 누수
		      Connection 제어가 안됨
		      -------------------D-Dos => 서버 부하↑ 셧다운 가능
		      
		      1. Connection 제한 => 재사용
		      2. 서버가 쉽게 다운되지 않게 만든다
		      3. 연결 시간소요 방지
		      4. 웹프로그램에 일반화되어있음
		   => getConnection만 변경 => 연결된 주소값 얻어서 처리
		   
		   동작 순서
		   프로그램 시작과 동시에 Connection Pool을 만든다 
		                   --------------- 톰캣
		   | 미리 연결된 Connection이 저장된다
		     사용자 요청 => Pool안에서 Connection 주소 하나를 가져온디
		     사용자 => Connection 사용
		     작업 종료 => Connection을 닫는것이 아니라 Pool로 반환 (재사용)
		     conn.close() => 닫기X 반환O
		     
		     설정
		      maxActive : 동시에 사용할수있는 Connection의 수
		      maxIdle : 항상 유지하는 최소 가용 Connection 수
		      maxWait : 반환까지 기다리는 시간
		    -------------------- 데이터베이스 성능 최적화 기술
 --%>
 <%
 	EmpDAO dao=EmpDAO.newInstance();
 	List<EmpBean> list=dao.empListData();
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>사원목록</h1>
	<table border=1 bordercolor=black width=500>
		<tr>
			<th>사번</th>
			<th>이름</th>
			<th>직위</th>
			<th>입사일</th>
			<th>급여</th>
		</tr>
		<%
			for(EmpBean bean:list){
		%>
		<tr>
			<td><%=bean.getEmpno() %></td>
			<td><%=bean.getEname() %></td>
			<td><%=bean.getJob() %></td>
			<td><%=bean.getDbday() %></td>
			<td><%=bean.getSal() %></td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>