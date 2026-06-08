<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	배열합수
	 **추가: push => 데이터 마지막에 추가
	 삭제: pop => 마지막 삭제
	 갯수: length
	 **자르기: 자바스크립트에서 페이징 slice(start,end)
	 찾기: find()
	 배열 복사: 스코프 연산자 ... => react
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=()=>{
	let names=["홍길동","이순신","강감찬","박문수","심청이"]
	document.write("<h3>원본</h3>")
	document.write("<ul>")
	names.map((name)=>{
		document.write("<li>"+name+"</li>")
	})
	document.write("<li>총인원:"+names.length+"</li>")
	document.write("</ul>")
	document.write("<hr>")
	// 데이터 추가
	document.write("<h3>배열 추가:push</h3>")
	names.push("춘향이")
	document.write("<ul>")
	names.map((name)=>{
		document.write("<li>"+name+"</li>")
	})
	document.write("<li>총인원:"+names.length+"</li>")
	document.write("</ul>")
	document.write("<hr>")
	// 데이터 삭제
	document.write("<h3>배열 삭제:pop/shift</h3>")
	names.pop()   // => 맨 마지막 데이터 삭제
	// names.shift()   => 맨 처음 데이터 삭제
	document.write("<ul>")
	names.map((name)=>{
		document.write("<li>"+name+"</li>")
	})
	document.write("<li>총인원:"+names.length+"</li>")
	document.write("</ul>")
	document.write("<hr>")
	
	// 배열 자르기
	document.write("<h3>배열 자르기:slice(n)</h3>")
	let names2=names.slice(2)  // 인덱스 2번부터 자른다
	document.write("<ul>")
	names2.map((name)=>{
		document.write("<li>"+name+"</li>")
	})
	document.write("<li>총인원:"+names2.length+"</li>")
	document.write("</ul>")
	document.write("<hr>")
	
	document.write("<h3>배열 자르기:slice(n,m)</h3>")
	let names3=names.slice(1,3)  // 인덱스 1번부터 3번까지 자른다 (마지막 하나는 제외함 (1~2까지만 출력))
	document.write("<ul>")
	names3.map((name)=>{
		document.write("<li>"+name+"</li>")
	})
	document.write("<li>총인원:"+names3.length+"</li>")
	document.write("</ul>")
	document.write("<hr>")
	
	// 배열 복사
	document.write("<h3>배열 복사:...배열명<sub style="+"color:gray"+">let names4=[...names,춘향이]</sub></h3>")
	let names4=[...names,"춘향이"]
	document.write("<ul>")
	names4.map((name)=>{
		document.write("<li>"+name+"</li>")
	})
	document.write("<li>총인원:"+names4.length+"</li>")
	document.write("</ul>")
	document.write("<hr>")
}
</script>
</head>
<body>

</body>
</html>