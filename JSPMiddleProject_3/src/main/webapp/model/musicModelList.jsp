<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.model.*"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%
	MusicModel model=new MusicModel();
	model.musicList(request);
%>
<!DOCTYPE html>
<c:set var="list" value="${list }"/>
<c:set var="curpage" value="${curpage }"/>
<c:set var="totalPage" value="${totalPage }"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
	margin-top: 50px;
	width: 1300px;
}
.row{
}
h3{
	text-align: center;
}
th{
	white-space: nowrap;
	text-overflow: ellipsis;
}
td{
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
}
table {
    table-layout: fixed;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<h3>뮤직 TOP200</h3>
			<table class="table">
				<thead>
					<tr class="success">
						<th width=10% class="text-center">순위</th>
						<th width=10% class="text-center"></th>
						<th width=10% class="text-center"></th>
						<th width=10% class="text-center">곡명</th>
						<th width=35% class="text-center">가수명</th>
						<th width=35% class="text-center">앨범</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="vo" items="${list }">
					<tr>
						<td width=10% class="text-center">${vo.no }</td>
						<td width=10% class="text-center">
							<c:choose>
								<c:when test="${vo.state=='상승'}">
									<font color='red'>▲${vo.idcrement }</font>
									</c:when>
								<c:when test="${vo.state=='하강'}">
									<font color='blue'>▼${vo.idcrement }</font>
									</c:when>
								<c:otherwise>-</c:otherwise>
							</c:choose>
						</td>
						<td width=10% class="text-center"><img src="${vo.poster }" width=30 height=30></td>
						<td width=10%>${vo.title}</td>
						<td width=35% style="white-space: nowrap;text-overflow: ellipsis;overflow: hidden;">${vo.singer }</td>
						<td width=35% style="white-space: nowrap;text-overflow: ellipsis;overflow: hidden;">${vo.album }</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<table class="table">
				<tr>
					<td class="text-center">
						<a href="musicModelList.jsp?page=${curpage>1?curpage-1:curpage }" class="btn btn-sm btn-primary">이전</a>
							${curpage } page / ${totalPage } pages
						<a href="musicModelList.jsp?page=${curpage<totalPage?curpage+1:curpage }" class="btn btn-sm btn-primary">다음</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>