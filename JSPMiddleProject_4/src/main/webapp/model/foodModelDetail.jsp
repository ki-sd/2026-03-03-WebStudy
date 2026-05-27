<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.model.*"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%
	FoodModel model=new FoodModel();
	model.foodDetailData(request);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.detail{
	margin: 0px auto;
	width: 960px;
}
#image{
	width: 100%;
	height: 350px;
	object-fit: cover;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row detail">
			<table class="table">
				<tbody>
					<tr>
						<td width=30% class="text-center" rowspan="8">
							<img src="${vo.poster }" id="image" class="img-rounded">
						</td>
						<td colspan="2">
							<h3>${vo.name }&nbsp;
								<span style="color:orange">${vo.score }</span>
							</h3>
						</td>
					</tr>
					<tr>
						<th class="text-center" style="color: gray" width= 15%>음식 종류</th>
						<td width=55%>${vo.type }</td>
					</tr>
					<tr>
						<th class="text-center" style="color: gray" width= 15%>주소</th>
						<td width=55%>${vo.address }</td>
					</tr>
					<tr>
						<th class="text-center" style="color: gray" width= 15%>전화</th>
						<td width=55%>${vo.phone }</td>
					</tr>
					<tr>
						<th class="text-center" style="color: gray" width= 15%>가격</th>
						<td width=55%>${vo.price }</td>
					</tr>
					<tr>
						<th class="text-center" style="color: gray" width= 15%>영업시간</th>
						<td width=55%>${vo.time }</td>
					</tr>
					<tr>
						<th class="text-center" style="color: gray" width= 15%>주차</th>
						<td width=55%>${vo.parking}</td>
					</tr>
					<tr>
						<th class="text-center" style="color: gray" width= 15%>테마</th>
						<td width=55%>${vo.theme }</td>
					</tr>
					<tr>
						<td colspan="3">${vo.content }</td>
					</tr>
					<tr>
						<td colspan="3" class="text-right">
							<a href="foodModelList.jsp" class="btn btn-xs btn-success">목록</a>
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<div id="map" style="width:100%;height:350px;"></div>
							<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=발급받은 APP KEY를 사용하세요&libraries=services"></script>
							<script>
								var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
								    mapOption = {
								        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
								        level: 3 // 지도의 확대 레벨
								    };  
								
								// 지도를 생성합니다    
								var map = new kakao.maps.Map(mapContainer, mapOption); 
								
								// 주소-좌표 변환 객체를 생성합니다
								var geocoder = new kakao.maps.services.Geocoder();
								
								// 주소로 좌표를 검색합니다
								geocoder.addressSearch('"${vo.address}"', function(result, status) {
								
								    // 정상적으로 검색이 완료됐으면 
								     if (status === kakao.maps.services.Status.OK) {
								
								        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
								
								        // 결과값으로 받은 위치를 마커로 표시합니다
								        var marker = new kakao.maps.Marker({
								            map: map,
								            position: coords
								        });
								
								        // 인포윈도우로 장소에 대한 설명을 표시합니다
								        var infowindow = new kakao.maps.InfoWindow({
								            content: '<div style="width:150px;text-align:center;padding:6px 0;">"${vo.name}"</div>'
								        });
								        infowindow.open(map, marker);
								
								        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								        map.setCenter(coords);
								    } 
								});    
							</script>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>