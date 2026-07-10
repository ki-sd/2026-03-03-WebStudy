<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
</head>
<body>
	<div id="app">
		<div>{{msg}}</div>
		<hr>
		<div v-text="msg"></div>
		<hr>
		<div v-html="msg"></div>
	</div>
	<script>
	let app=Vue.createApp({
		data(){
			return{
				msg:'<h1>Hello Vue3</h1>'
			}
		}
	}).mount('#app')
	</script>
</body>
</html>