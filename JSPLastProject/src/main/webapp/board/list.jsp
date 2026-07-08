<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#subject{
	white-space: nowrap;
	text-overflow: ellipsis;
}
#subjectLink{
	text-decoration: none;
	color: black
}
#subjectLink:hover{
	color: gray
}
.dataTr td{
	font-size: 12px
}
</style>
</head>
<body>
	<div class="breadcumb-area" style="background-image: url(../img/bg-img/breadcumb.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <div class="bradcumb-title text-center">
                        <h2>자유 게시판</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="breadcumb-nav">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="../main/main.do"><i class="fa fa-home" aria-hidden="true"></i> Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">자유 게시판</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <section class="archive-area section_padding_40">
        <div class="container" style="width:800px">
            <div class="row">
            	<table class="table">
	            	<tr>
	            		<c:if test="${sessionScope.id!=null }">
	            			<td>
	            				<a href="../board/insert.do" class="btn btn-sm btn-outline-primary">새글</a>
	            			</td>
	            		</c:if>
	            	</tr>
            	</table>
            	<table class="table">
            		<tr class="table-success">
            			<th width="10%" class="text-center">번호</th>
            			<th width="45%" class="text-center">제목</th>
            			<th width="15%" class="text-center">작성자</th>
            			<th width="20%" class="text-center">작성일</th>
            			<th width="10%" class="text-center">조회수</th>
            		</tr>
            		<c:set var="count" value="${count }" />
	            		<c:forEach var="vo" items="${list }">
		            		<tr class="dataTr">
		            			<td width="10%" class="text-center">${count }</td>
		            			<td width="45%" id="subject">
		            				<a href="../board/detail.do?no=${vo.no }" id="subjectLink">
		            					${vo.subject }
		            					<c:if test="${vo.dbday==today }">
		            						&nbsp;<sup><img src="../img/new.gif"></sup>
		            					</c:if>
		            				</a>
		            			</td>
		            			<td width="15%" class="text-center">${vo.name }</td>
		            			<td width="20%" class="text-center">${vo.dbday }</td>
		            			<td width="10%" class="text-center">${vo.hit }</td>
		            		</tr>
		            		<c:set var="count" value="${count-1 }"/>
	            		</c:forEach>
            		<tr>
            			<td colspan="5" class="text-center">
            				<a href="../board/list.do?page=${curpage>1?curpage:1 }" class="btn btn-sm btn-outline-danger">이전</a>
            				${curpage } page / ${totalpage } pages
            				<a href="../board/list.do?page=${curpage<totalpage?curpage+1:curpage }" class="btn btn-sm btn-outline-danger">다음</a>
            			</td>
            		</tr>
            	</table>
            </div>
        </div>
    </section>
</body>
</html>