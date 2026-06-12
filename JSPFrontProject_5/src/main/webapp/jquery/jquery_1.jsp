<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
		Jquery : DOM (태그 제어 라이브러리)
		             --------
		             1. 태그선택
		                $(CSS선택자)
		                 ---------
		                 1) id =====> #id명
		                 2) class ==> .class명
		                 3) tag ===> tag명
		                 4) 속성선택자 ==> 태그[속성=값]
		                                태그[속성*값] => 포함
		                 5) 자손/후손 ==> 테그 > 태그 / 태그 태그
		                 6) 구조선택자 ==> 태그명:eq(0)
		                               태그명:nth-child(1)
		             2. 변경
		                 1) 속성
		                    $(태그).attr("속성명","값")
		                 2) 값
		                    input / select  textarea
		                    => $(태그).val()
		                    그외
		                    => $(태그).text(값)
		                 3) HTML 추가
		                    $(태그).html(값)
		                 4) 여러개 추가
		                    => 위에 출력 : prepend()
		                    => 아래 출력 : append()
		                 5) 스타일 변경
		                    => $(태그).css("속성:값")
		             3. 이벤트
		                 $(태그).click(function(){}) => 고전적 방식
		                 $(태그).on('click',()=>{})
		                 
		             4. 서버 연결
		             5. 효과 / 애니메이션 => JQuery UI / Plug-in => CDN
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(()=>{
	$('#btn1').on('click',()=>{
		let len=$('input[type=checkbox]:checked')
		alert('선택된 취미는'+len.length+'개 입니다')
	})
	$('#btn2').on('click',()=>{
		let len=$('input[type=checkbox]:checked')
		alert('선택된 취미는'+len+'입니다')
	})
	$('#btn3').on('click',()=>{
		let len=$('input[type=checkbox]:checked')
		alert('선택된 취미는'+len+'입니다')
	})
})</script>
</head>
<body>
	<button id="btn1">확인</button>
	<button id="btn2">전체</button>
	<button id="btn3">해제</button>
	<p>
	<input type="checkbox" checked>낚시
	<input type="checkbox" checked>운동
	<input type="checkbox" checked>쇼핑
	<input type="checkbox" checked>등산
	<input type="checkbox" checked>게임
	<%-- 관리자 모드 --%>
</body>
</html>