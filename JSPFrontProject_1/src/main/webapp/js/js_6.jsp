<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	 반복문
	   do~while : 반드시 한번 이상 수행 => 조건을 나중에 검색
	   while : 반복 횟수가 없는 경우
	   ------------------------- 가끔 사용
	   for : 반복 횟수가 지정된 경우

 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=function(){
	let i=1
	do{
		document.write("<h3>"+i+"</h3>")
		i++
	}while(i<=10)
	document.write("<hr>")
	i=1
	while(i<=10){
		document.write("<h3>"+i+"</h3>")
		i++
	}
	document.write("<hr>")
	for(i=1;i<=10;i++){
		document.write("<h3>"+i+"</h3>")
	}
}
</script>
</head>
<body>

</body>
</html>