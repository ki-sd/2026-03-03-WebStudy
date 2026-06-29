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
	width: 800px;
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
h3{
	text-align: center;
	cursor: default;
}
textarea{
	cursor: default;
}
</style>
<script type="text/javascript" src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
<script type="text/javascript" src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<p>단가: {{price}}원</p>
			<button class="btn-sm btn-danger" @click="account--" :disabled="account <= 1">-</button>
			<span>{{account}}</span>
			<button class="btn-sm btn-primary" @click="account++">+</button>
			<p>총 금액: {{totalPrice}}</p>
		</div>
	</div>
	<script>
	/*
		Vue.createApp({
			// Model
			data(){
				return{
					html에 적용하는 변수 설정 => this.
					---- View
				}
			},
			생명주기 함수
			mounted(){	
				브라우저가 HTML을 읽어온 경우 
			},
			created(){
				Vue 객체 생성시
				채팅 => 연결 webSocket
			},
			updated(){
				데이터 변경된 경우 => data() 안에 있는 변수값이 변경
			},
			unmounted(){
				Vue 객체 해제 => 화면변경 / 새로고침 => CallBack
			},
			사용자 정의함수
			methods:{
				공통 모듈 / 이벤트 처리
			},
			computed:{
				계산식
			},
			watch:{
				감시 => 데이터값 변경 감지해서 변경시마다 처리
			},
			components:{
				다른 HTML을 조합하는 경우
				페이지 / 지도 / 상세보기 / 예약
			}
		}).mount("선택된 html (CSS 선택자)")
		
		서버연결
		axios.get(url,data)
		axios.post(url,data,config)
		               ---- null , {}
	    -------------------------------- 요청시
	    .then(response=>{
	    	response는 결과값을 갖고온다
	    	-------- 여러개의 데이터를 갖고있다
	    	-------- 실제 전송된 데이터는 data => response.data
	    })
	    
	    => 회면 변경없이 그자리에 처리
	       ajax / axios / fetch
	              ----- ajax 포함
	    => Vue / React의 장점은 태그를 만들어서 추가하지 않음
	             ----- HTML을 만들어서 추가 
	             ----- jsx를 이용 => ""없이
	       --- HTML 자체를 제어
	*/
	const goods=Vue.createApp({
		data(){
			return{
				price:10000,
				account:1
			}
		},
		computed:{
			totalPrice(){
				return (this.price * this.account).toLocaleString()
			}
		},
		watch:{
			account(newVal,oldVal){
				console.log("수량 변경:"+oldVal+"->"+newVal)
			}
		}
	}).mount(".container")
	</script>
</body>
</html>