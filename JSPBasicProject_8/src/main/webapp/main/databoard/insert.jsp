<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%--
		multipart/form-data
		
		=> 서버로 전송
		Part 1 : file(파일 데이터)
		Part 2 : 문자 데이터
	 --%>
	<div class="container">
		<h3 class="text-center">글쓰기</h3>
		<div class="row" style="width: 800px;margin: 0px auto">
			<form method="post" action="../UploadServlet"
			enctype="multipart/form-data"
			>
				<table class="table">
					<tr>
						<th class="text-right" width=10%>이름</th>
						<td width=90%>
							<input type="text" name="name" size="20" class="input-sm" placeholder="이름" required>
						</td>
					</tr>
					<tr>
						<th class="text-right" width=10%>제목</th>
						<td width=90%>
							<input type="text" name="subject" size="60" class="input-sm" placeholder="제목" required>
						</td>
					</tr>
					<tr>
						<th class="text-right" width=10%>내용</th>
						<td width=90%>
							<textarea rows="10" cols="60" name="content" placeholder="내용 입력" style="resize: none;" required></textarea>
						</td>
					</tr>
					<tr>
						<th class="text-right" width=10%>첨부파일</th>
						<td width=90%>
							<input type="file" name="upload" size="30">
						</td>
					</tr>
					<tr>
						<th class="text-right" width=10%>비밀번호</th>
						<td width=90%>
							<input type="password" name="pwd" size="60" class="input-sm" placeholder="비밀번호" required>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="text-center">
							<button class="btn-sm btn-warning">글쓰기</button>
							<button type="button" class="btn-sm btn-danger"
								onclick="javascript:history.back()">취소</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>