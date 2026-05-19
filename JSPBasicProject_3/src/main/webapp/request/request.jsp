<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"
    buffer="16kb" info="상품 목록" errorPage="error.jsp"%>
<%
GoodsDAO dao=GoodsDAO.newInstance();
int row=12;
String strPage=request.getParameter("page");
if(strPage==null){
	strPage="1";
}
int curPage=Integer.parseInt(strPage);
List<GoodsVO> list=dao.goodsListData(curPage, row);
int totalPage=dao.goodsTotalPage(row);

final int BLOCK=10;
int startPage=((curPage-1)/BLOCK*BLOCK)+1;
int endPage=((curPage-1)/BLOCK*BLOCK)+BLOCK;
if(endPage>totalPage)
	endPage=totalPage;
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body{
	font-family: sans-serif, Arial;
	padding: 40px;
	background: #F5F5F5;
}
.card-wrap{
	display: flex;
	flex-wrap: wrap; /* 이미지 => 범위를 벗어나면 아래로 내려라 */
	gap: 20px;
}
.card{
	width: calc(25% - 15px); /* 한줄에 4개 */
	background: white;
	border-radius: 12px; /* top-left top-right bottom-right bottom-left */
	overflow: hidden;
	text-transform: 0.3s;
}
.card:hover{
	transform: translateY(-5px)
}
.card img{
	width: 100%;
	height: 220px;
	object-fit: cover; /* 이미지를 화면 크기에 맞게 꽉채운다 */
	display: block;
}
.card-body{
	padding: 15px;
}
.card-title{
	font-size: 18px;
	font-weight: bold;
	margin-bottom: 10px;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}
.card-text{
	color: #666;
	font-size: 14px;
}
.pagination{
	display: flex;
	gap: 10px;
	align-items: center;
	margin: 20px;
	justify-content: center;
}
.pagination a{
	width: 40px;
	height: 40px;
	border-radius: 50%;
	border: 1px solid #CCC;
	display: flex;
	align-items: center;
	justify-content: center;
	text-decoration: none;
	color: #333;
	transition: 0.2s;
}
.pagination a:hover{
	background: #F0F0F0;
}
.pagination .arrow{
	font-size: 18px;
}
.pagination a:active{
	background: #474747;
	color: white;
	border-color: #333;
}
.page-card{
	width: 100%;
}
.detail{
	text-decoration: none;
	color: black;
}
.detail:hover{
	text-decoration: underline;
	color: green;
}
</style>
</head>
<body>
	<div class="card-wrap">
	<%
		for(GoodsVO vo:list){
	%>
		
		<div class="card">
			<a href="detail.jsp?no=<%=vo.getNo() %>" class="detail">
				<img src="<%=vo.getGoods_poster()%>">
					<div class="card-body">
						<div class="card-title"><%=vo.getGoods_name() %></div>
						<div class="card-text"><%=vo.getGoods_price() %></div>
					</div>
				</a>
			</div>
	<%
		}
	%>
	</div>
	<div class="page-card">
		<div class="pagination">
		<%
			if(startPage>1){
		%>
			<a href="request.jsp?page=<%=startPage-1 %>" class="arrow">&laquo;</a>
		<%
			}	
		%>
			<%
				for(int i=startPage;i<=endPage;i++){
			%>
			<a href="request.jsp?page=<%=i %>" <%=curPage==i?"class=active":"" %>><%=i %></a>
			<%
				}
			%>
		<%
			if(endPage<totalPage){
		%>
			<a href="request.jsp?page=<%=endPage+1 %>" class="arrow">&raquo;</a>
		<%
			}	
		%>
		</div>
	</div>
</body>
</html>