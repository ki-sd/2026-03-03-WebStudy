<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%--
	 클래스가 아니고 메서드 영역이다
	 =>
	 public class list_jsp extends HttpServlet {
	 	public void _jspInit(){}
	 	public void _jspDestroy(){}
	 	public void _jspServide(){
	 		put.println("<!DOCTYPE html> ~~~");
	 	}
	 }    
--%>
<%
    String type=request.getParameter("type");
	if(type==null){
		type="한식";
	}
	String strPage=request.getParameter("page");
	if(strPage==null){
		strPage="1";
	}
	int curPage=Integer.parseInt(strPage);
	FoodDAO dao=new FoodDAO();
	int totalPage=dao.foodTotalPage(type);
	List<FoodVO> list=dao.foodListData(type, curPage);
	// 데이터 확인
/* 	System.out.println("요청:"+type);
	System.out.println("페이지:"+curPage);
	System.out.println("총페이지:"+totalPage);
	System.out.println("데이터:"+list); */
	/*
		URL
		  데이터를 받는 jsp
		  데이터 전송 ?변수=값&변수=값
		  
		  list.jsp?page=1
		           ------
		  -------- page값을 list.jsp로 보낸다
		  detail.jsp?no=10
		             --
		             request.getParemeter("no") => 모든 데이터는 String으로 받아온다 (다른 데이터형 필요시 Wrapper클래스 활용)
		  GET 방식
	*/
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
		margin: 0px auto;
		width: 960px;
	}
	p {
		overflow: hidden;
		white-space: nowrap;
		text-overflow: ellipsis;  <%-- 텍스트가 넘어가면 ... 처리 --%>
	}
</style>
</head>
<body>
	<div class="container">
		<div class="row text-center">
			<a href="list.jsp?type=한식" class="btn btn-lg btn-danger">한식</a>
			<a href="list.jsp?type=양식" class="btn btn-lg btn-success">양식</a>
			<a href="list.jsp?type=중식" class="btn btn-lg btn-warning">중식</a>
			<a href="list.jsp?type=일식" class="btn btn-lg btn-info">일식</a>
			<a href="list.jsp?type=분식" class="btn btn-lg btn-primary">분식</a>
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
			<a href="list.jsp?page=<%=curPage>1?curPage-1:curPage %>&type=<%=type %>" class="btn btn-sm btn-warning">이전</a>
			<%=curPage %> page / <%=totalPage %> pages
			<a href="list.jsp?page=<%=curPage<totalPage?curPage+1:curPage %>&type=<%=type %>" class="btn btn-sm btn-warning">다음</a>
		</div>
	</div>
</body>
</html>