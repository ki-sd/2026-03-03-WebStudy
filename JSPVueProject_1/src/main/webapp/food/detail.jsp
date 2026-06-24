<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	width: 100%;
}
p{
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}
.a-link:hover{
	cursor: pointer;
}
button{
	margin-left: 2px
}
</style>
<script type="text/javascript" src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
<script type="text/javascript" src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<table class="table">
				<tbody>
					<tr>
						<th class="text-center" width="30%" rowspan="9">
							<img :src="food_detail.poster" style="width: 100%">
						</th>
						<td colspan="2"><h3>{{food_detail.name}}&nbsp;<span style="color: orange">{{food_detail.score}}</span></h3></td>
					</tr>
					<tr>
						<td width="10%" style="color: gray">주소</td>
						<td width="60%">{{food_detail.address}}</td>
					</tr>
					<tr>
						<td width="10%" style="color: gray">전화</td>
						<td width="60%">{{food_detail.phone}}</td>
					</tr>
					<tr>
						<td width="10%" style="color: gray">음식종류</td>
						<td width="60%">{{food_detail.type}}</td>
					</tr>
					<tr>
						<td width="10%" style="color: gray">주차</td>
						<td width="60%">{{food_detail.parking}}</td>
					</tr>
					<tr>
						<td width="10%" style="color: gray">가격대</td>
						<td width="60%">{{food_detail.price}}</td>
					</tr>
					<tr>
						<td width="10%" style="color: gray">영업시간</td>
						<td width="60%">{{food_detail.time}}</td>
					</tr>
					<tr>
						<td width="10%" style="color: gray">테마</td>
						<td width="60%">{{food_detail.theme}}</td>
					</tr>
					<tr>
						<td colspan="3">{{food_detail.content}}</td>
					</tr>
					<tr>
						<td colspan="3" class="text-right">
							<button type="button" class="btn-xs btn-danger">좋아요</button>
							<button type="button" class="btn-xs btn-success">찜하기</button>
							<button type="button" class="btn-xs btn-info">예약하기</button>
							<button type="button" class="btn-xs btn-primary" onclick="history.back()">목록</button>
						</td>
					</tr>
				</tbody>
			</table>
			<table class="table">
				<tbody>
					<tr>
						<td class="text-center">
							<div id="map" style="width:100%;height:350px;"></div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<script>
	let detail=Vue.createApp({
		data(){
			return {
				no:${param.no},
				food_detail:{}
			}
		},
		mounted(){
			this.dataRecv()
		},
		methods:{
			dataRecv(){
				axios.get('../food/detail_vue.do',{
					params:{
						no:this.no
					}
				}).then(response=>{
					this.food_detail=response.data
					if(window.kakao && window.kakao.maps){
						this.initMap()
					}
					else{
						this.addScript()
					}
				})
			},
			addScript(){
				const script=document.createElement("script")
				script.onload=()=>kakao.maps.load(this.initMap)
				script.src="http://dapi.kakao.com/v2/maps/sdk.js?autoload=false&appkey=API키입력&libraries=services"
				document.head.appendChild(script)
				
			},
			initMap(){
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
			geocoder.addressSearch(this.food_detail.address, (result, status)=>{

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
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+this.food_detail.name+'</div>'
			        });
			        infowindow.open(map, marker);

			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			});    
			}
		}
	}).mount(".container")
	</script>
</body>
</html>