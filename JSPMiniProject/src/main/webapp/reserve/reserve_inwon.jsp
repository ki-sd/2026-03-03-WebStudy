<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(()=>{
	$('.inwons').on('click',(e)=>{
		let inwon=$(e.currentTarget).text()
		$('#food_reserve_popul').text(inwon)
		$('#ok').show()
	})
})
</script>
</head>
<body>
	<table class="table">
		<tbody>
			<tr>
				<td>
					<c:forEach var="i" begin="2" end="5">
					<span class="btn btn-xs btn-danger inwons">${i }명</span>
					</c:forEach>
					<span class="btn btn-xs btn-danger inwons">단체</span>
				</td>
			</tr>
		</tbody>
	</table>
</body>
</html>