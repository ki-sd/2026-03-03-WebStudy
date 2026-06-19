<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="breadcumb-area" style="background-image: url(../img/bg-img/breadcumb.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <div class="bradcumb-title text-center">
                        <h2>자료실</h2>
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
                          
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <section class="single_blog_area section_padding_80">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-lg-8">
                	<table class="table">
                		<tbody>
                			<tr>
                				<td>
                					<a href="../board/insert.do" class="btn btn-sm btn-danger">글쓰기</a>
                				</td>
                			</tr>
                		</tbody>
                	</table>
                	<table class="table">
                		<thead>
                			<tr class="success">
                				<th width="10%" class="text-center">번호</th>
                				<th width="45%" class="text-center">제목</th>
                				<th width="15%" class="text-center">이름</th>
                				<th width="20%" class="text-center">작성일</th>
                				<th width="10%" class="text-center">조회수</th>
                			</tr>
                		</thead>
                		<tbody>
                			<c:set var="count" value="${count }"/>
                			<c:forEach var="vo" items="${list }">
                				<tr>
	                				<td width="10%" class="text-center">${count }</td>
	                				<td width="45%"><a href="../board/detail.do?no=${vo.no }" style="text-decoration: none;color: black;font-weight: normal;">${vo.subject }</a></td>
	                				<td width="15%" class="text-center">${vo.name }</td>
	                				<td width="20%" class="text-center">${vo.dbday }</td>
	                				<td width="10%" class="text-center">${vo.hit }</td>
                				</tr>
                				<c:set var="count" value="${count-1 }"/>
                			</c:forEach>
                			<tr>
                				<td class="text-center" colspan="5">
                					<a href="../board/list.do?page=${curpage>1?curpage-1:curpage }" class="btn btn-sm btn-primary">&laquo;</a>
                						${curpage } page / ${totalpage } pages
                					<a href="../board/list.do?page=${curpage<totalpage?curpage+1:curpage }" class="btn btn-sm btn-primary">&raquo;</a>
                				</td>
                			</tr>
                		</tbody>
                	</table>
                </div>
            </div>
        </div>
    </section>
</body>
</html>