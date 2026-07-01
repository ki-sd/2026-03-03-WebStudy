<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.container{
	margin-top: 50px;
}
.row{
	margin: 0px auto;
	width: 960px;
}
p{
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}
.a-link:hover{
	cursor: pointer;
}
button{
	margin-left: 2px
}
h3{
	text-align: center;
	cursor: default;
}
textarea{
	cursor: default;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<table class="table">
				<tr>
					<td>
						<form method="post" action="../news/find.do">
							<input type="text" name="fd" size="20" class="input-sm">
							<button type="submit" class="btn-sm btn-danger">검색</button>
						</form>
					</td>
				</tr>
			</table>
		</div>
		<div class="row" style="margin-top: 20px">
			<table class="table">
				<tr>
					<td>
						<c:forEach var="vo" items="${list }">
							<table class="table">
								<tr>
									<td><a href="${vo.link }" target="_blank" style="color: orange; text-decoration: none;">${vo.title }</a></td>
								</tr>
								<tr>
									<td style="white-space: pre-wrap">${vo.desc }</td>
								</tr>
							</table>
						</c:forEach>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>