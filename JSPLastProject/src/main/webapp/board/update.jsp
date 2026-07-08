<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
button:hover{
	cursor: pointer
}
</style>
</head>

<body>
	<div class="breadcumb-area" style="background-image: url(../img/bg-img/breadcumb.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <div class="bradcumb-title text-center">
                        <h2>수정</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="breadcumb-nav">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="../main/main.do"><i class="fa fa-home" aria-hidden="true"></i> Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">수정</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <section class="archive-area section_padding_40">
        <div class="container" style="width:800px">
            <div class="row">
            	<form id="frm">
	            	<table class="table">
	            		<tr>
	            			<td>
	            				<input type="text" name=no id=no size=20 class="input-sm" value="${vo.no }" hidden="hidden" required>
	            			</td>
	            		</tr>
	            		<tr>
	            			<th class="text-center table-success" width="15%">이름</th>
	            			<td width="85%">
	            				<input type="text" name=name id=name size=20 class="input-sm" value="${vo.name }" required>
	            			</td>
	            		</tr>
	            		<tr>
	            			<th class="text-center table-success" width="15%">제목</th>
	            			<td width="85%">
	            				<input type="text" name=subject id=subject size=60 class="input-sm" value="${vo.subject }" required>
	            			</td>
	            		</tr>
	            		<tr>
	            			<th class="text-center table-success" width="15%">내용</th>
	            			<td width="85%">
	            				<textarea rows="10" cols="62" name=content id=content required>${vo.content }</textarea>
	            			</td>
	            		</tr>
	            		<tr>
	            			<th class="text-center table-success" width="15%">비밀번호</th>
	            			<td width="85%">
	            				<input type="password" name=pwd id=pwd size=20 class="input-sm" required>
	            				<button type="button" class="btn-outline-warning btn-sm" id="upBtn"><i class="fa fa-pencil"></i> 수정 </button>
	            				<button type="button" class="btn-outline-primary btn-sm" id="cancelBtn"> 취소 </button>
	            			</td>
	            		</tr>
	            	</table>
	            </form>
            </div>
        </div>
    </section>
<script type="text/javascript" src="http://code.jquery.com/jquery-4.0.0.min.js"></script>
<script>
$('#upBtn').on('click',(e)=>{
/* 	let no=${vo.no}
	let name=$('#name').val().trim()
	let subject=$('#subject').val().trim()
	let content=$('#content').val().trim()
	let pwd=$('#pwd').val().trim() */
	$.ajax({
		method:'post',
		url:'../board/update_ok.do',
//		data:{no,name,subject,content,pwd},
		data:$('#frm').serialize(),
		success:(result)=>{
			result=result.trim()
			if(result==='yes'){
				location.href="../board/detail.do?no=${vo.no}"
			}else{
				alert('비밀번호가 틀립니다')
				$('#pwd').val('').focus()
			}
		}
	})
})
$('#cancelBtn').on('click',(e)=>{
	history.back()
})
</script>
</body>
</html>