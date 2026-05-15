<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%@ page import="java.text.*" %>
<%
	String strPage=request.getParameter("page");
	int offsetCount=10;
	if(strPage==null || strPage.trim().equals("")){
		strPage="1";
	}
	int curPage=Integer.parseInt(strPage);
	BoardDAO dao=new BoardDAO();
	int rowCount=dao.boardRowCount();
	int totalPage=(int)Math.ceil((double)rowCount/offsetCount);
	// rowCount(전체 글 수)
	// curPage(현재 페이지) offsetCount(한 페이지에 출력되는 글 수)
	int count=rowCount-((curPage-1)*offsetCount);
	List<BoardVO> list=dao.boardListData(curPage, offsetCount);
	
	String today=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
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
	width: 800px;
}
h3{
	text-align: center;
}
.boardlist{
	text-align: center;
}
.board-wrap{
	background: #FFF;
	padding: 30px;
	border-radius: 18px;
	box-shadow: 0 8px 25px rgba(0,0,0,0.08);
}
.btn-success{
	border: none;
	border-radius: 30px;
	padding: 8px 18px;
	font-weight: bold;
	transition: all 0.3s ease;
}
.btn-success{
	transform: translateY(-2px);
	box-shadow: 0 5px 15px rgba(0,206,201,0.4);
}
.table{
	background: white;
	border-radius: 12px;
	overflow: hidden;
}
.table tbody tr.boardlist:hover{
	background: #F1F5FF;
	transform: scale(1.01);
}
</style>
</head>
<body>
	<div class="container">
		<div class="board-wrap">
			<h3>자유 게시판 (JDBC=CRUD)</h3>
			<div class="row">
				<table class="table">
					<tbody>
						<tr>
							<td>
								<a href="boardInsert.jsp" class="btn btn-sm btn-success">새글</a>
								<%--
									btn-xs / sm / md / lg
									btn-danger(red) / success(green) / warning(orange)
									btn-info(cyan) / primary(blue) / default(gray)
								 --%>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="row" style="margin-top: 10px">
				<table class="table">
					<thead>
						<tr class="danger">
							<th width=10% class="text-center">번호</th>
							<th width=45% class="text-center">제목</th>
							<th width=15% class="text-center">이름</th>
							<th width=20% class="text-center">작성일</th>
							<th width=10% class="text-center">조회수</th>
						</tr>
					</thead>
					<tbody>
					<%
						for(BoardVO vo:list){
					%>
						<tr class="boardlist">
							<td><%=count-- %></td>
							<td>
								<div style="display: flex; align-items: center; width: 100%">
									<a href="boardDetail.jsp?no=<%=vo.getNo() %>" class="subject" style="min-width: 0; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; text-decoration: none; color: black;">
										<%=vo.getSubject() %>
									</a>
									&nbsp;
									<%
										if(today.equals(vo.getDbday())){
									%>
										<span style="flex-shrink: 0; margin-left: 5px;">
											<sup><img src="new.gif"></sup>
										</span>
									<%		
										}
									%>
								</div>
							</td>
							<td><%=vo.getName() %></td>
							<td><%=vo.getDbday() %></td>
							<td><%=vo.getHit() %></td>
						</tr>
					<%
						}
					%>
					</tbody>
				</table>
			</div>
			<div class="row text-center">
			<a href="boardList.jsp?page=<%=curPage>1?curPage-1:curPage %>" class="btn btn-sm btn-warning">이전</a>
			<%=curPage %> page / <%=totalPage %> pages
			<a href="boardList.jsp?page=<%=curPage<totalPage?curPage+1:curPage %>" class="btn btn-sm btn-warning">다음</a>
			</div>
		</div>
	</div>
</body>
</html>