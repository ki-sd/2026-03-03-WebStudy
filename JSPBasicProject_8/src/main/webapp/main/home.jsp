<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*,com.sist.vo.*"%>
<%
	//1. 사용자가 보내준 값 받기
	String strPage=request.getParameter("page");
	if(strPage==null)
		strPage="1";
	int curpage=Integer.parseInt(strPage);
	//2. 데이터베이스 연결
	FoodDAO dao=FoodDAO.newInstance();
	//3. 데이터 읽기
	List<FoodVO> list=dao.foodListData(curpage);
	int totalpage=dao.foodTotalPage();
	
	// 블록
	int startPage=((curpage-1)/10*10)+1;  // 1  11  21
	int endPage=((curpage-1)/10*10)+10;   // 10  20  30
	if(endPage>totalpage)
		endPage=totalpage;
	
	// 쿠키를 읽어서 출력
	List<FoodVO> cList=new ArrayList<FoodVO>();
	Cookie[] cookies=request.getCookies();
	if(cookies!=null){
		for(int i=cookies.length-1;i>=0;i--){
			// 최신순으로
			if(cookies[i].getName().startsWith("food_")){
				String value=cookies[i].getValue();
				FoodVO vo=dao.foodDetailData(Integer.parseInt(value));
				cList.add(vo);
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
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
	<div class="container" style="margin-top: 20px">
		<div class="row">
			<%
			for(FoodVO vo:list){
			%>
			<div class="col-md-3">
			    <div class="thumbnail">
			      <a href="../main/food/detail_before.jsp?no=<%=vo.getFno()%>">
			        <img src="<%=vo.getPoster() %>" style="width:240px;height: 150px;object-fit:cover">
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
		<%--
			1. 목록 / 상세보기
			2. 페이징
			3. CRUD(게시판 , 댓글)
		 --%>
		<div class="row text-center" style="margin-top: 10px; margin-bottom: 30px;">
			<ul class="pagination">
			<%
				if(startPage>1)
				{
			%>
				<li><a href="main.jsp?page=<%=startPage-1%>">&laquo;</a></li>
			<%
				}
			%>
				<%
				for(int i=startPage;i<=endPage;i++){
				%>
				<li><a href="main.jsp?page=<%=i%>"><%=i %></a></li>
				<%
				}
				%>
			<%
				if(endPage<totalpage)
				{
			%>
				<li><a href="main.jsp?page=<%=endPage+1%>">&raquo;</a></li>
			<%
				}
			%>
			</ul>
		</div>
		<div class="row" style="margin-top: 20px">
			<div class="recent-container">
				<h3>최근 방문 맛집</h3>
				<div class="recent-list">
					<%
					for(FoodVO vo:cList){
					%>
					<a class="recent-card" href="../main/main.jsp?mode=2&no=<%=vo.getFno() %>">
						<div class="thumb">
							<img src="<%=vo.getPoster()%>">
						</div>
						<div class="meta">
							<div class="title"><%=vo.getName() %></div>
						</div>
					</a>
					<%
					}
					%>
				</div>
			</div>
		</div>
	</div>
</body>
</html>