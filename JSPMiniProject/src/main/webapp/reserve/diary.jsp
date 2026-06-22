<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
   margin-top: 50px;
}
.row {
  margin: 0px auto;
  width: 700px;
}
h3 {
   text-align: center;
}
</style> -->
<!-- <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script> -->
<script type="text/javascript">
$(()=>{
	$('#year').on('change',function(){
		$('#frm').submit()
	})
	$('#month').on('change',function(){
		$('#frm').submit()
	})
	
	$('.day-link').on('click',function(){
		let year=$('#year').val()
		let month=$('#month').val()
		let day=$(this).text()
		let rday=year+"-"+month+"-"+day
		$('#food_reserve_day').text(rday)
		
		$.ajax({
			type:'post',
			url:'../reserve/reserve_time.do',
			success:(result)=>{
				$('#r_time').html(result)
			}
		})
	})
})
</script>
<style type="text/css">
.day-link{
	cursor:pointer;
}
</style>
</head>
<body>
     
     	<table class="table">
     		<tr>
     			<td>
     				<h3>${year }년도 ${month }월 ${today }일</h3>
     			</td>
     		</tr>
     	</table>

     		<form method="post" action="../reserve/diary.do" id="frm">
     		<table class="table">
     			<tbody>
     				<tr>
     					<td>
     						<select name="year" class="input-sm" id="year">
     							<c:forEach var="i" begin="2026" end="2030">
     								<option ${i==year?"selected":"" }>${i }</option>
     							</c:forEach>
     						</select>년도 &nbsp;
     						<select name="month" class="input-sm" id="month">
     							<c:forEach var="i" begin="1" end="12">
     								<option ${i==month?"selected":"" }>${i }</option>
     							</c:forEach>
     						</select>월 &nbsp;
     					</td>
     				</tr>
     			</tbody>
     		</table>
     		</form>

     	
     		<table class="table">
     			<tbody>
     				<tr class="danger">
     				<c:set var="k" value="0"/>
     				<c:set var="color" value="black"/>
     					<c:forEach var="w" items="${strWeek }">
     						<c:choose>
     							<c:when test="${k==0 }">
     								<c:set var="color" value="red"/>
     							</c:when>
     							<c:when test="${k==6 }">
     								<c:set var="color" value="blue"/>
     							</c:when>
     							<c:otherwise>
     								<c:set var="color" value="black"/>
     							</c:otherwise>
     						</c:choose>
     						<th style="height: 30px; color:${color}" class="text-center">${w }</th>
     						<c:set var="k" value="${k+1 }"/>
     					</c:forEach>
     				</tr>
     				<c:set var="week" value="${week }"/>
     				<c:forEach var="i" begin="1" end="${lastday }">
     					<c:if test="${i==1 }">
     					<tr>
     						<c:forEach var="j" begin="1" end="${week }">
     						<td class="text-center">&nbsp;</td>
     						</c:forEach>
     					</c:if>
     					<c:if test="${today>i }">
     						<td class="text-center ${today==i?'success':'' }"><h4 style="color:gray; cursor: default;">${i }</h4></td>
     					</c:if>
     					<c:if test="${today<=i }">
     						<td class="text-center ${today==i?'success':'' }"><h4 class="day-link" style="color: green">${i }</h4></td>
     					</c:if>
     					<c:set var="week" value="${week+1 }"/>
     					<c:if test="${week>6 }">
     						<c:set var="week" value="0"/>
     						</tr>
     						<tr>
     					</c:if>
     				</c:forEach>
     				</tr>
     			</tbody>
     		</table>
     		
     	
     
</body>
</html>