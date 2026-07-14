<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-4.0.0.min.js"></script>
<script type="text/javascript">
$((e)=>{
	$('.grade').on('change',(e)=>{
		let id=$(e.currentTarget).attr("data-id")
		let grade=$(e.currentTarget).val()
		$.ajax({
			type:'get',
			url:'../adminpage/member_update.do',
			data:{"id":id,"grade":grade},
			success:(result)=>{
				if(result.trim()==1){
					location.href="../adminpage/member_list.do"
				}else{
					alert("등급 상향에 문제가 발생하였습니다")
				}
			}
		})
	})
})
</script>
</head>
<body>
	<main class="admin-main">
		<h2>회원 목록</h2>
	
		<section class="recent-section">
			<table>
				<tr>
					<th class="text-center">아이디</th>
					<th class="text-center">이름</th>
					<th class="text-center">성별</th>
					<th class="text-center">주소</th>
					<th class="text-center">전화</th>
					<th class="text-center">등급</th>
				</tr>
				<c:forEach var="vo" items="${mList }">
					<tr>
						<td class="text-center">${vo.id }</td>
						<td><a href="" style="text-decoration: none;color: black">${vo.name }</a></td>
						<td class="text-center">${vo.sex }</td>
						<td class="text-center">${vo.addr1 }&nbsp;${vo.addr2 }</td>
						<td class="text-center">${vo.phone }</td>
						<td class="text-center">
							<select class="grade" data-id="${vo.id }">
								<option value="1" ${vo.grade==1?"selected":"" }>새싹멤버</option>
								<option value="2" ${vo.grade==2?"selected":"" }>일반멤버</option>
								<option value="3" ${vo.grade==3?"selected":"" }>성실멤버</option>
								<option value="4" ${vo.grade==4?"selected":"" }>열심멤버</option>
								<option value="5" ${vo.grade==5?"selected":"" }>핵심멤버</option>
							</select>
						</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="6" class="text-center">
						<a href="../adminpage/member_list.do?page=${curpage>1?curpage-1:curpage }" class="btn btn-sm btn-primary">이전</a>
						${curpage } page / ${totalpage } pages
						<a href="../adminpage/member_list.do?page=${curpage<totalpage?curpage+1:curpage }" class="btn btn-sm btn-primary">다음</a>
					</td>
				</tr>
			</table>
		</section>
	</main>
</body>
</html>