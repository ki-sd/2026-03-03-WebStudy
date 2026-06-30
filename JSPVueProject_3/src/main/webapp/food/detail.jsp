<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
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
	width: 700px;
}
p{
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}
.a-link:hover{
	cursor: pointer;
}
.btn{
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
	<div class="container" id="foodDetailApp">
		<div class="panel panel-success product-card">
			<div class="panel-body">
				<div class="row">
					<table class="table">
						<tbody>
							<tr>
								<td class="text-center" width="30%" rowspan="8">
									<img :src="vo.poster" style="width: 100%">
								</td>
								<td colspan="2"><h3>{{vo.name}}&nbsp;<span style="color: orange">{{vo.score}}</span></h3></td>
							</tr>
							<tr>
								<td width="20%">주소</td>
								<td width="50%">{{vo.address}}</td>
							</tr>
							<tr>
								<td width="20%">전화</td>
								<td width="50%">{{vo.phone}}</td>
							</tr>
							<tr>
								<td width="20%">음식종류</td>
								<td width="50%">{{vo.type}}</td>
							</tr>
							<tr>
								<td width="20%">주차</td>
								<td width="50%">{{vo.parking}}</td>
							</tr>
							<tr>
								<td width="20%">가격대</td>
								<td width="50%">{{vo.price}}</td>
							</tr>
							<tr>
								<td width="20%">영업시간</td>
								<td width="50%">{{vo.time}}</td>
							</tr>
							<tr>
								<td colspan="3">{{vo.theme}}</td>
							</tr>
							<tr>
								<td colspan="3">{{vo.content}}</td>
							</tr>
							<tr>
								<td colspan="3" class="text-right">
									<button type="button" class="btn-xs btn-danger" v-if="loginId">좋아요</button>
									<button type="button" class="btn-xs btn-success" v-if="loginId">찜하기</button>
									<button type="button" class="btn-xs btn-info" v-if="loginId">예약하기</button>
									<button type="button" class="btn-xs btn-primary" @click="go()">목록</button>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="panel panel-success" style="margin-top: 20px">
			<div class="panel-body">
				<div class="row">
					<table class="table" v-if="replyList.length===0">
						<tr>
							<td class="text-center">
								<strong>댓글이 없습니다</strong>
							</td>
						</tr>
					</table>
					<table class="table" v-else>
						<tr>
							<td>
								<table class="table" v-for="rvo in replyList" :key="rvo.no">
									<tr>
										<td class="text-left" width="80%">◑{{rvo.name}} ({{rvo.dbday}})</td>
										<td class="text-right" width="20%">
											<button class="btn-xs btn-success" v-if="rvo.id===loginId" @click="toggle(rvo)">{{rvo.show?"취소":"수정"}}</button>
											<button class="btn-xs btn-danger" v-if="rvo.id===loginId" @click="deleteReply(rvo.no)" style="margin-left: 2px">삭제</button>
										</td>
									</tr>
									<tr>
										<td colspan="2" style="white-space: pre-wrap;">
											{{rvo.msg}}
										</td>
									</tr>
									<tr v-show="rvo.show">
										<td colspan="2">
											<textarea rows="4" cols="60" style="float: left; cursor: auto;" v-model="rvo.umsg"></textarea>
											<input type="button" value="댓글수정" style="width: 100px;height: 86px;float: left;margin-left: 3px" class="btn-primary" @click="update(rvo)">
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
					<table class="table" v-if="loginId">
						<tr>
							<td>
								<textarea rows="4" cols="60" style="float: left; cursor: auto;" v-model="msg"></textarea>
								<input type="button" value="댓글쓰기" style="width: 100px;height: 86px;float: left;margin-left: 3px" class="btn-primary" @click="insert()">
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	<script>
	const detailApp=Vue.createApp({
		data(){
			return{
				no:${no},
				cno:${cno},
				vo:{},
				replyList:[],
				msg:'',
				loginId:'${sessionScope.id}'
			}
		},
		mounted(){
			this.dataRecv()
			
		},
		methods:{
			async dataRecv(){
				await axios.get('../food/detail_vue.do',{
					params:{
						no:this.no
					}
				}).then(response=>{
					this.vo=response.data
				})
				await axios.get('../reply/list_vue.do',{
					params:{
						cno:this.cno,
						rno:this.no
					}
				}).then(response=>{
					this.replyList=response.data
				})
			},
			go(){
				window.history.back()
			},
			insert(){
				axios.get('../reply/insert_vue.do',{
					params:{
						cno:this.cno,
						rno:this.no,
						msg:this.msg
					}
				}).then(response=>{
					this.replyList=response.data
					this.msg=''
				})
				
			},
			deleteReply(no){
				axios.get('../reply/delete_vue.do',{
					params:{
						cno:this.cno,
						rno:this.no,
						no:no
					}
				}).then(response=>{
					this.replyList=response.data
				})
			},
			toggle(rvo){
				this.replyList.forEach(r=>{
					if(r.no!=rvo.no){
						r.show=false
					}
				})
				rvo.show=!rvo.show
			},
			update(rvo){
				axios.post('../reply/update_vue.do',{},{
					params:{
						no:rvo.no,
						cno:rvo.cno,
						rno:rvo.rno,
						msg:rvo.umsg
					}
				}).then(response=>{
					this.replyList=response.data
				})
			}
			
		}
	}).mount('#foodDetailApp')
	</script>
</body>
</html>