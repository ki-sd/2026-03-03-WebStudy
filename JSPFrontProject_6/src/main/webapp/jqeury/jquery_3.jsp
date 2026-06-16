<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	revoveCLass / addClass
	<a class="">
	=> Menu에 주로 사용
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
*{
	margin: 0px;
	padding: 0px;
	box-sizing: border-box;
}
.menu{
	display: flex;
	list-style: none;
	background-color: #333
}
.menu li{
	padding: 15px 25px;
	color: white;
	cursor: pointer;
}
.menu li.active{
	background: #2197F3;
}
.content{
	display: none;
	padding: 20px;
	border: 1px solid;
}
.content.active{
	display: block;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$((e)=>{
	$('.menu li').on('click',(e)=>{
		$('.menu li').removeClass('active')
		$(e.currentTarget).addClass('active')
		
		$('.content').removeClass('active')
		
		const tab=$(e.currentTarget).attr('data-tab')
		$('#tab'+tab).addClass('active')
	})
})
</script>
</head>
<body>
	<%--
		태그는 사용자 정의가 없음 / 속성은 사용자 정의가 가능
		예약 / 결제 => 사용자정의 속성 이용
		            ----------- data
	 --%>
	<ul class="menu">
		<li class="active" data-tab="1">홈</li>
		<li data-tab="2">회원</li>
		<li data-tab="3">묻고답하기</li>
	</ul>
	<div id="tab1" class="content active">
		홈 메뉴
	</div>
	<div id="tab2" class="content">
		회원 관련 메뉴
	</div>
	<div id="tab3" class="content">
		QA 메뉴
	</div>
</body>
</html>