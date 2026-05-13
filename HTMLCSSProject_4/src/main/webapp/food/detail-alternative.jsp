<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.sist.dao.*"%>
    
    <%
    FoodDAO dao=new FoodDAO();
    String strFno=request.getParameter("fno");
    int fno = 0;
    if (strFno != null && !strFno.trim().isEmpty()) {
        fno = Integer.parseInt(strFno);
    }
    FoodVO vo=dao.foodDetailData(fno);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="table.css">
<style type="text/css">
h3{
	text-align: center;
}
table{
	margin: 0px auto;
}
</style>
</head>
<body>
	<!-- rowspan -->
	<table id="table_content" width="800">
		<tbody>
			<tr>
				<td width="30%" rowspan="9">
					<img src="<%=vo.getPoster() %>" width="250">
				</td>
				<td colspan="2"><h3><%=vo.getName() %></h3></td>
			</tr>
			<tr>
				<th width="20%">주소</th>
				<td width="50%"><%=vo.getAddress() %></td>
			</tr>
			<tr>
				<th width="20%">전화</th>
				<td width="50%"><%=vo.getPhone() %></td>
			</tr>
			<tr>
				<th width="20%">음식종류</th>
				<td width="50%"><%=vo.getType() %></td>
			</tr>
			<tr>
				<th width="20%">테마</th>
				<td width="50%"><%=vo.getTheme() %></td>
			</tr>
			<tr>
				<th width="20%">평점</th>
				<td width="50%"><%=vo.getScore() %></td>
			</tr>
			<tr>
				<th width="20%">운영시간</th>
				<td width="50%"><%=vo.getTime() %></td>
			</tr>
			<tr>
				<th width="20%">주차</th>
				<td width="50%"><%=vo.getParking() %></td>
			</tr>
			<tr>
				<th width="20%">가격대</th>
				<td width="50%"><%=vo.getPrice() %></td>
			</tr>
		</tbody>
	</table>
	<table id="table_content" width="800">
		<tr>
			<td><pre style="white-space: pre-wrap;"><%=vo.getContent() %></pre></td>
		</tr>
	</table>
	<table width="800">
		<tr>
			<td>
				<div id="map" style="width:100%;height:350px;"></div>
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
	</table>
</body>
</html>