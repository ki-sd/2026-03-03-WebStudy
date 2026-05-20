<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%--
	 page :
	       contentType="text/html; charset=UTF-8"
	                    JSON : text/plain
	                    ----------------- AJAX / VueJS / ReactJS
	                    XML  : text/xml
	       import="java.util.*,com.sist.dao.*"
	       errorPage="error.jsp"
--%>
<%
	String strPage=request.getParameter("page");
	if(strPage==null)
		strPage="1";
	int curPage=Integer.parseInt(strPage);
	FoodDAO dao=FoodDAO.newInstance();
	int total=dao.foodTotalPage();
	List<FoodVO> list=dao.foodListData(curPage);
	
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
</head>
<body>
	<div class="container">
		<div class="row">
		<%
			for(FoodVO vo:list){
		%>
			<div class="col-md-3">
			    <div class="thumbnail">
			        <a href="detail_before.jsp?no=<%=vo.getFno()%>">
			        <img src="<%=vo.getPoster() %>" style="width:100%; height: 150px">
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
		<div class="row text-center" style="margin-top: 10px">
			<a href="list.jsp?page=<%=curPage>1?curPage-1:curPage %>" class="btn btn-sm btn-primary">이전</a>
			<%=curPage %> page / <%=total %> pages
			<a href="list.jsp?page=<%=curPage<total?curPage+1:curPage %>" class="btn btn-sm btn-primary">다음</a>
		</div>
	</div>
</body>
</html>