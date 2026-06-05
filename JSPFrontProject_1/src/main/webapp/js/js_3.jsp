<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	  : JQeury , Vue , React ..... 기반=> JS
	  
	  이항연산자
	     산술연산자  ( + , - , * , / , %)
	         + : 덧셈, 문자열 결합 => 연산이 안되는 경우 : NaN
	         / : 0으로 나눌 수 없다
	             정수 / 정수 = 실수 (자바 : 5/2=2 , JS: 5/2=2.5)
	         % : 왼쪽 부호가 남는다
	             + % + = +
	             + % - = +
	             - % + = -
	             - % - = -
	     비교연산자 : 장점 => 문자열 / 날짜 비교 가능
	         == (데이터형과 관련 없이 비교) === (데이터형까지 비교)
	              '10' == 10               '10' === 10
	                 true                     false
	         != =============> !==
	         <
	         >
	         <=
	         >=
	     논리연산자
	     대입연산자
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	window.onload=function(){
		let a=5
		let b=2
		console.log("a+b="+(a+b))
		console.log("a-b="+(a-b))
		console.log("a*b="+(a*b))
		console.log("a/b="+(a/b))
		console.log("a%b="+(a%b))
		// 장바구니 총액(금액*수량) / 예약 총액(금액*인원수)
		
		let c="A"
		let f=20000
		console.log(c+f)
		console.log(parseInt(c)+f) //NaN (연산불가)
		c=10
		console.log(parseInt(c)+f)
		/*
		   주의점
		    숫자가 아닌 경우 연산처리 => 연산이 불가능 => NaN
		    (+:문자열 결합)
		    "" , '' => 문자열
		    HTML을 통해 숫자를 갖고오면 => 문자열로 읽어온다
		*/
		let m=10
		let n='10'
		
		console.log("m == n : "+(m==n))
		console.log("m === n : "+(m===n)) // 유효성 검사 (id==="") NOT NULL
		console.log("m != n : "+(m!=n))
		console.log("m !== n : "+(m!==n)) // (pwd!==pwd1)
		console.log("m < n : "+(m<n))
		console.log("m > n : "+(m>n))
		console.log("m <= n : "+(m<=n))
		console.log("m >= n : "+(m>=n))
	}
function ok(){
	let frm=document.frm
	if(frm.id.value==="")
	{
		alert("아이디를 입력하세요")
		return
	}
	if(frm.pwd.value==="")
	{
		alert("비밀번호를 입력하세요")
		return
	}
	if(frm.pwd1.value==="")
	{
		alert("비밀번호 확인을 입력하세요")
		return
	}
	if(frm.pwd.value!==frm.pwd1.value)
	{
		alert("비밀번호가 다릅니다")
		return
	}
}
</script>
</head>
<body>
	<form name="frm">
		ID:    <input type=text name=id size=15><br>
		PWD:   <input type=password name=pwd size=15><br>
		PWD확인:<input type=password name=pwd1 size=15><br>
		<input type=button value="확인" onclick="ok()">
	</form>
</body>
</html>