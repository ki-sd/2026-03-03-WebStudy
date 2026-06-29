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
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
<script type="text/javascript" src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<%--
	1. Vue => React / jQuery / AngularJS
	          |가상돔   |값읽기    |양방향
	          -------------------------- 다른 프레임워크와 연동 가능
	2. 화면 출력 (Vue)
	   v-for ===> 반복문 ===> v-for="변수 in 배열"
	   v-if  ===> 조건문
	   v-show ===> Toggle (true/false)
	   v-model ===> 양방향 (data()에 설정된 변수 == HTML에서 입력된 값 매칭)
	   v-on ===> 이벤트 처리 : v-on:clock="함수"  =>  @click="함수"
	   v-bind ==> 속성에 값을 주입 ==> :src, :href ...
	   v-memo ==> cache 메모리 => callback
	   v-slot / v-once
	   ==================> 디렉티브
	3. ViewModel  ===> MVVM (Model-View-ViewModel)
	                                    --------- 데이터 처리
	                               ---- HTML
	                         ----- 데이터관리 (data())
	   => mounted(),methods:{},components:{},computed:{},watch:{} ...
 --%>
<body>
	<div class="container">
		<div class="row">
			<button class="btn-sm btn-danger">실행</button>
			<p id="print" style="display: none">
				<input type="text" id="name" class="input-sm" size="20" v-model="msg">
			</p>
		</div>
	</div>
	<script>
	const reply=Vue.createApp({
		data(){
			return{
				msg:'홍길동',
				no:0
			}
		},
		// Vue + jQuery => mounted(){} 안에 코딩
		mounted(){
			$('.btn-danger').on('click',(e)=>{
				if(this.no===0){
					$('#print').show()
					$(e.currentTarget).text('취소')
					this.no=1
				}else{
					$('#print').hide()
					$(e.currentTarget).text('실행')
					this.no=0
				}
			})
		}
	}).mount('.container')
	</script>
</body>
</html>