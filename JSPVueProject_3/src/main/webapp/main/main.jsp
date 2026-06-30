<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
<script type="text/javascript" src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript">
$((e)=>{
	$('#login').on('click',(e)=>{
		let id=$('#id').val()
		if(id.trim()===""){
			$('#id').focus()
			return
		}
		let pwd=$('#pwd').val()
		if(pwd.trim()===""){
			$('#pwd').focus()
			return
		}
		
		$.ajax({
			type:'post',
			url:'../member/login.do',
			data:{"id":id,"pwd":pwd},
			success:(response)=>{
//				console.log(response)
				if(response==='NOID'){
					$('#id').val('')
					$('#pwd').val('')
					$('#id').focus()
				}else if(response==='NOPWD'){
					$('#pwd').val('')
					$('#pwd').focus()
				}else{
					location.reload()
				}
			}
		})
	})
	$('#logout').on('click',function(){
		$.ajax({
			type:'post',
			url:'../member/logout.do',
			success:(response)=>{
				location.reload()
			}
		})
	})
})
</script>
</head>
<body>
	<jsp:include page="../main/header.jsp"></jsp:include>
	<div class="container text-right" id="mainApp">
		<c:if test="${sessionScope.id==null }">
			<div>
				ID:<input type="text" id="id" size="15" class="input-sm">
				&nbsp;
				PW:<input type="password" id="pwd" size="15" class="input-sm">
				&nbsp;
				<button class="btn-sm btn-danger" id="login">로그인</button>
			</div>
		</c:if>
		<c:if test="${sessionScope.id!=null }">
			<div>
				${sessionScope.name} (${sessionScope.isAdmin=='y'?"관리자":"일반사용자"})님 로그인중입니다
				<button class="btn-sm btn-primary" id="logout">로그아웃</button>
			</div>
		</c:if>
	</div>
	<hr>
	<jsp:include page="${main_jsp }"></jsp:include>
	<!-- CDN방식 => Module -->
	<!-- <script>
	const main=Vue.createApp({
		data(){
			return{
				id:'',
				pwd:'',
				msg:'',
				vo:{},
				bShow:false,
				logShow:true
			}
		},
		mounted(){
			const sessionUser="${sessionScope.id}"
			if(sessionUser) {
		    	this.bShow=true
		    	this.logShow=false
		    	this.vo={
		    		name:"${sessionScope.name}",
		    		isAdmin:"${sessionScope.isAdmin}"
		    	}
			}
		},
		methods:{
			login(){
				if(this.id.trim()===""){
					this.$refs.idRef.focus()
					return
				}
				else if(this.pwd.trim()===""){
					this.$refs.pwdRef.focus()
					return
				}
				axios.post('../member/login.do',{},{
					params:{
						id:this.id,
						pwd:this.pwd
					}
				}).then(response=>{
					this.vo=response.data
					this.msg=response.data.msg
					
					if(this.msg==="OK") {
		                window.location.href="../main/main.do"
		                this.bShow=true
			            this.logShow=false
		            } else if(this.msg==="NOID") {
		            	this.id=''
		            	this.pwd=''
		            	this.$refs.idRef.focus()
		                alert("존재하지 않는 아이디입니다.");
		                this.bShow=false
		            } else if(this.msg==="NOPWD") {
		            	this.pwd=''
			            this.$refs.pwdRef.focus()
		                alert("비밀번호가 틀렸습니다.");
		                this.bShow=false
		            }
					console.log(this.vo)
					console.log(this.msg)
				})
			},
			logout(){
				axios.get("../member/logout.do")
				.then(response=>{
					this.bShow=true
					this.vo={}
					location.reload();
				})
			}
		}
	}).mount('#mainApp')
	</script> -->
</body>
</html>