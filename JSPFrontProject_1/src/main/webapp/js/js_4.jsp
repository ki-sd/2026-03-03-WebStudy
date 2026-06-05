<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	  논리연산자 : && , ||
	  && => 직렬연산자 (AND)
	  || => 병령연산자 (OR)
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=function(){
	let i=(6<7) && (6==7)
	console.log("i="+i)
	let j=(6<7) || (6==7)
	console.log("j="+j)
	
	/*
	  대입연산자
	  = , += , -=
      
	  let k=10
	  k+=10 => 20
	  k-=10 => 0
	*/
	let k=10
	k+=10
	console.log("k="+k)
	k-=10
	console.log("k="+k)
	
	let g=(6%2==0)?"짝수":"홀수"
	console.log("g="+g)
	
	let h=10/0
	console.log("h="+h) // Infinity => 0으로 나눈 경우
	/*
	  1. 연산처리가 불가 : null, 값이 없는 경우 => NaN
	  2. 0으로 나눈 경우 => Infinity
	  3. 변수의 초기값이 없는 경우 => undefined
	  4. 정수 / 정수 = 실수
	  5. HTML에서 입력값을 갖고오는 경우 : String => Number(),parseInt()
	  6. 단점 : 서버 연결이 안돰 => 서버 연결할수 있는 라이브러리 Ajax/Axios
	  7. 같다 / 같지않다
	     ===   !==
	*/
}
</script>
</head>
<body>

</body>
</html>