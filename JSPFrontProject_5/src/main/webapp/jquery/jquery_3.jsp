<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$((e)=>{
	$('#btn').on('click',()=> {
		$.ajax({
			type:'POST',
			// data:{}
			url:'sub.jsp',
			success:(response)=>{
				$('#print').html(response)
			}
		})
	})
})
</script>
</head>
<body>
	<button id="btn">클릭</button>
	<div id="print"></div>
</body>
</html>