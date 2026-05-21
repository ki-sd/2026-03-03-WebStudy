<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.bean.*"%>
<jsp:useBean id="bean" class="com.sist.bean.MemberBean"></jsp:useBean>
<jsp:setProperty name="bean" property="*"/>
<%--
		JSP 액션 태그
		  => Java코드를 직접 쓰지 않고 기능을 수행하게 만드는 표준 태그
		     ----------------------
		  => 액션 태그
		     <jsp:~~>
		  => XML형식으로 되어있다
		     ------
		     1. 태그나 속성명 => 대소문자 구분
		     2. 태그가 열리면 반드시 닫는다
		     3. 속성값을 입력 반드시 "" 사용
		  => Java코드가 감소
		  => 재사용성이 증가
		  => 다른 JSP / Bean 연동
		  
		  <jsp:useBean id="member" class="com.sist.bean.Member">
		  => JSP에서 사용이 가능 => Spring / MVC에서 거의 빈도가 없음
		  => 실무 : MVC구조 사용
		  => Member member=new Member()
		  
		  <jsp:setProperty name="member" property="name" value="홍길동">
		  
		  ***현재까지 사용되는 액션 태그
		  <jsp:include>
		  => MVC구조 적합
		  => 동적으로 변경
		  => JSP안에 다른 JSP를 첨부할때 사용 => 메인 페이지 구조 제작 가능
 	 ---------------------------------------------------------
		JSP => Java + HTML
		       ---- 소스 길어질때 사용
		MVC(Spring)
		    => Java : Model => 순수 자바
		    => HTML : View => HTML => 태그 (JSTL/EL)
		                      <%%> <%=%> => 제거
		    => 연결  : Controller
		              => forward() 메서드 이용
		              => Spring에서 이미 만들어져있음
		1. 자바빈 (javabean) => 213p
		   => 단순한 클래스 : 규칙
		   => JSP -- Servlet -- DB 데이터 전송
		   => 캡슐화 : private / setter / getter => lombok
		   => MVC에서도 데이터를 모아서 한번에 전송
		   => 데이터베이스 컬럼과 일치 (DESC 테이블명)
		   
		2. ------------------------------------------------
		    javabean			dto					vo
		목적: JSP 표준객체		  데이터 전달 객체		   불변 => 고정
		규칙: 엄격				  자유로움 => dbday
		사용: JSP중심			  -----------------------------
									Spring / MyBatis
		=> 최근에는 대부분 DTO (데이터를 모아서 브라우저로 보내는 목적)
		<form>
		  |
		JSP => Bean저장
		  |
		데이터베이스
		  |
		브라우저
		
		* 데이터 저장용 클래스 (getter/setter)
		
		=> 최근 : AI도입
		        ------ AI에서 보내준 데이터를 변경 할 수 없다
		               => VO => record(getter만 존재)
		=> 로직은 없다(순수 데이터)
		=> 캡슐화 가능 / 자유롭게 변경 가능

 --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.container{
	margin-top: 50px;
}
.row{
	margin: 0px auto;
	width: 500px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<table>
				<thead>
					<tr height="20px">
						<th class="text-center" style="background-color: #CCCCCC;" colspan="2"><h3>받은 데이터1</h3></th>
					</tr>
				</thead>
				<tbody style="margin-top: 10px">
					<tr style="border: solid;">
						<th class="text-left" style="background-color: #CCCCCC;">이름</th>
						<td class="text-center"><%=bean.getName() %></td>
					</tr>
					<tr style="border: solid;">
						<th class="text-left" style="background-color: #CCCCCC;">나이</th>
						<td class="text-center"><%=bean.getAge() %></td>
					</tr>
					<tr style="border: solid;">
						<th class="text-left" style="background-color: #CCCCCC;">성별</th>
						<td class="text-center"><%=bean.getSex() %></td>
					</tr>
					<tr style="border: solid;">
						<th class="text-left" style="background-color: #CCCCCC;">주소</th>
						<td class="text-center"><%=bean.getAddress() %></td>
					</tr>
					<tr style="border: solid;">
						<th class="text-left" style="background-color: #CCCCCC;">연락처</th>
						<td class="text-center"><%=bean.getPhone() %></td>
					</tr>
					<tr style="border: solid;">
						<th class="text-left" style="background-color: #CCCCCC;">소개</th>
						<td class="text-center"><%=bean.getContent() %></td>
					</tr>
				</tbody>
			</table>
			<table>
				<thead>
					<tr height="20px">
						<th class="text-center" style="background-color: #CCCCCC;" colspan="2"><h3>받은 데이터2</h3></th>
					</tr>
				</thead>
				<tbody style="margin-top: 10px">
					<tr style="border: solid;">
						<th class="text-left" style="background-color: #CCCCCC;">이름</th>
						<td class="text-center"><jsp:getProperty name="bean" property="name"></td>
					</tr>
					<tr style="border: solid;">
						<th class="text-left" style="background-color: #CCCCCC;">나이</th>
						<td class="text-center"><jsp:getProperty name="bean" property="age"></td>
					</tr>
					<tr style="border: solid;">
						<th class="text-left" style="background-color: #CCCCCC;">성별</th>
						<td class="text-center"><jsp:getProperty name="bean" property="sex"></td>
					</tr>
					<tr style="border: solid;">
						<th class="text-left" style="background-color: #CCCCCC;">주소</th>
						<td class="text-center"><jsp:getProperty name="bean" property="address"></td>
					</tr>
					<tr style="border: solid;">
						<th class="text-left" style="background-color: #CCCCCC;">연락처</th>
						<td class="text-center"><jsp:getProperty name="bean" property="phone"></td>
					</tr>
					<tr style="border: solid;">
						<th class="text-left" style="background-color: #CCCCCC;">소개</th>
						<td class="text-center"><jsp:getProperty name="bean" property="content"></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>