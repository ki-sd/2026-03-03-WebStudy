<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	1. show / hide
	2. addClass / removeClass => class 속성 제어
	3. append / prepend
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.menu{
	list-style: none;
	display: flex;
	gap: 10px;
}
.item{
	cursor: pointer;
	padding: 10px 15px;
	background-color: #eee;
}
.item.active{
	background-color: #007bff;
	color: white;
	font-weight: bold;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-4.0.0-rc.1.min.js"></script>
<script type="text/javascript">
	$((e)=>{
		$('.item').on('click',(e)=>{
			$('.item').removeClass('active')
			$(e.currentTarget).addClass('active')
		})
	})
</script>
</head>
<body>
	<ul class="menu">
		<li class="item active">홈</li>
		<li class="item">회원</li>
		<li class="item">맛집</li>
		<li class="item">여행</li>
		<li class="item">레시피</li>
	</ul>
</body>
</html>