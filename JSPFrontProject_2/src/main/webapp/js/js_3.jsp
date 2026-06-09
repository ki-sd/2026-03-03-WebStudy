<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
	margin-top: 50px;
}
.row{
	margin: 0px auto;
	width: 350px;
}
</style>
<script type="text/javascript">
// 속성 변경 (조작)
let index=1
let prev=()=>{
	index--
	if(index<1)
		index=7
	let img=document.querySelector("img")
	let path="../images/m"+index+".jpg"
	img.src=path
}
let next=()=>{
	index++
	if(index>7)
		index=1
	let img=document.querySelector("img")
	let path="../images/m"+index+".jpg"
	img.src=path
}
let auto=()=>{
	setInterval(next,2000)
}
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<table class="table">
				<tr>
					<td class="text-center">
						<img src="../images/m1.jpg" style="width: 320px;height: 420px;object-fit: contain">
					</td>
				</tr>
				<tr>
					<td class="text-center">
						<button type=button class="btn btn-sm btn-warning" onclick="prev()">이전</button>
						<button type=button class="btn btn-sm btn-info" onclick="auto()">자동</button>
						<button type=button class="btn btn-sm btn-success" onclick="next()">다음</button>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>