<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=()=>{
	/*
		onmouseover / onmouseout
		onclick
		<select> : onchange => 수량 => 계산 (장바구니)
		onkeyup / onkeydown => 채팅 / 검색
		<form> : onsubmit
		
		=> jquery
		   $('img').mouseover(function(){})
		   $('img').mouseout(function(){})
		   ----------------------------------
		   $('img').hover(function(){},function(){})
	*/
	let img=document.querySelector("img")
	img.onmouseover=()=>{
		img.style.cursor="pointer"
		img.style.opacity=0.3
	}
	img.onmouseout=()=>{
		img.style.opacity=1
	}
	img.onclick=()=>{
		alert("이미지 상세보기")
	}
	let btn=document.querySelectorAll("button")
	btn[0].onclick=()=>{
		img.style.width="350px"
		img.style.height="450px"
	}
	btn[1].onclick=()=>{
		img.style.width="200px"
		img.style.height="250px"
	}
}
</script>
</head>
<body>
	<h1>고전 이벤트</h1>
	<img src="../images/m1.jpg" width="200" height="250">
	<p>
	<button>확대</button>
	<button>취소</button>
</body>
</html>