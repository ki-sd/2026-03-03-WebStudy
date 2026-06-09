<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	   345p 문서 객체 모델
	        ---------- 태그를 제어하는 프로그램
	                   --- 태그를 가지고 오는 문제 (객체 : 태그)
	                   태그 => 클래스 , 속성 => 멤버변수
	                   <a href="" target="">
	                   class a
	                   {
	                   	  String href,target;
	                   }
	         DOM (Document Object Model)
	    HTML / XML => ML(Markup Language) => 메모리에 저장 (트리 형태)
	    <html>
	     <head>
	     </head>
	     <body>
	       <div></div>
	       <div></div>
	     </body>
	    </html>
	    
	                      html
	                       |
	                ----------------
	                |              |
	              head           body
	                               |
	                        ---------------
	                        |      |      |
	                       div    div    span
	     HTML => 화면 UI
	     DOM => 자바스크립트에서 제어를 할 수 있게 만든 구조
	     1) 문서 객체 선택
	     2) 문서 객체 조작 : 글자 조작 / 스타일 조작 / 속성 조작
	     3) 이벤트 : 인라인 이벤트 모델 / 고전 이벤트 모델 / 이벤트 등록
	     4) -------------------- 라이브러리 (JQuery)
	        JQuery 3 / JQuery 4
	        ------------------- 가벼움 (추가/삭제/권장)
	        CDN => Component 방식 (Vue,React)
	                             ---  -----
	                             |=>CI/CD=>CDN
	     => 문서 객체 선택
	        1. 속성중에 id가 존재
	           <button id="btn">
	           let btn=document.getElementById("btn") *** 대표적으로 쓰임
	        2. 속성중에 class가 있는 경우
	           <button class="btns">
	           let btns=document.getElementsByClassNae("btns")
	                [] => for 이용
	     ***3. 속성이 없는 경우
	           document.querySelector("CSS 선택자")
	              id = document.querySelector("#id명")
	              class = document.querySelector(".class명")
	              tag = document.queryselector("태그명")
	        4. 태그선택 = document.getElementByTagName("태그명")
	           => 원하는 태그를 읽어온다
	              ---------------- 속성값 변경 / 값추가 / HTML 추가 / CSS 추가
	              document.getElementByName() => name속성
	              document.getElementByClassName() => class속성
	              document.querySelectorAll() => class속성 / 태그명
	              ----------------------------------------------
	              동시에 여러개의 태그 읽기 : <th> <li>
	              
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
let sawon={
		name:"홍길동",
		getName:()=>{
			// document.write("이름:"+this.name)
			let h1=document.querySelector("h1")
			h1.style.color="red"
			h1.style.backgroundColor="yellow"
			h1.style.fontStyle="italic"
			h1.textContent=this.name
			//h1.innerHTML=this.name
		},
		setName:(name)=>{
			this.name=name
		}
}
window.onload=()=>{
	sawon.setName("심청이")
	sawon.getName()
}
</script>
</head>
<body>
	<h1></h1>
</body>
</html>