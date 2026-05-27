<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%
	String strpage=request.getParameter("page");
	if(strpage==null)
		strpage="1";
	int curpage=Integer.parseInt(strpage);
	FoodDAO dao=FoodDAO.newInstance();
	List<FoodVO> list=dao.foodListData(curpage);
	int totalpage=dao.foodTotalPage();
	
	final int BLOCK=10;
	int startPage=((curpage-1)/BLOCK*BLOCK)+1;
	int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
	if(endPage>totalpage)
		endPage=totalpage;
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
			<%
			for(FoodVO vo:list){
			%>
			<div class="col-md-3">
				<div class="thumbnail">
					<a href="foodDetail.jsp?no=<%=vo.getFno()%>">
				        <img src="<%=vo.getPoster() %>" title="<%=vo.getAddress() %>">
				        <div class="caption">
				        	<p><%=vo.getName() %></p>
				        </div>
					</a>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div class="row text-center" style="margin-top: 10px; margin-bottom: 30px;">
			<ul class="pagination">
				<%if(startPage>1){ %>
					<li><a href="foodList.jsp?page=<%=startPage-1 %>">&laquo;</a></li>
				<%} %>
				<%for(int i=startPage;i<=endPage;i++){ %>
					<li <%=i==curpage?"class=active":"" %>><a href="foodList.jsp?page=<%=i %>"><%=i %></a></li>
				<%} %>
				<%if(endPage<totalpage){ %>
					<li><a href="foodList.jsp?page=<%=endPage+1 %>">&raquo;</a></li>
				<%} %>
			</ul>
		</div>
	</div>
</body>
</html>