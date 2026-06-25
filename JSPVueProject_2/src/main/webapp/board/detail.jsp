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
						<th class="text-center success" width="15%">이름</th>
						<td width="35%">{{name}}</td>
						<th class="text-center success" width="15%">등록일</th>
						<td width="35%">{{dbday}}</td>
					</tr>
					
					<tr>
						<th class="text-center success">제목</th>
						<td>{{subject}}</td>
						<th class="text-center success">조회수</th>
						<td>{{hit}}</td>
					</tr>
					
					<tr>
						<th class="text-center success" style="vertical-align: middle;">내용</th>
						<td colspan="3">
							<textarea rows="10" ref="contRef" v-model="content" 
							          class="form-control" draggable="false" readonly="readonly" 
							          style="background-color: #fff; resize: none;"></textarea>
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
				no:${param.no},
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
			}
		}
	}).mount('.container')
	</script>
</body>
</html>