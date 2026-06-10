<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
		문자 조작
		  = textContent : 태그와 태그 사이에 값 주입 (순수 문자열) => HTML파싱 안되고 문자열로 출력
		                  => text()
		  = innerHTML : 태그와 태그 사이에 HTML 추가 => HTML 파싱됨
		                => html()
		  = appendChild : 태그 사이에 태그 첨부
		                 => append()
		  = html() vs append()
		    |한번만 (수정)  |여러번 (추가)
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(()=>{
	let h1=document.querySelector("h1")
	let val=h1.textContent
	console.log("h1:"+val)
	
	val=$('h1').text()
	console.log('h1(Jquery):'+val)
	
	h1.textContent="바닐라 JS 이용"
	$('h1').text("Jquery JS 이용")
	
	let h2=document.querySelector("h2")
	h2.innerHTML='<font color=red> VanillaJS </font>'
	$('h2').html('<font color=green> Jquery JS </font>')
//	$('h2').html('<font color=blue> Jquery JS2 </font>')
	alert($('div').text())
})
</script>
</head>
<body>
	<h1>Hello Jquery</h1>
	<h2>Hello Jquery</h2>
	<h3>Hello Jquery</h3>
	<h4>Hello Jquery</h4>
	<h5>Hello Jquery</h5>
	<div>
		<h6>div내부 h6</h6>
		<h6>div내부 h6</h6>
		<h6>div내부 h6</h6>
	</div>
</body>
</html>