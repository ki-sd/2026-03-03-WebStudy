<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	 제어문
	   = 조건문 
	     1. 단일 조건문(***)
	        if(조건문){
	        	
	        }
	     2. 선택 조건문(***)
	     	if(조건문){
	        	조건이 true일때	
	        }
	        else
	        {
	        	조건이 false일때
	        }
	     3. 다중 조건문
	     4. 선택문
	        switch(number||문자){
	          case 값:
	              처리문장
	              break;
	          case 값:
	              처리문장
	              break;
	          ..
	          ..
	          default:
	              처리문장
	        }
	   = 반복문
	     1. do-while
	     2. while
	     3. for (***)
	        = for in
	        = for of (***)
	        = forEach (***)
	        = map (***)
	   = 반복 제어문
	     1. break (***) 
	     2. continue

 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript">
window.onload=function(){
/*	let a=10
	let b=5
	if(a+b){
		document.write("정상수행")
	}
*/
//	movieList(1)
	let i=3
	switch(i){
	case 1:
		document.write("<h1>문장1</h1>")
	case 2:
		document.write("<h1>문장2</h1>")
	case 3:
		document.write("<h1>문장3</h1>")
	case 4:
		document.write("<h1>문장4</h1>")
	case 5:
		document.write("<h1>문장5</h1>")
		break
	}
}
// searchMainDailyBoxOffice.do
// searchMainRealTicket.do
// searchMainDailySeatTicket.do
function movieList(no){
	let site="https://www.kobis.or.kr/kobis/business/main/"
	if(no===1)
		site+="searchMainDailyBoxOffice.do"
	else if(no===2)
		site+="searchMainRealTicket.do"
	else if(no===3)
		site+="searchMainDailySeatTicket.do"
	axios.get(site).then(response=>{
		console.log(response.data)
	})
}
</script>
</head>
<body>

</body>
</html>