<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
li:hover{
	cursor: pointer;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(()=>{
	$('img').hover((e)=>{
		$(e.currentTarget).css({
								'opacity':'0.3,',
								'cursor':'pointer',
								'border':'2px solid green'
								})
	},(e)=>{
		$(e.currentTarget).css({
			'opacity':'none',
			'cursor':'none',
			'border':'none'
			})
	})
	
	$('li').on('click',(e)=>{
		let data=$(e.currentTarget).text()
		alert("선택된 과정: "+data)
		$(e.currentTarget).text(data+"과정")
	})
	
	$('#readBtn').on('click',(e)=>{
		let msg=$('#msg').val()
		let sel=$('#sel').val()
		let t=$('textarea').val()
		alert('text: '+msg+"\nselect: "+sel+"\ntextarea: "+t)
	})
	$('#writeBtn').on('click',(e)=>{
		$('#msg').val("Hello Spring")
		$('#sel').val("Front-End")
		$('textarea').val("안녕하세요")
	})
	$('#htmlBtn').on('click',(e)=>{
		$('#html').html('<font color="red">Hello HTML</font>')
	})
	
	/*
		서버와 연동 => 화면 변경 X => 데이터만 변경 : 동적페이지
		-------------------------------------------
		검색 / 댓글 / 페이징 / 로그인 / 실시간 채팅 / 실시간 데이터읽기
		---
		1. JSP검색
		2. Ajax
		---------
		1. 댓글
		2. 페이징
		---------
		로그인 처리
	*/
})
</script>
</head>
<body>
	<h1>이미지 스타일 변경</h1>
	<img src="m1.jpg" style="width:150px;height:200px">
	<img src="m2.jpg" style="width:150px;height:200px">
	<h1>this 사용</h1>
	<ul>
		<li>자바 : JSP / JDBC / Spring / Spring-Boot</li>
		<li>오라클 : 데이터 저장공간 (CRUD,JOIN,SubQuery,Index)</li>
		<li>HTML/CSS : 브라우저 화면 UI</li>
		<li>JavaScript : 동적 페이지(클라이언트용)</li>
		<li>라이브러리 : Jquery3 / Jquery4 (Ajax:서버연동)</li>
		<li>MVC를 이용한 프로젝트 (세미프로젝트)</li>
		<li>SpringFramework : MVC라이브러리 => 최근 지원X (유지보수는 있음)</li>
		<li>ubuntu : Host방법 => AWS이용</li>
		<li>SpringBoot : JSP,ThymeLeaf</li>
		<li>CI/CD : GitActions, Docker, Docker-Compose</li>
		<li>CI/CD : Jenkins / kubernetis</li>
		<li>최종 프로젝트 : SpringBoot:ThymeLeaf:VueJS</li>
		<li>CI/CD : 무중단</li>
		<li>AWS에서 작업</li>
		<li>MySQL</li>
		<li>JPA</li>
		<li>NodeJS</li>
		<li>TypeScript</li>
		<li>React / Redux</li>
		<li>TanStackQuery = 개인프로젝트</li>
	</ul>
	<h1>val() / 입력창 : input,textarea,select</h1>
	<input type="button" value="읽기" id="readBtn">
	<input type="button" value="쓰기" id="writeBtn">
	<input type="button" value="HTML" id="htmlBtn">
	<br>
	<input type="text" id="msg" size="20" value="Hello JavaScript"><br>
	<select id="sel">
		<option>Back-End</option>
		<option>Front-End</option>
		<option>DataBase</option>
	</select><br>
	<textarea rows="3" cols="20">Hello</textarea>
	<br>
	<span id="html"></span>
</body>
</html>