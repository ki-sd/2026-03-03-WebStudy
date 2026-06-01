<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container {
  margin-top: 50px;
}
/* 실제 화면 출력 */
.row {
  margin: 0px auto;
  width:900px;
}
h3 {
   text-align: center;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let i=0; // number (int,double)
/*
  	  변수 설정
      var / let / const => 자동 데이터형 대입
                  ----- 상수
           ---- ES6
      --- ES5
      => var은 지역변수이면서 {}을 벗어나도 사용이 가능 => 사용영역(scope)이 명확하지 않음
      => let은 {}을 벗어나면 자동 메모리 해제
      
      let i=10; => int
      let i=10.5; => double
      let i=""; => String
      let i=[]; => array
      let i={}; => object
      
      let i=10;
      i="Hello";
      i=[];
      i={};
      ---------------------- 데이터형 고정 => TypeScript
      let i:String="";
 */
$(function(){
	// $('#delSpan') => 바닐라JS => document.querySelector("#delSpan")
	$('#delSpan').on('click',function(){
		if(i===0){ // 10===10 10==10 10=="10" true / 10==="10" false
			$(this).text("취소")
			$('#delTr').show()
			i=1;
		}else{
			$(this).text("삭제")
			$('#delTr').hide()
			i=0;
		}
	})
})
</script>
</head>
<body>
   <div class="container">
    <div class="row">
      <h3>내용 보기</h3>
      <table class="table">
        <tr>
         <th width=20% class="text-center success">번호</th>
         <td width=30% class="text-center">${vo.no }</td>
         <th width=20% class="text-center success">작성일</th>
         <td width=30% class="text-center">${vo.dbday }</td>
        </tr>
        <tr>
         <th width=20% class="text-center success">이름</th>
         <td width=30% class="text-center">${vo.name }</td>
         <th width=20% class="text-center success">조회수</th>
         <td width=30% class="text-center">${vo.hit }</td>
        </tr>
        <tr>
         <th width=20% class="text-center success">제목</th>
         <td colspan="3">${vo.subject }</td>
        </tr>
        <c:if test="${vo.filename!=null || vo.filesize!=0 }">
        <tr>
         <th width=20% class="text-center success">첨부파일</th>
         <td colspan="3">
         	<a href="download.jsp?fn=${vo.filename }" style="text-decoration: none;color: black;">
         	${vo.filename} </a><sub style="color:gray"><fmt:formatNumber value="${vo.filesize/1024 }" pattern="###.00"/>KB</sub>
         </td>
        </tr>
        </c:if>
        <tr>
          <td colspan="4" class="text-left" valign="top" height="200">
            <pre style="white-space: pre-wrap;background: white;border:none">${vo.content }</pre>
          </td>
        </tr>
        <tr>
          <td colspan="4" class="text-right">
            <a href="update.jsp?no=${vo.no }" class="btn btn-xs btn-info">수정</a>
            <span class="btn btn-xs btn-warning" id="delSpan">삭제</span>
            <a href="boardList.do" class="btn btn-xs btn-danger">목록</a>
          </td>
        </tr>
        <tr style="display:none" id="delTr">
        	<form method="post" action="delete.do">
	        	<td colspan="4" class="text-right">
		        	<input type="password" size=10 class="input-sm" name="pwd" placeholder="비밀번호" required>
		        	<input type="hidden" name="no" value="${vo.no }">
		        	<button class="btn-sm btn-danger" type="submit">삭제</button>
	        	</td>
        	</form>
        </tr>
      </table>
    </div>
   </div>
</head>
<body>

</body>
</html>