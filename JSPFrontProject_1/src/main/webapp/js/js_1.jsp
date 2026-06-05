<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
         자바 스트립트
         1) 변수 (let(변수), const(상수))
         2) 자료형 종류 ( number , string , boolean , null , function , object , undefined)
         3) 연산자
         4) 제어문 (조건문 , 반복문 , 반복 제어문)
         5) 함수
         6) 배열 / 객체 => JSON
         ------------------------------ 기본 문법
         7) 태그 제어 (HTML 화면 제어) => DOM (Document Object Model)
         8) 이벤트
		 9) 비동기 (async / await) => promise
		 ------------------------------------ Vanilla JS
		 10) 라이브러리
		     Jquery 3 =====> Jquery 4
		 11) Vue3 => Vues => Pinia => NuxtJS
		 =====> NodeJS / TypeScript
		 12) React => Redux => TanStackQuery => NextJS
		 
		 웹 구성 (Front)
		   = HTML : 웹페이지의 구조
		   = CSS : 디자인 / 스타일 변경
		   = JavaScript : 동작 / 기능 처리 => 데이터 처리
		   = 전체 기반 => HTML (브라우저에서 실행하는 언어)
		 특징
		   = 인터프리터 (컴파일을 하지 않음) => 한줄씩 읽어서 출력
		     ** 에러 처리가 어렵다 => 개발자 도구 (f12)
		   = 동적 페이지 : 화면 변경없이 그자리에서 처리
		   = 비동기 처리가 가능
		 사용처
		   = 웹 개발 (동적 처리) 
		     = 로그인처리 / 팝업창 (아이디 중복체크, 우편번호 검색)
		     = 검색 / suggest(자동완성)
		     = JavaScript => Vue / React
		   = Back-End 개발 가능 (서버) => NodeJS
		   = 모바일 : React Native
		   = 데스크탑 애플리케이션 : VsCode / VuErd
		   = 게임개발 / 실시간 채팅 (화상) / AI
		     ** 오렌지 / 스프렁크 => 데이터 분석(데이터마이닝)
		     
  		 어떤 언어인지 : HTML과 CSS로 구성된 웹페이지를 동적으로 변경
  		            ---------- 정적(데이터 변경X)
  		 동작 방법
  		   = 내부 script 
  		        <head>
  		        	<script>
  		        		처리
  		        	</script>
  		        </head>
  		   = 외부 script
  		   		.js 파일을 만들어서 처리
  		   		<script src="파일명">
  		   = 인라인 script
  		        태그 자체 처리
  		        <button onclick="javascript:history.back()">
  		        
  		 => JavaScript
  		    = window.onload=function(){처리}   ===>   변수 선언 / 제어문 / 함수선언 / 이벤트 등록
  		    = ${function(){처리}}  (JQuery)
  		    = mounted(){}  (Vue)
  		    = componentDidMount(){처리}   (React)
  		      -----------------
  		      useEffect()
  		      
  		 정의 : 웹브라우저에서 동작하는 스크립트언어
  		                       ----- 단순한 언어
  		 용도 : 동적 페이지 제작 , 서버 개발 , 앱 개발
  		 실해환경 : 브라우저에서 실행
  		 특징 : 인터프리터 / 객체 기반 / 이벤트 중심
  		 
  		 1. 기본문법
  		    = 변수 : 자동인식변수 => ES5 : var => ES6 : let / const
  		      1개의 데이터를 저장하는 공간
  		      ** 데이터형이 없다 : 값을 대입하면 자동으로 인식
  		      let a=["aaa","bbb"] => array
  		      let a={"name":"홍길동":age:20} => object
  		            ---------------------- 객체
  		      var / let  :  변수 => 값 변경 가능
  		            ---
  		            | 블록을 벗어나면 바로 사라짐 (사용범위 명확)
  		      ----
  		      | Scope(사용범위)가 명확하지 않음
  		      
  		      const  :  상수 => 값 변경 X
  		      => 서버에서 값을 받은 경우 (Java의 final)
  		      -----------------------------------------
  		      단점
  		        => 데이터형 확인이 어려움
  		           let a=10
  		           a=""
  		           a=[]
  		           a={}
  		           가독성 떨어짐
  		           ---------- 보완 => 데이터형 지정 (TypeScript)
  		           let a:string="" let a:number=10 ...
  		        => 자바스크립트에서 제공하는 데이터형
  		           1) 기본형 : number , string , boolean , null
  		                     undefined , bigint(long)
  		           2) 참조형 : object , array , function
  		              => function을 데이터형으로 취급
  		              => 매개변수로 사용 가능
  		           => 데이터형 확인 : typeof
  		        => 형변환
  		           숫자 변환 : Number("10") => 10
  		                    parseInt("10") => 10
  		           문자 변환 : String(10) => "10"
  		           논리 변환 : Boolean(0) => false
  		                     Boolean(1) => true
  		                     0, 0.0 , null 이외 전부 true
  		           *** 서버 연결
  		               List =======> [] (배열)
  		               VO   =======> {} (객체)
  		               
  		        => Vue = SpringBoot
  		        = React = SpringBoot ===> MSA (CDN)
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	// main => 자동으로 실행되는 함수
//	window.onload()=>{}
	window.onload=function(){
		/*
		프로그램에 필요한 변수 선언
		변수 선언 : var / let / const
		식별자 
		 = 알파벳으로 시작(대소문자 구분)
	     = 숫자사용 가능 (맨앞 X)
	     = 공백 X
	     = 문자 길이는 상관X
	     = 키워드 사용 X
	     = 특수문자 : _ , $
	    이전 => ; 사용
	    let a=10;
	    최근 => ; 생략 가능
	    let a=10
	    
	    출력
	     1. console.log(변수) => 개발자 도구 (명령프롬프트)
	     2. document.write(출력) => 브라우저에 출력
	     3. alert()  =>  팝업
	     4. 원하는 태그안에 값을 주입 => innerHTML
		*/
		// 1. 데이터형 확인 : typeof
		 let a=10
	     let b=10.5
	     let c="Hello JavaScript"
	     let d='Hello JavaScript'
	     let e=[1,2,3,4,5]
	     let f={"name":"홍길동","age":20}
	     let g=function(){}
	     let h
	     let i=true
	     
	     console.log("a="+a+",type="+typeof a)
	     console.log("b="+b+",type="+typeof b)
	     console.log("c="+c+",type="+typeof c)
	     console.log("d="+d+",type="+typeof d)
	     console.log("e="+e+",type="+typeof e)
	     console.log("f="+f+",type="+typeof f)
	     console.log("g="+g+",type="+typeof g)
	     console.log("h="+h+",type="+typeof h)
	     console.log("i="+i+",type="+typeof i)
	     
	     // 변수값 변경
	     let aa="Hello JavaScript"
	     aa="Hello JavaScript ES6"
	     console.log("aa="+aa) //문자열 결합
	     
	     var bb=10
	     var bb=20;
	     console.log("bb="+bb)
	     // let변수는 var의 단점 보완 => 권장
	     // 단점 => 한개 변수로 데이터형 변경 가능 => 가독성 (데이터형 파악 어려움)
	     let cc=10
	     cc="Hello"
	     cc='Hello JavaScript'
	     cc=[1,2,3,4,5]
	     cc={"name":"홍길동","age":10}
	     cc=true
	     cc=function(){}
	     
	     const dd=10;
//	     dd="Hello JS!!" // 상수는 변경이 불가능함
	     console.log("dd="+dd)
	}
	
</script>
</head>
<body>

</body>
</html>