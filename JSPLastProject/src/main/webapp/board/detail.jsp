<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-4.0.0.min.js"></script>
<script type="text/javascript">
let i=0
$((e)=>{
	$('#delSpan').on('click',(e)=>{
		if(i===0){
			$('#delText').text('취소')
			$('#delTr').show()
			i=1
		}
		else{
			$('#delText').text('삭제')
			$('#delTr').hide('slow')
			i=0
		}
	})
	$('#delBtn').on('click',(e)=>{
		let pwd=$('#pwd').val().trim()
		if(!pwd){
			$('#pwd').focus()
			return
		}
		let no=$('#no').text().trim()
//		alert(no)
		$.ajax({
			method:'post',
			url:'../board/delete_ok.do',
			data:{no,pwd},
			success:(result)=>{
				result=result.trim()
				if(result==='yes'){
					location.href="../board/list.do"
				}else{
					alert('비밀번호가 틀립니다')
					$('#pwd').val('').focus()
				}
			}
		})
	})
})
</script>
<style type="text/css">
button:hover{
	cursor: pointer
}
#delSpan:hover{
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
                        <h2>상세보기</h2>
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
                            <li class="breadcrumb-item active" aria-current="page">상세보기</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <section class="archive-area section_padding_40">
        <div class="container" style="width:800px">
            <div class="row">
	            	<table class="table">
	            		<tr>
	            			<th class="text-center table-success text-white" width="20%">번호</th>
	            			<td width="30%" class="text-center" id="no">${vo.no }</td>
	            			<th class="text-center table-success text-white" width="20%">작성일</th>
	            			<td width="30%" class="text-center">${vo.dbday }</td>
	            		</tr>
	            		<tr>
	            			<th class="text-center table-success text-white" width="20%">이름</th>
	            			<td width="30%" class="text-center">${vo.name }</td>
	            			<th class="text-center table-success text-white" width="20%">조회수</th>
	            			<td width="30%" class="text-center">${vo.hit }</td>
	            		</tr>
	            		<tr>
	            			<th class="text-center table-success text-white" width="20%">제목</th>
	            			<td colspan="3">${vo.subject }</td>
	            		</tr>
	            		<tr>
	            			<td colspan="4" class="text-left" valign="top" height="200">
	            				<pre style="white-space: pre-wrap;background: white;border: none;">${vo.content }</pre>
	            			</td>
	            		</tr>
	            		<tr>
	            			<td colspan="4" class="text-right">
	            				<a href="../board/update.do?no=${vo.no }" class="btn btn-xs btn-outline-warning rounded-pill px-3">
	            					<i class="fa fa-pencil"></i> 수정
	            				</a>
	            				<span href="" class="btn btn-xs btn-outline-danger rounded-pill px-3" id="delSpan">
	            					<i class="fa fa-trash"></i> <span id="delText">삭제</span>
	            				</span>
	            				<a href="../board/list.do" class="btn btn-xs btn-outline-primary rounded-pill px-3">
	            					<i class="fa fa-list"></i> 목록
	            				</a>
	            			</td>
	            		</tr>
	            		<tr style="display:none;" id="delTr">
	            			<td colspan="4" class="text-right">
	            				비밀번호:<input type="password" id=pwd size=15 class="form-control-sm">
	            				<button type="button" class="btn-outline-danger btn-sm" id="delBtn"><i class="fa fa-trash"></i> 삭제 </button>
	            			</td>
	            		</tr>
	            	</table>
            </div>
        </div>
    </section>
</body>
</html>