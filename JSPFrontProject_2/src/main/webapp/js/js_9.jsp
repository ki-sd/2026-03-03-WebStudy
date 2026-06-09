<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=()=>{
	let p1=document.querySelector("div > p") //자손
	p1.style.color="red"
	p1.addEventListener('click',()=>{
		alert("첫번쨰 p태그 선택")
	})
	
	let p2=document.querySelector("div span p") //후손
	p2.style.color="blue"
	p2.addEventListener('click',()=>{
		alert("두번쨰 p태그 선택")
	})
	
}
</script>
</head>
<body>
	<div>
		<p>첫번째</p>
		<span>
			<p>두번째</p>
		</span>
	</div>
</body>
</html>