<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%
    String col=request.getParameter("col");
	String fd=request.getParameter("fd");
	String strPage=request.getParameter("page");
	if(strPage==null)
		strPage="1";
	int curPage=Integer.parseInt(strPage);
	FoodDAO dao=new FoodDAO();
	List<FoodVO> list=dao.foodFindData(col, fd, curPage);
	int totalPage=dao.findTotalPage(col,fd);
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
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}
</style>
<!-- 
	HTML 태그
	화면 UI => <div> <span> <ul> ...
	데이터 입력 => 전송
		데이터를 모아서 한번에 전송 : <form>
		                       |보안 => method=post
		                       |일반 => method=get
		                       |데이터 전송하는 태그는 반드시 name속성을 갖고 있어야 한다
    HTML안에서 전송할때 사용

    JavaScript : Ajax , Vue , React
 -->
</head>
<body>
	<div class="container">
		<div class="row text-center">
			<form action="find.jsp" method="POST"> 
			<%-- 전송 데이터를 한번에 묶어서 보냄 : input / textarea / select 
					속성
					=> method : 공개/비공개 여부
					           GET/POST => 생략시 디폴트로 GET방식
					=> action : 어떤 파일로 전송할지
					?page=1&type=한식
						 
					=> id , class : CSS / JavaScript 에서 태그 제어
					=> name : JSP / Servlet 으로 값 전송
						 
					selected / checked / readonly / required / placeholder
										          text,textarea
					|<select>   |radio/checkbox
						 
					=> GET : SELECT
					=> POST : INSERT
					=> PUT : UPDATE
					=> DELETE : DELETE
					-------------------- Rest API
			--%>
				<select name="col" class="input-sm">
					<option value="address">주소</option>
					<option value="type" selected>음식종류</option>
					<option value="name">업체명</option>
				</select>
				<input type="text" name="fd" size=20 class="input-sm" required>
				<button class="btn-sm btn-info">검색</button>
			</form>
		</div>
		<div class="row" style="margin-top: 20px">
		<%
			for(FoodVO vo:list){
		%>
			<div class="col-md-3">
     			<div class="thumbnail">
       				<a href="#">
						<img src="<%=vo.getPoster() %>" alt="" style="width: 240px; height: 150px">
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
		<div class="row text-center">
			<a href="find.jsp?page=<%=curPage>1?curPage-1:curPage %>&col=<%=col %>&fd=<%=fd %>" class="btn btn-sm btn-warning">이전</a>
			<%=curPage %> page / <%=totalPage %> pages
			<a href="find.jsp?page=<%=curPage<totalPage?curPage+1:curPage %>&col=<%=col %>&fd=<%=fd %>" class="btn btn-sm btn-warning">다음</a>
		</div>
	</div>
</body>
</html>