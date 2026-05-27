<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%
	String strPage=request.getParameter("page");
	if(strPage==null)
		strPage="1";
	int curpage=Integer.parseInt(strPage);
	MusicDAO dao=MusicDAO.newInstance();
	List<MusicVO> list=dao.musicListData(curpage);
	int totalPage=dao.musicTotalPage();
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
	width: 1024px;
}
h3{
	text-align: center;
}
th{
	white-space: nowrap;
	text-overflow: ellipsis;
}
td{
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
}
table{
	width: 100%;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<h3>뮤직 TOP200</h3>
			<table class="table">
				<thead>
					<tr class="danger">
						<th class="text-center">순위</th>
						<th class="text-center"></th>
						<th class="text-center"></th>
						<th class="text-center">곡명</th>
						<th class="text-center">가수명</th>
						<th class="text-center">앨범</th>
					</tr>
				</thead>
				<tbody>
				<%
					for(MusicVO vo:list){
				%>
					<tr>
						<td class="text-center"><%=vo.getNo() %></td>
						<td class="text-center">
						<%
							String s="-";
							if(vo.getState().equals("상승")){
								s="<font color='red'>▲ "+vo.getIdcrement()+"</font>";
							}else if(vo.getState().equals("하강")){
								s="<font color='blue'>▼ "+vo.getIdcrement()+"</font>";
							}else{
								
							}
						%>
						<%=s %></td>
						<td class="text-center"><img src="<%=vo.getPoster() %>" width=30 height=30></td>
						<td><%=vo.getTitle() %></td>
						<td style="white-space: nowrap;text-overflow: ellipsis;overflow: hidden;"><%=vo.getSinger() %></td>
						<td style="white-space: nowrap;text-overflow: ellipsis;overflow: hidden;"><%=vo.getAlbum() %></td>
					</tr>
				<%
					}
				%>
				</tbody>
			</table>
			<table class="table">
				<tr>
					<td class="text-center">
						<a href="musicList.jsp?page=<%=curpage>1?curpage-1:curpage %>" class="btn btn-sm btn-primary">이전</a>
							<%=curpage %> page / <%=totalPage %> pages
						<a href="musicList.jsp?page=<%=curpage<totalPage?curpage+1:curpage %>" class="btn btn-sm btn-primary">다음</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>