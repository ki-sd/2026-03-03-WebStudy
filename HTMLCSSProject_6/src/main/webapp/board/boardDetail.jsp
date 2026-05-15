<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<%
	String strNo=request.getParameter("no");
	if(strNo==null){
		strNo="";
	}
	int no=Integer.parseInt(strNo);
	BoardDAO dao=new BoardDAO();
	BoardVO vo=dao.boardDetailData(no);
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
.table{
	background: white;
	border-radius: 12px;
	overflow: hidden;
}
pre{
	white-space: pre-wrap;
	background: white;
	border: none;
}
</style>
</head>
<body>
	<div class="container">
		<div class="board-wrap">
			<div class="row">
				<table class="table">
					<tbody>
						<tr>
							<th width="20%" class="text-center success">번호</th>
							<td width="30%"><%=vo.getNo() %></td>
							<th width="20%" class="text-center success">작성일</th>
							<td width="30%"><%=vo.getDbday() %></td>
						</tr>
						<tr>
							<th width="20%" class="text-center success">이름</th>
							<td width="30%"><%=vo.getName() %></td>
							<th width="20%" class="text-center success">조회수</th>
							<td width="30%"><%=vo.getHit() %></td>
						</tr>
						<tr>
							<th width="20%" class="text-center success">제목</th>
							<td colspan="3"><%=vo.getSubject() %></td>
						</tr>
						<tr>
							<td colspan="4" class="text-left" valign="top" height="200" style="background: white; ">
							<pre><%=vo.getContent() %></pre></td>
						</tr>
						<tr>
							<td colspan="4" class="text-right">
								<a href="boardUpdate.jsp?no=<%=vo.getNo() %>" class="btn btn-xs btn-info">수정</a>
								<a href="boardDelete.jsp?no=<%=vo.getNo() %>" class="btn btn-xs btn-success">삭제</a>
								<a href="boardList.jsp" class="btn btn-xs btn-warning">목록</a>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>