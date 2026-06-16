<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.row{
	margin: 0px auto;
	width: 960px;
}
p{
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}
.link:hover{
	cursor: pointer
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	$((e)=>{
		dataRecv(1)
		$('#findBtn').on('click',()=>{
			dataRecv(1)
		})
		$('#fd').on('keydown',(e)=>{
			if(e.key==='Enter'){
				dataRecv(1)
			}
		})
	})
	const dataRecv=(page)=>{
		let json={
			"page":page,
			"col":$('#col').val(),
			"fd":$('#fd').val()
			}
//		{"page":page,"fd":$('#fd').val(),"col":$('#col').val()}
		$.ajax({
			type:'POST',
			url:'../food/find_ajax.do',
			data:json,
			success:(response)=>{
//				console.log(response)
				let json=JSON.parse(response)
//				console.log(json)
				let html=''
				json.forEach((food)=>{
					html+='<div class="col-sm-3">'
						+'<a href="../food/detail_before.do?fno='+food.fno+'">'
						+'<div class="thumbnail">'
						+'<img src="'+food.poster+'" style="width:240px;height:130px;object-fit:cover">'
						+'<p>'+food.name+'</p>'
						+'</div>'
						+'</a>'
						+'</div>'
				})
				$('#print').html(html)
				
				let curpage=json[0].curpage
				let totalpage=json[0].totalpage
				let startPage=json[0].startPage
				let endPage=json[0].endPage
				
				let pageHtml='<ul class="pagination">'
				if(startPage>1){
					pageHtml+='<li><a class="link" onclick="move('+(startPage-1)+')">&laquo;</a></li>'
				}
				for(i=startPage;i<=endPage;i++){
					pageHtml+='<li '+(i===curpage?"class=active":"")+'><a class="link" onclick="move('+i+')">'+i+'</a></li>'
				}
				if(endPage<totalpage){
					pageHtml+='<li><a class="link" onclick="move('+(endPage+1)+')">&raquo;</a></li>'
				}
				pageHtml+='</ul>'
				$('#paging').html(pageHtml)
			}
		})
	}
	const move=(page)=>{
		dataRecv(page)
	}
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<select id="col" class="input-sm">
				<option value="name">맛집명</option>
				<option value="type">종류</option>
				<option value="address" selected>주소</option>
			</select>
			<input type="text" id="fd" class="input-sm" size=20 value="마포">
			<button type="button" id="findBtn" class="btn-sm btn-primary">검색</button>
		</div>
		<div class="row" id="print" style="margin-top: 30px">
			
		</div>
		<div class="row text-center" id="paging" style="margin-top: 30px">
			
		</div>
	</div>
</body>
</html>