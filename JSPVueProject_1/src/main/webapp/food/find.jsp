<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
		1. Vue 특징
		   1) 가상돔 이용
		      ---- 임시메모리 => 모든 작업을 한다 => 실제 저장된 데이터와 비교
		                                     다른곳만 갱신
		      => 저장 => mount("처리할 곳")
		                     ---------- CSS선택자 이용
		                     부분적 처리
		   2) 가벼움 / 사용이 쉬움 : 모든 개발자 같은 패턴 사용
		   3) Vue => 점차적으로 React 형식으로 변경중
		                    ------ facebook + opensource
		                           react-query   tanstack-query
		   4) 컴포지션 API (setup() => 도입)
		   5) TypeScript 친화적
		2. Vue 역할
		   1) 상태관리 : 데이터 변경 => 자동으로 HTML에 적용
		      ------ Vue => 관리 / 화면 => Vuex => 라이브러리화 : Pinia
		             ---- 관리+화면        | 프레임워크화 : NuxtJS
		             *** 현재 Front 표준 : NextJS (+AI)
		                                ------- React기반
		                                
		=> UI
		   디렉티브
		     v-if / v-if ~ v-else / v-else-if ... 조건문
		     v-for : 반복문
		     v-bind => :으로 대체 (변수와 태그 매칭)
		       => 속성값 추가시에는 bind <img :src="vo.poster">
		     v-model => 양방향
		     
		     v-show : => 토글
		     v-text / v-html
		       => textConten => text() => v-text
		       => innerHTML => html() => v-html
		     v-memo : Callback => 재호출
		     v-once : 한번만 호출
		     v-on : 이벤트 처리 ====> @
		     v-pre : 컴파일 생략
		     v-cloak : 로딩 깜빡임 방지
		     
		   => 화면 츨력 : <태그>{{}}</태그> => react : {}
		                    ---- ThymeLeaf 동일
		   형식)
		       Vue.createApp({
		       		data(){
		       			return {
		       		    	변수 ==> 여기에 설정된 변수만 수정시 HTML 적용
		       			}
		       		},
		       		처리 => 데이터 갱신 : ViewModel
		       		생명주기함수
		       		methods:{
		       			사용자정의함수
		       		},
		       		components:{
		       			화면 조각 => 통합
		       		},
		       		computed:{
		       		
		       		},
		       		watch:{
		       		
		       		}
		       }).mount('제어할 태그의 식별자')
		       
		 Vue에서 화면 이동 : Router
 --%>
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
</style>
<script type="text/javascript" src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
<script type="text/javascript" src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript" src="page_card.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<select class="input-sm" v-model="column">
				<option value="type">음식종류</option>
				<option value="name">업체명</option>
				<option value="address">주소</option>
			</select>
			<%--
				@submit.prevent=""
				@blur=""
				@click=""
				@change=""
				@keydown.enter=""
			 --%>
			<input type="text" size="20" class="input-sm" v-model="ss" refs="ssInput" @keydown.enter="find()">
			<button type="button" class="btn-sm btn-primary" @click="find()">검색</button>
		</div>
		<div class="row" style="margin-top: 20px">
			<div class="col-sm-3" v-for="vo in find_list" :key="vo.fno">
				<a :href="'../food/detail.do?no='+vo.fno">
					<div class="thumbnail">
						<img :src="vo.poster" :title="vo.address" style="width: 250px;height: 150px;object-fit: cover">
						<p class="text-center" style="text-decoration: none;color: black">{{vo.name}}</p>
					</div>
				</a>
			</div>
		</div>
		<div class="row text-center" style="margin-top: 20px">
			<pagecard></pagecard>
		</div>
	</div>
	<script>
	let find=Vue.createApp({
		data(){
			return {
				startPage:0,
				endPage:0,
				totalpage:0,
				curpage:1,
				column:'address',
				ss:'마포',
				find_list:[]
			}
		},
		mounted(){
			this.dataRecv()
		},
		methods:{
			dataRecv(){
//				let formData=new URLSearchParams()
//				formData.append('page', this.curpage);
//		        formData.append('column', this.column);
//		        formData.append('ss', this.ss);
		        
				axios.post('../food/find_vue.do',null,{
					params:{
						page:this.curpage,
						column:this.column,
						ss:this.ss
					}
				})
				.then(response=>{
					console.log(response.data)
					this.find_list=response.data.find_list
					this.endPage=response.data.endPage
					this.curpage=response.data.curpage
					this.startPage=response.data.startPage
					this.totalpage=response.data.totalpage
				})
			},
			move(page){
				this.curpage=page
				this.dataRecv()
			},
			range(start,end){
				let arr=[]
				let len=end-start
				for(let i=0;i<=len;i++){
					arr[i]=start
					start++
				}
				return arr
			},
			find(){
				if(this.ss.trim()===""){
					this.$refs.ssInput.focus()
					return
				}
				else{
					this.curpage=1
					this.dataRecv()
				}
			}
		},
		components:{
			pagecard:page_card
		},
		computed:{
			
		}
	}).mount('.container')
	</script>
</body>
</html>