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
	EmpDAO dao=new EmpDAO();
	int rowCount=dao.empRowCount();
	int totalPage=(int)Math.ceil((double)rowCount/offsetCount);
	// rowCount(전체 글 수)
	// curPage(현재 페이지) offsetCount(한 페이지에 출력되는 글 수)
	int count=((curPage-1)*offsetCount)+1;
	List<EmpVO> list=dao.empListData(curPage, offsetCount);
	
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
			<h3>사원목록</h3>
			<div class="row">
				<table class="table">
					<tbody>
						<tr>
							<td>
								<a href="empInsert.jsp" class="btn btn-sm btn-success">사원추가</a>
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
							<th width=10% class="text-center">사번</th>
							<th width=15% class="text-center">이름</th>
							<th width=15% class="text-center">부서</th>
							<th width=15% class="text-center">직위</th>
							<th width=20% class="text-center">급여</th>
							<th width=25% class="text-center">입사일</th>
						</tr>
					</thead>
					<tbody>
					<%
						for(EmpVO vo:list){
					%>
						<tr class="emplist" style="text-align: center">
							<td><%=count++ %></td>
							<td>
								<a href="empDetail.jsp?no=<%=vo.getEmpno() %>" class="text-center" style="text-decoration: none; color: black;">
									<%=vo.getEname() %>
								</a>
							</td>
							<td><%=vo.getDvo().getDname() %></td>
							<td><%=vo.getJob() %></td>
							<td><%=vo.getSal2() %>만원</td>
							<td><%=vo.getDbday() %></td>
						</tr>
					<%
						}
					%>
					</tbody>
				</table>
			</div>
			<div class="row text-center">
			<a href="empList.jsp?page=<%=curPage>1?curPage-1:curPage %>" class="btn btn-sm btn-warning">이전</a>
			<%=curPage %> page / <%=totalPage %> pages
			<a href="empList.jsp?page=<%=curPage<totalPage?curPage+1:curPage %>" class="btn btn-sm btn-warning">다음</a>
			</div>
		</div>
	</div>
</body>
</html>