<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<%
	//1. 사용자가 보내준 데이터 받기
	//detai.jsp?fno=1
	String strFno=request.getParameter("fno");
	FoodDAO dao=new FoodDAO();
	FoodVO vo=dao.foodDetailData(Integer.parseInt(strFno));
	// => vo에 있는 데이터 출력
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container {
	margin-top: 50px;
}
.row {
	width: 960px;
	/* 가운데 정렬 */
	margin: 0px auto;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<table class="table">
				<tbody>
					<tr>
						<td width=30% class="text-center" rowspan="8">
							<img src="<%=vo.getPoster() %>" 
							style="width: 300px;height: 350px" 
							class="img-rounded">
						</td>
						<td colspan="2">
							<h3><%=vo.getName() %>&nbsp;
								<span style="color: orange;"><%=vo.getScore() %>
								</span>
							</h3>
						</td>
					</tr>
					<tr>
						<td width=10% class="text-center">음식종류</td>
						<td width=60%><%=vo.getType() %></td>
					</tr>
					<tr>
						<td width=10% class="text-center">주소</td>
						<td width=60%><%=vo.getAddress() %></td>
					</tr>
					<tr>
						<td width=10% class="text-center">전화</td>
						<td width=60%><%=vo.getPhone() %></td>
					</tr>
					<tr>
						<td width=10% class="text-center">가격대</td>
						<td width=60%><%=vo.getPrice() %></td>
					</tr>
					<tr>
						<td width=10% class="text-center">영업시간</td>
						<td width=60%><%=vo.getTime() %></td>
					</tr>
					<tr>
						<td width=10% class="text-center">주차</td>
						<td width=60%><%=vo.getParking() %></td>
					</tr>
					<tr>
						<td width=10% class="text-center">테마</td>
						<td width=60%><%=vo.getTheme() %></td>
					</tr>
					<tr>
						<td colspan="3">
							<pre style="white-space: pre-wrap;background-color: white;border: none"><%=vo.getContent() %></pre>
						</td>
					</tr>
					<tr>
						<td colspan="3" class="text-right">
							<button class="btn-xs btn-danger">좋아요</button>
							<button class="btn-xs btn-success">찜하기</button>
							<button class="btn-xs btn-warning">예약</button>
							<button class="btn-xs btn-primary" onclick="javascript:history.back()">목록</button>
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<div id="map" style="width:800px;height:350px;"></div>
							<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey='API키'&libraries=services"></script>
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
							geocoder.addressSearch('<%=vo.getAddress() %>', function(result, status) {
							
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
							            content: '<div style="width:150px;text-align:center;padding:6px 0;"><%=vo.getName()%></div>'
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