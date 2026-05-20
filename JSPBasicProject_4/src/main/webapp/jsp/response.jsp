<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--  169p
	  1. JSP에서 사용되는 내장 객체 : 미리 객체가 생성
	     ***request : HttpServletRequest => 요청정보
	     ***response : HttpServletResponse => 응답 정보
	     ***session : HttpSession 서버에 필요한 데이터 저장
	     out : 출력 버퍼와 제어
	           ------ 실행시에 HTML을 저장하는 메모리 공간
	           JspWriter <%= %>
	     ***application : 서버 정보 => ServletContext
	     pageContext : 내장 객체 관리 / include / forward
	           PageContext
	           => <jsp:include> <jsp:forward>
	     exception : 예외처리 => Exception
	     page : Object => 자신의 객체 (this)
	     config : 환경 설정 => web.xml
	              ServletConfig
	              
	   = request : HttpServletRequest
	     1)역할 
	       http://localhost/JSPBasicProject_4/jsp/response.jsp
	       ---------------  --------------------------------
	          서버 정보               요청 정보 ===> URL
	                        -------------------------------- URI
	                        --------------- ContextPath
	       => 주소창을 통해서 서버로 전송
	          ----
	        # 서버정보
	          서버이름 : getServerName()
	          프로토콜 : getProtocol()
	          전송방식 : getMethod()
	                  ----------- RestFul
	                  => 다른 프로그램과 연동 : GET / POST / DELETE / PUT
	                  GET : 화면출력 => SELECT
	                  POST : 데이터를 받아서 저장 => INSERT
	                  DELETE : 삭제 => DELETE
	                  PUT : 수정 => UPDATE
	                  ***web에서는 주로 사용 => GET / POST
	        # 브라우저 정보
	          ***클라이언트의 IP => getRemoteAddr()
	          클라이언트의 PORT => getServerPort() => 80
	                           CI/CD => 8080 / 8081 ....
	          URL ===> getRequestURL()
	          ***URI ===> getRequestURI()
	          ***ContextPath => getContextPath()
	        # 사용자 요청 정보  
	          단일값 : text,password,file,date,radio...
	          String 변수=request.getParameter("name속성값")
	          다중값 : checkbox,<select multiple>
	          String[] 변수=request,getParameterValues("name속성값")
	          한글 깨지는 경우 : setCharacterEncoding(UTF-8)
	          -------------------------------------------
	          
	          웹으로 전송 : 인코딩 (byte[])
	          자바 
	            %EC%9E%90%EB%B0%94
	          받는 경우
	            자바 => 디코딩 => setCharacterEncoding("UTF-8");
	          Windows 11 => 자동변환
	         ---------------------------------------------
	        전송시
	          main.jsp?no=10
	                   key value => key가 중복되면 안된다 => map방식
	          10을 main.jsp로 전송
	              --------
	          String no=request.getParameter("no");
	                 -- 10
	          **웹에서는 모든 데이터가 String
	          **메서드의 매개변수에서 받아서 처리
	          
	        ** 상세보기 : primary key (중복없는값)
	        ** 검색 : 검색어
	        ** 회원가입 : 입력된 데이터 전체 전송
	        ** 로그인 : id/pwd
	        ** 예약 : 가게명 / 예약일 / 예약시간 / 인원
	        
	      # 추가 정보
	        ------ MVC에서는 데이터베이스 결과값을 추가해서 JSP로 전송
	        *** void setAttribute("키",값(Object))
	        *** Object getAttribute("키") => 형변환 후 사용
	        주고 받기
	            -- 응답
	        -- 요청
	        
	      = response 객체
	        ======> HttpServletResponse
	                -------------------
	                 응답 : HTML (브라우저)
	                      setContentType("text/html;charset=URF-8")
	                      Cookie전송
	                      addCookie(쿠키명)
	                      => 미리 전송 : setHeader
	                         => 다운로드시 / JSON 전송
	                 *** 두개를 동시에 응답할 수 없다 (파일 한개만 전송 가능)
	                 화면 이동 정보
	                 sendRedirect("이동할 파일명") : GET
	                 insert => insert_ok => list
	                           ---------
	                           sendRedirect("list")
	                 ** 단점 : request를 초기화
	                 ** 보완 : forward => request 계속 유지
	                 url주소의 파일명
	                 *** 두개를 동시에 응답할 수 없다 (파일 한개만 전송 가능)
	                 

 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>