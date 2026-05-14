<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.sist.vo.*, com.sist.dao.*"%>
    <%
    String strPage=request.getParameter("page");
            if(strPage==null)
            	strPage="1";
            int curPage=Integer.parseInt(strPage);
            MusicDAO dao=new MusicDAO();
            List<MusicVO> list=dao.musicListData(curPage);
            int totalPage=dao.musicTotalPage();
            
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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
	margin-top: 50px;
}
.row{
	margin: 0px auto;
	width: 960px;
}
p {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}
.thumbnail{
	position: relative;
	overflow: hidden;
	margin-bottom: 20px;
}
.thumbnail image{
	object-fit: cover;
	trainsition: transform 0.3s ease;
}
.thumbnail:hover image{
	transform: scale(1.1);
}
.thumbnail .overlay{
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0,0,0,0.6);
	display: flex;
	justify-content: center;
	align-items: center;
	text-align: center;
	opacity: 0;
	transition: opacity 0.3s ease-in-out;
	text-decoration: none;
	color: white;
	z-index: 10;
}
.thumbnail:hover .overlay{
	opacity: 1;
}

</style>
</head>
<body>
	<div class="container">
		<div class="row">
		<%
		for(MusicVO vo:list){
		%>
			<div class="col-md-3">
				<div class="thumbnail">
						<img src="<%=vo.getPoster() %>" onerror="this.onerror=null; this.src='../images/no_image.png'" alt="앨범자켓" style="width: 240px; height: 240px" class="image">
						<a href="detail.jsp?no=<%=vo.getNo()%>" class="overlay">
							<div class="info">
								<h3><%=vo.getTitle() %></h3>
								<p class="rank"><%=vo.getNo()+"위"%></p>
								<p class="idcrement"><%=vo.getDisplayState() %></p>
								<span class="btn-view">자세히 보기</span>
							</div>
						</a>
				</div>
			</div>
		<%
			}
		%>
		</div>
		<div class="row text-center">
			<ul class="pagination">
				<%
					if(startPage>1){
				%>
					<li><a href="list.jsp?page=<%=startPage-1%>">&laquo;</a></li>
				<%
					}
					for(int i=startPage;i<=endPage;i++){
				%>
					<li <%=i==curPage?"class=active":""%>><a href="list.jsp?page=<%=i%>"><%=i %></a></li>
				<%
					}
					if(endPage<totalPage){
				%>
					<li><a href="list.jsp?page=<%=endPage+1%>">&laquo;</a></li>
				<%
					}
				%>
			</ul>
		</div>
	</div>
</body>
</html>