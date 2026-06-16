<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	jqeury 효과 : 댓글 / 삭제
	hide : 감추는 기능 => 더보기  display:none
	show : 보여주는 기능         display:''
	toggle : 버튼에서 => 2번 가능 => 라디오/체크박스
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	$((e)=>{
		$('#hideBtn').on('click',(e)=>{
			$('#id').hide('slow')
		})
		$('#showBtn').on('click',(e)=>{
			$('#id').show(1000)
		})
		$('#toggleBtn').on('click',(e)=>{
			$('#id').toggle(1000)
		})
	})
</script>
</head>
<body>
	<button id="hideBtn">숨기기</button>
	<button id="showBtn">보이기</button>
	<button id="toggleBtn">토글</button>
	<div>
		<input type="text" id="id" size=20>
	</div>
</body>
</html>