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
			<h3>상세 보기</h3>
			<table class="table">
				<tbody>
					<tr>
						<th class="text-center success" width="20%">번호</th>
						<td width="35%">{{no}}</td>
						<th class="text-center success" width="15%">등록일</th>
						<td width="35%">{{dbday}}</td>
					</tr>
					
					<tr>
						<th class="text-center success">이름</th>
						<td>{{name}}</td>
						<th class="text-center success">조회수</th>
						<td>{{hit}}</td>
					</tr>
					<tr>
            			<th width=20% class="danger text-center">제목</th>
           				<td colspan="3">{{subject}}</td>
          			</tr>
					<tr>
						<th class="text-center success" style="vertical-align: middle;">내용</th>
						<td colspan="4">
							<textarea rows="10" ref="contRef" v-model="content" 
							          class="form-control" draggable="false" readonly="readonly" 
							          style="background-color: #fff; resize: none;"></textarea>
						</td>
					</tr>
					<tr>
            			<td colspan="4" class="text-right">
             				<a href="#" class="btn btn-xs btn-warning">수정</a>
             				<a class="btn btn-xs btn-warning a-link"
              					@click="btnClick()">{{isOn?'삭제':'취소'}}</a>
             				<a href="../board/list.do" class="btn btn-xs btn-warning">목록</a>
            			</td>
          			</tr>
          			<tr v-show="bShow">
            			<td colspan="4" class="text-right">
             			비밀번호:<input type="password" size=15 class="input-sm" 
                     	ref="pwdRef" v-model="pwd">
                     <%-- v-model : data()안에 있는 변수 연결 
                          입력시에 바로 pwd변수에 값을 채운다 => 양방향
                          let pwd=$('#pwd').val() => 처리 => 단반향
                          
                      --%>
                    		<button class="btn-sm btn-primary" @click="del()">삭제</button>
            			</td>
          			</tr>
				</tbody>
			</table>
		</div>
	</div>
	<script>
	const detail=Vue.createApp({
		data(){
			return{
				bShow:false,
				no:${param.no},
				msg:'삭제',
				pwd:'',
				detail:{},
				name:'',
				subject:'',
				content:'',
				hit:'',
				dbday:''
			}
		},
		mounted(){
			this.dataRecv()
		},
		methods:{
			async dataRecv(){
				await axios.get('../board/detail_vue.do',{
					params:{
						no:this.no
					}
				}).then(response=>{
					console.log(response.data)
					this.name=response.data.name
					this.subject=response.data.subject
					this.content=response.data.content
					this.hit=response.data.hit
					this.dbday=response.data.dbday
				})
			},
			btnClick(){
				this.isOn=!this.isOn
				this.bShow=!this.bShow
			},
			del(){
				if(this.pwd.trim()===""){
					this.$refs.pwdRef.focus()
					return
				}
				axios.get('../board/delete_vue.do',{
					params:{
						no:this.no,
						pwd:this.pwd
					}
				}).then(response=>{
					if(response.data==='yes'){
						window.location.href="../board/list.do"
					}
					else{
						alert("비밀번호가 틀립니다!!")
						this.pwd=''
						this.$refs.pwdRef.focus()
					}
				})
			}
		}
	}).mount('.container')
	</script>
</body>
</html>