<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
		속성 조작
		: class / src
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(()=>{
	$('img').attr('src','https://img.megabox.co.kr/SharedImg/2026/05/13/zlk6dycnwuPdVuSH40RVickv2CYYCrcU_420.jpg')
	$("input[type='text']").val("hong")
	$("input[type='password']").val("1234")
	alert("id="+$("input[type='text']").val())
	alert("pwd="+$("input[type='password']").val())
})
</script>
</head>
<body>
	<img src=""><br>
	ID: <input type="text" id="id" size="15"><br>
	PW:<input type="password" id="pwd" size="15"><br>
</body>
</html>