<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	효과
	hide / show / fadeOut / fadeIn / slideUp / slideDown / animation / reset
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body{
	padding: 20px;
}
.btn-group{
	margin-bottom: 20px;
}
button{
	padding: 8px 12px;
	margin-right: 5px;
	cursor: pointer;
}
#box{
	width: 200px;
	height: 200px;
	background-color: red;
	position: relative;
	margin-top: 10px;
	border radius: 8px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-4.0.0-rc.1.min.js"></script>
<script type="text/javascript">
	$(()=>{
		const duration=1000
		$('#btn-hide').on('click',(e)=>{
			$('#box').hide(duration)
		})
		$('#btn-show').on('click',(e)=>{
			$('#box').show(duration)
		})
		$('#btn-fadeOut').on('click',(e)=>{
			$('#box').fadeOut(duration)
		})
		$('#btn-fadeIn').on('click',(e)=>{
			$('#box').fadeIn(duration)
		})
		$('#btn-slideUp').on('click',(e)=>{
			$('#box').slideUp(duration)
		})
		$('#btn-slideDown').on('click',(e)=>{
			$('#box').slideDown(duration)
		})
		$('#btn-move').on('click',(e)=>{
			$('#box').stop().animate({
				left:'200px',
				width:'300px',
				opacity:'0.5'
			},duration)
		})
		$('#btn-reset').on('click',(e)=>{
			$('#box').stop().animate({
				left:'0px',
				width:'200px',
				height:'200px',
				opacity:'1'
			},duration)
		})
	})
</script>
</head>
<body>
	<h1>Jquery 효과 관련 라이브러리</h1>
	<div class="btn-group">
		<button id="btn-hide">Hide</button>
		<button id="btn-show">Show</button>
		
		<button id="btn-fadeOut">FadeOut</button>
		<button id="btn-fadeIn">FadeIn</button>
		
		<button id="btn-slideUp">SlideUp</button>
		<button id="btn-slideDown">SlideDown</button>
		
		<button id="btn-move">Animation</button>
		<button id="btn-reset">Reset</button>
	</div>
	<div id="box"></div>
</body>
</html>