<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
	margin-top: 50px;
}
.row{
	margin: 0px auto;
	width: 900px;
}
h3{
	text-align: center;
}
</style>
</head>
<body>
	<div class="container">
    <div class="row">
      <h3>글쓰기</h3>
      <%-- 입력된 모든 값을 전송  
           URL뒤에 데이터 노출 => GET
               단순한 검색어 / 페이지 번호 / 상세보기 번호 
               <a> , location.href , sendRedirect()
               ?뒤에 값을 첨부 
           감춰서 전송 => POST
               데이터가 많은 경우 / 보안이 필요로 한 전송 (id,password)
               <form> , ajax , vue => axios , fetch 
      --%>
      <form method=post action="../UploadServlet" enctype="multipart/form-data">
      <table class="table">
       <tr>
        <th width=10% class="text-center">이름</th>
        <td width=90%><input type=text name=name size=20 class="input-sm" required></td>
       </tr>
       <tr>
        <th width=10% class="text-center">제목</th>
        <td width=90%><input type=text name=subject size=60 class="input-sm" required></td>
       </tr>
       <tr>
        <th width=10% class="text-center">내용</th>
        <td width=90%>
         <textarea rows="10" cols="61" name="content" required></textarea>
        </td>
       </tr>
       <tr>
        <th width=10% class="text-center">첨부파일</th>
        <td width=90%><input type=file name=upload size=30 class="input-sm"></td>
       </tr>
       <tr>
        <th width=10% class="text-center">비밀번호</th>
        <td width=90%><input type=password name=pwd size=10 class="input-sm" required></td>
       </tr>
       <tr>
         <td colspan="2" class="text-center">
           <button class="btn-sm btn-primary">글쓰기</button>
           <button class="btn-sm btn-primary" type=button
            onclick="javascript:history.back()"
           >취소</button>
         </td>
       </tr>
      </table>
      </form>
    </div>
   </div>
</body>
</html>