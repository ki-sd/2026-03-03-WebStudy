<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
		자바스크립트에서 지원하는 연산자
		1) 단항연산자
		    => 증감연산자 (++ , --)
		    => 부정연산자 (!)
		    => 형변환연산자 
		       Number() . parseInt()
		       Boolean()
		       String()
		2) 이항연산자
		    => 산술연산자 (+ , - , * , / , %)
		    => 비교연산자 (== , != , < , > , <= , >=)
		               ---------
		               === , !== (데이터형까지 비교)
		    => 논리연산자 (&& , ||)
		    => 대입연산자 (= , += , -= , *= ...)
		               ------------
		3) 삼항연산자
		    조건 ? 값1 : 값2
		     | true = 값1
		     | false = 값2
		     
		     
		<script type="text/javascript">
		  => Vue / React
		     <script type="text/babel">
		     => <script>
		
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%--
<script type="text/javascript">
	window.onload=function(){
		// 1. 단항 연산자 (증감연산자 , 부정연산자 , 형변환)
		/*
		   증감연산자 : 1개증가, 1개감소
		*/
		let a=10
		document.write("<h1> 증가전:"+a+"</h1>")
		a++
		document.write("<h1> 증가후:"+a+"</h1>")
		document.write("<h1> 감소전:"+a+"</h1>")
		a--
		document.write("<h1> 감소후:"+a+"</h1>")
		document.write("<hr>")
		
		a=10
		let b=a++
		document.write("<h1> a:"+a+"</h1>")
		document.write("<h1> b:"+b+"</h1>")
		
		a=10
		b=++a
		document.write("<h1> a:"+a+"</h1>")
		document.write("<h1> b:"+b+"</h1>")
		
		document.write("<hr>")
		
		let c=true
		document.write("c="+c+"<br>")
		c=!c
		document.write("c="+c+"<br>")
		
		c=1
		document.write("c="+c+"<br>")
		c=!c
		document.write("c="+c+"<br>")
		
		c=0
		document.write("c="+c+"<br>")
		c=!c
		document.write("c="+c+"<br>")
		
		document.write("<hr>")
		
		let a1=10;
		document.write("a1="+a1+",type="+typeof a1+"<br>")
		a1=String(a1)
		document.write("a1="+a1+",type="+typeof a1+"<br>")
//		a1=parseInt(a1)
		a1=Number(a1)
		document.write("a1="+a1+",type="+typeof a1+"<br>")
		
		document.write("Boolean(1)="+Boolean(1)+",type="+typeof Boolean(1)+"<p>")
		document.write("Boolean(0)="+Boolean(0)+",type="+typeof Boolean(0)+"<p>")
		document.write("Boolean(0.0)="+Boolean(0.0)+",type="+typeof Boolean(0.0)+"<p>")
		document.write("Boolean(0.1)="+Boolean(0.1)+",type="+typeof Boolean(0.1)+"<p>")
		document.write("Boolean('Hello JavaScript')="+Boolean('Hello JavaScript')+",type="+typeof Boolean('Hello JavaScript')+"<p>")
		document.write("Boolean('')="+Boolean('')+",type="+typeof Boolean('')+"<p>")
		document.write("Boolean(\"\")="+Boolean('')+",type="+typeof Boolean("")+"<p>")
		
		document.write("<hr>")
	}
</script>
--%>
<script type="text/javascript">
function calc(){
	let f=document.getElementById("first").value
	let s=document.getElementById("second").value
	console.log("f="+f+",type="+typeof f)
	console.log("s="+s+",type="+typeof s)
//	console.log(f+"+"+s+"="+(Number(f)+Number(s)))
	let span=document.getElementById("result")
//	span.innerHTML="<h2>"+(f+s)+"</h2>"
	span.innerHTML="<h2>"+(Number(f)+parseInt(s))+"</h2>"
	// 서버에서 값을 받아 원하는 위치 값 출력 => Ajax / Axios
}
</script>
</head>
<body>
	첫번째 값: <input type=text id="first" size=10><br>
	두번째 값: <input type=text id="second" size=10><br>
	<input type="button" value="계산" onclick="calc()"><br>
	<span id="result"></span>
</body>
</html>