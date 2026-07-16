<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$((e)=>{
	$('.types').on('click',(e)=>{
		let type=$(e.currentTarget).text()
		$.ajax({
			method:'post',
			url:'../reserve/reserve_food.do',
			data:{"type":type},
			success:(result)=>{
				$('#food_list').html(result)
			}
		})
	})
	$('.btns').on('click',(e)=>{
		let type=$(e.currentTarget).attr("data-type")
		let page=$(e.currentTarget).attr("data-page")
		$.ajax({
			method:'post',
			url:'../reserve/reserve_food.do',
			data:{"type":type,"page":page},
			success:(result)=>{
				$('#food_list').html(result)
			}
		})
	})
	$('.food-item').on('click',(e)=>{
		let no=$(e.currentTarget).attr("data-no")
		let poster=$(e.currentTarget).attr("data-poster")
		let name=$(e.currentTarget).attr("data-name")
		$('#food-poster').attr("src",poster)
		$('#food-name').text(name)
		$('.table-borderless').show()
		$('#rno').val(no)
		$('#food-poster').show()
		$('#food-name').show()
		
		$.ajax({
			type:'post',
			url:'../reserve/reserve_date.do',
			success:(result)=>{
				$('#food_rdays').html(result)
			}
		})
	})
})
</script>
</head>
<body>
	<table class="table">
		<tr>
			<td class="text-center">
				<button type="button" class="btn-xs bg-danger text-white types">한식</button>
				<button type="button" class="btn-xs bg-warning text-white types">양식</button>
				<button type="button" class="btn-xs bg-primary text-white types">중식</button>
				<button type="button" class="btn-xs bg-info text-white types">일식</button>
				<button type="button" class="btn-xs bg-success text-white types">분식</button>
			</td>
		</tr>
	</table>
	<table class="table table-hover align-middle">
		<tbody>
		<c:forEach var="vo" items="${list }">
			<tr class="food-item" data-poster="${vo.poster }" data-name="${vo.name }" data-no="${vo.no }">
				<td>
					<img src="${vo.poster }" class="rounded" style="width: 150px;height: 100px">
				</td>
				<td>
					<strong>${vo.name }</strong><br>
					<small>${vo.type }</small>
				</td>
			</tr>		
		</c:forEach>
			<tr>
				<td colspan="2" class="text-center">
					<button class="btn bg-success btn-sm btns" data-page="${curpage>1?curpage-1:curpage }" data-type="${type }">이전</button>
					${curpage } page / ${totalpage } pages
					<button class="btn bg-info btn-sm btns" data-page="${curpage<totalpage?curpage+1:curpage }" data-type="${type }">다음</button>
				</td>
			</tr>
		</tbody>
	</table>
</body>
</html>