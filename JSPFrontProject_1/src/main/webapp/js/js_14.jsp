<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
		함수 응용 : 영화진흥원 => JSON으로 전송
		
		1. 함수 호출 
        언제 호출하는지 
          = onclick => button/img 
          = onmouseover / onmouseout 
          = onchange 
          = onkeydown / onkeyup 
     	2. 이벤트 처리 
	     = onclick => button/img 
	     = onmouseover / onmouseout 
	     = onchange 
	     = onkeydown / onkeyup 
     	3. 태그 읽기 => DOM 
        ***document.querySelector(CSS 선택자)
        document.getElementById(id명) => id 
        document.getElementByClassName(class명) = class
        document.getElementByTagName(태그명) = Tag이름 읽기 
        바닐라 JS => 순수하게 JavaScript만 이용해서 처리 
		
 --%>
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
	width: 960px;
}
</style>
<script src="http://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript">
// 전역변수 선언
let movie=[]
window.onload=()=>{
	movieList(1)
	/*
	searchMainDailyBoxOffice.do
	searchMainRealTicket.do
	searchMainDailySeatTicket.do
	https://www.kobis.or.kr/kobis/business/main/
	*/
}
function movieList(no){
	// 서버 연결 movie_list.do?no=1
	axios.get('movie_list.do',{
		params:{
			no:no
		}
	}).then(response=>{
		// response => JSON / 일반 문자열
		movie=response.data
	//	console.log(movie)
		let html=''
		movie.forEach((m)=>{
			html+='<tr onmouseover="movieDetail('+m.rank+')">'+
					'<td class="text-center">'+m.rank+'</td>'+
					'<td class="text-center"><img src="https://www.kobis.or.kr/'+m.thumbUrl.replace("thumb/thn_","")+'" width=30 height=30></td>'+
					'<td class="text-center">'+m.movieNm+'</td>'+
					'<td class="text-center">'+m.director+'</td>'+
					'<td class="text-center">'+m.genre+'</td>'+
				'</tr>'
		})
		// <tbody>로 데이터 전송
		document.querySelector('#list tbody').innerHTML=html
	})
	
}
// const movieDetail=function(mn){}
// const movieDetail=(mno)=>{}
function movieDetail(mno){
	let table=document.querySelector("#detail")
	table.style.display=''
	let m=movie.find(m=>m.rank===mno)
	console.log(m)
	let img=document.querySelector("#poster")
	img.src="https://www.kobis.or.kr/"+m.thumbUrl.replace("thumb/thn_","")
	let name=document.querySelector("#name")
	name.textContent=m.movieNm
	// $('#name').text(m.movieNm)
	let director=document.querySelector("#director")
	director.textContent=m.director
	let genre=document.querySelector("#genre")
	genre.textContent=m.genre
	let grade=document.querySelector("#grade")
	grade.textContent=m.watchGradeNm
	let regdate=document.querySelector("#regdate")
	regdate.textContent=m.startYearDate
	let story=document.querySelector("#story")
	story.textContent=m.synop
}

</script>
</head>
<body>
	<div class="container">
		<div class="row text-center">
			<button class="btn-lg btn-warning" onclick="movieList(1)">박스오피스</button>
			<button class="btn-lg btn-info" onclick="movieList(2)">실시간 예매율</button>
			<button class="btn-lg btn-success" onclick="movieList(3)">좌석 점유율</button>
		</div>
		<div class="row" style="margin-top: 20px">
			<div class="col-sm-8">
				<table class="table" id="list">
					<thead>
						<tr class="success">
							<th class="text-center">순위</th>
							<th class="text-center"></th>
							<th class="text-center">영화명</th>
							<th class="text-center">감독</th>
							<th class="text-center">장르</th>
						</tr>
					</thead>
					<tbody>
					
					</tbody>
				</table>
			</div>
			<div class="col-sm-4">
				<table class="table" id="detail" style="display: none">
					<tbody>
						<tr>
							<td colspan="2" class="text-center">
								<img src="" style="width: 360px;height: 480px; object-fit: contain;" id="poster">
							</td>
						</tr>
						<tr>
							<td width=25%>영화명</td>
							<td width=75% id="name"></td>
						</tr>
						<tr>
							<td width=25%>감독</td>
							<td width=75% id="director"></td>
						</tr>
						<tr>
							<td width=25%>장르</td>
							<td width=75% id="genre"></td>
						</tr>
						<tr>
							<td width=25%>등급</td>
							<td width=75% id="grade"></td>
						</tr>
						<tr>
							<td width=25%>개봉일</td>
							<td width=75% id="regdate"></td>
						</tr>
						<tr>
							<td colspan="2" id="story"></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>