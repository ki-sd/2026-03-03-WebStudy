<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
		static : HTML 문서의 기본 흐름에 따라 배치 (디폴트)
		         top/left/bottom/right => 적용이 안됨
		absolute : 가장 가까운 태그를 기준으로 설정
		relative : 원래 자리에서 지정한 만큼 이동
		fixed : 고정 좌표 => 스크롤시 영향 없음
		sticky : 스크롤시에만 고정됨
		
		position: absolute;
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.container{
	border: 2px dashed gray;
	margin: 30px;
	height: 250px;
	position: relative;
	padding: 10px;
}
.box{
	width: 100px;
	height: 50px;
	color: #FFF;
	font-weight: bold;
	line-height: 50px;
	text-align: center;
	margin: 5px;
}
.static{
	background: #FF6F61;
	position: static;
}
.relative{
	background: #6FA8DC;
	position: relative;
	top: 20px;
	left: 30px;
}
.absolute{
	background: #93C47D;
	position: absolute;
	top: 40px;
	left: 150px;
}
.scroll-area{
	height: 300px;
	overflow: auto;
	border: 2px solid #AAA;
	margin-top: 50px;
	padding: 10px;
}
.scroll-content{
	height: 600px;
}
.sticky{
	background: #8E7CC3;
	position: sticky;
	top: -10px;
}
</style>
</head>
<body>
	<h1>CSS 위치 속성</h1>
	<h2>1. static (기본)</h2>
	<div class="container">
		<div class="box static">static</div>
	</div>
	<p>문서의 기본 흐름에 따라 배치된다 <code>top/left/bottom/right</code> 적용이 안됨</p>
	<h2>2. relative (상대 좌표)</h2>
	<div class="container">
		<div class="box relative">relative</div>
	</div>
	<p>원래자리에서 <code>top:20px; left:30px;</code> 만큼 이동</p>
	<h2>3. absolute (절대 좌표)</h2>
	<div class="container">
		<div class="box absolute">absolute</div>
	</div>
	<p>가장 가까운 태그를 기준점으로 위치 <code>position:relative;</code></p>
	<h2>4. sticky</h2>
	<div class="scroll-area">
		<div class="box sticky">sticky</div>
		<div class="scroll-content">
			sticky 박스는 스크롤시마다 원래 위치에서 움직인다
			<b>top:0</b>도달하면 고정
		</div>
	</div>
</body>
</html>