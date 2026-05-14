<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*,com.sist.vo.*"%>
    <%
    String strNo=request.getParameter("no");
    MusicDAO dao=new MusicDAO();
    MusicVO vo=dao.musicDetailData(Integer.parseInt(strNo));
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container {
	margin-top: 50px;
}
.row {
	width: 960px;
	/* 가운데 정렬 */
	margin: 0px auto;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<table class="table">
				<tbody>
					<tr>
						<td width=30% class="text-center" rowspan="3">
							<img src="<%=vo.getPoster() %>" 
							style="width: 300px;height: 350px" 
							class="img-rounded">
						</td>
						<td colspan="2">
							<h3><%=vo.getTitle() %>&nbsp;
								<span><%=vo.getDisplayState() %>
								</span>
							</h3>
						</td>
					</tr>
					<tr>
						<td width=10% class="text-center">음식종류</td>
						<td width=60%><%=vo.getSinger() %></td>
					</tr>
					<tr>
						<td width=10% class="text-center">주소</td>
						<td width=60%><%=vo.getAlbum() %></td>
					</tr>
					<tr>
						<td colspan="3" class="text-right">
							<button class="btn-xs btn-danger">좋아요</button>
							<button class="btn-xs btn-success">찜하기</button>
							<button class="btn-xs btn-warning">구매</button>
							<button class="btn-xs btn-primary" onclick="javascript:history.back()">목록</button>
						</td>
					</tr>
				</tbody>
			</table>	
		</div>
	</div>
</body>
</html>