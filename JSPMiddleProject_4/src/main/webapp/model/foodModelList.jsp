<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.model.*"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%
	FoodModel model=new FoodModel();
	model.foodListData(request);
%>
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
	width: 960px;
}
p{
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
}
img{
	width: 240px;
	height: 150px;
	object-fit: cover;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<c:forEach var="vo" items="${list }">
				<div class="col-md-3">
				    <div class="thumbnail">
				    	<a href="foodModelDetail.jsp?no=${vo.fno }">
				        	<img src="${vo.poster }" title="${vo.address }">
				        	<div class="caption">
				        		<p>${vo.name }</p>
				        	</div>
				    	</a>
				    </div>
				</div>
			</c:forEach>
		</div>
		<div class="row text-center" style="margin-top: 10px; margin-bottom: 30px;">
			<ul class="pagination">
				<c:if test="${startPage>1 }">
					<li><a href="foodModelList.jsp?page=${startPage-1 }">&laquo;</a></li>
				</c:if>
				<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
					<li ${i==curpage?"class=active":"" }><a href="foodModelList.jsp?page=${i }">${i }</a></li>
				</c:forEach>
				<c:if test="${endPage<totalpage }">
					<li><a href="foodModelList.jsp?page=${endPage+1 }">&raquo;</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</body>
</html>