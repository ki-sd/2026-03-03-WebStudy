<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
    <%
	BoardDAO dao=new BoardDAO();
    BoardVO vo=new BoardVO();
	vo.setName(request.getParameter("name"));
	vo.setSubject(request.getParameter("subject"));
	vo.setContent(request.getParameter("content"));
	vo.setPwd(request.getParameter("pwd"));
	vo.setNo(Integer.parseInt(request.getParameter("no")));
	boolean bCheck=dao.updateBoard(vo);
	
	if(bCheck==true){
		response.sendRedirect("boardDetail.jsp?no="+vo.getNo());
	}else{
%>
		<!-- <script>
		alert("비밀번호가 틀립니다!!");
		history.back();
		</script> -->


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div id="errorModal" class="modal fade" role="dialog">
  		<div class="modal-dialog">

    <!-- Modal content-->
    		<div class="modal-content">
      			<div class="modal-header">
        			<button type="button" class="close" data-dismiss="modal">&times;</button>
        				<h4 class="modal-title">오류</h4>
      			</div>
      			<div class="modal-body">
        			<p>비밀번호가 틀립니다!!</p>
     			</div>
      			<div class="modal-footer">
        			<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      			</div>
    		</div>

  		</div>
	</div>
	<script>
        $(document).ready(function() {
            $("#errorModal").modal('show');
            history.back();
        });
    </script>
</body>
</html>

		
<%
	}
%>