<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
		내장 객체
		Number
		  parseInt() : 숫자 변환
		  toLocaleString() : 1,000
		String
		  문자열 인덱스 번호 => 0부터 시작 (자바와 동일)
		  length() : 문자열 길이 (갯수) => 비밀번호 유효성 검사
		  indexOf / lastIndexOf : 문자 위치 찾기
		  replace() : 문자 변경
		  replaceAll() => 정규식 이용해서 변경
		  split() => [] 배열로
		  substring() : 문자열 자르기 (시작인덱스,종료인덱스) => 종료인덱스-1까지 잘라옴
		  substr() : 문자열 자르기 (시작인덱스,갯수)
		  trim() : 좌우 공백 제거
		  startsWith / endsWith / contains(X) => includes()
		Array
		  push() : 데이터 첨부 (마지막)
		  pop() : 데이터 삭제 (마지막)
		  slice() : 원하는 위치에서 데이터를 잘라 새로운 배열 생성
		  length() : 배열 크기(데이터 갯수)
		  find() : 배열에서 찾기
		Date
		  let today=new Date()
		  year : today.getFullYear()
		  month : today.getMonth() => 0부터 시작
		  date : today.getDate()
		  day(요일) : today.getDay() (인덱스 번호)
		  ---------------- fullcalendar : 라이브러리
		Math
		  round()
		  ceil()
		BOM (Browser Object Model)
		  window
		    = open() / close()
		  location
		    = href() : 화면 이동 (sendRedirect())
		  history
		    = back() / go(-1)
		  document : 객체모델 선택자 / 화면출력
		    = querySelector()
		    = write()
		기타
		  alert()
		  
		 ----------------------------------------- 라이브러리화 : Jquery
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
// 예약, 결제일 => SYSDATE
// 댓글
window.onload=()=>{
/*	let today=new Date()
	let year=today.getFullYear()
	let month=today.getMonth()+1
	let date=today.getDate()
	let day=today.getDay()
	let strWeek=["일","월","화","수","목","금","토"]
	document.write("<h1>오늘은 "+year+"년 "+month+"월 "+date+"일 "+strWeek[day]+"요일</h1>")
*/
    //1. String
    // split
    let str='red,black,green,blue,yellow,pink'
    let colors=str.split(',')
    let html='<ul>'
    colors.forEach((color)=>{
    	html+='<li style="color:'+color+'">'+color+'</li>'
    })
    html+='</ul>'
    document.write(html)
}
</script>
</head>
<body>

</body>
</html>