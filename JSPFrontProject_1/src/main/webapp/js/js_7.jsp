<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
		일반 for
		
		for(초기값;조건식;증가식){
			반복 수행문장
		}
		
		데이터가 집합일 경우 : 배열 / 객체
		for-each 이용
		for(BoardVO vo:list)
		=> 목록 출력
		1. for in
		   for(변수 in 배열)
		   {
		       배열의 인덱스 번호를 가지고 온다
		       배열 여러개를 동시 출력
		   }
		2. for of
		   for(변수 of 배열)
		   {
		       변수는 배열 안의 값을 갖고온다
		   }
		3. forEach
		   배열.forEach(function(변수){})
		4. map
		   배열.map(function(변수){})
		       => forEach와 동일
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=()=>0{
	let names=["홍길동","심청이","이순신","강감찬","춘향이"]
	let sexs=["남자","여자","남자","남자","여자"]
	
	document.write("<h1>회원 목록</h1>")
	document.write("<ul>")
	for(let index in names){
		document.write("<li>"+names[index]+"("+sexs[index]+")</li>")
	}
	document.write("</ul>")
	document.write("<hr>")
	document.write("<h1>회원 이름</h1>")
	for(let name of names){
		document.write("<h3>"+name+"</h3>")
	}
	document.write("<hr>")
	names.forEach(function(name,index){
		document.write("<h3>"+(index+1)+"."+name+"</h3>")
	})
	document.write("<hr>")
	names.map(function(name,index){
		document.write("<h3>"+(index+1)+"."+name+"</h3>")
	})
	document.write("<hr>")
	names.forEach((name,index)=>{
		document.write("<h3>"+(index+1)+"."+name+"</h3>")
	})
	document.write("<hr>")
	names.map((name,index)=>{
		document.write("<h3>"+(index+1)+"."+name+"</h3>")
	})
}
</script>
</head>
<body>

</body>
</html>