<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="breadcumb-area" style="background-image: url(../img/bg-img/breadcumb.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <div class="bradcumb-title text-center">
                        <h2>맛집 목록</h2>
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
                            <li class="breadcrumb-item"><a href="#"><i class="fa fa-home" aria-hidden="true"></i></a></li>
                            <li class="breadcrumb-item active" aria-current="page"></li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- ****** Breadcumb Area End ****** -->

    <!-- ****** Archive Area Start ****** -->
    <section class="archive-area section_padding_80">
        <div class="container">
            <div class="row">

                <!-- Single Post -->
                <c:forEach var="vo" items="${list }">
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-post wow fadeInUp" data-wow-delay="0.1s">
                        <!-- Post Thumb -->
                        <div class="post-thumb">
                        	<a href="../food/detail_before.do?fno=${vo.fno }">
                            	<img src="${vo.poster }" alt="">
                            </a>
                        </div>
                        <!-- Post Content -->
                        <div class="post-content">
                            <div class="post-meta d-flex">
                                <div class="post-author-date-area d-flex">
                                    <!-- Post Author -->
                                    <div class="post-author">
                                        <a href="#">${vo.type }</a>
                                    </div>
                                    <!-- Post Date -->
                                    <div class="post-date">
                                        <a href="#">${vo.phone }</a>
                                    </div>
                                </div>
                                <!-- Post Comment & Share Area -->
                                <div class="post-comment-share-area d-flex">
                                    <!-- Post Favourite -->
                                    <div class="post-favourite">
                                        <a href="#"><i class="fa fa-heart-o" aria-hidden="true"></i> ${vo.likecount }</a>
                                    </div>
                                    <!-- Post Comments -->
                                    <div class="post-comments">
                                        <a href="#"><i class="fa fa-comment-o" aria-hidden="true"></i> ${vo.replycount }</a>
                                    </div>
                                    <!-- Post Share -->
                                    <div class="post-share">
                                        <a href="#"><i class="fa fa-share-alt" aria-hidden="true"></i></a>
                                    </div>
                                </div>
                            </div>
                            <a href="../food/detail_before.do?fno=${vo.fno }">
                                <h4 class="post-headline">${vo.name }</h4>
                            </a>
                        </div>
                    </div>
                </div>
                <%--
                		저장공간
                		session : 접속시 서버에 저장 => 공간
                			      한명당 1개만 생성
                			      ----------------------
                			      |port가 다른 경우엔 저장 X
                			       react / spring-boot
                			       (client) (server)
                			       => 3000  => 8080
                			       |= javascript의 session
                			       |= JWT : cookie 기반
                			          --- 카카오 로그인
                			       => 사용자 정보 저장 (로그인)
                			       => 브라우저 종료 / 로그아웃시에 사라짐
                			       => 내장객체 (HttpSession)
                			       => Object단위로 저장 가능
                			       => 주요 메서드
                			          1) setAttribute(String key, object value)
                			             저장
                			          2) getAttribute(String key)
                			             => 출력시 ${sessionScope.key}
                			          3) invalidate()
                			             => 세션 해제 => 전체 메모리 삭제
                			                로그아웃 / 브라우저 종료
                			          4) isNew()
                			             => 처음 저장하는지 여부
                			                => 장바구니
                			          5) getId()
                			             => 구분 (사용자)
                			                => 채팅
                			          6) setMaxInactiveInterval()
                			             => 시간 설정 (디폴트 1800초)
                			       
                		cookie : 브라우저에 저장
                				 new Cookie()
                				 => 문자열만 저장 가능
                				 => 자동로그인 / 최근 방문 / 장바구니
                				 => 주요 메서드
                				      1) 저장 => 생성자 new Cookie(String key,String value)
                				      2) 저장위치 => setPath() => 보통 "/" (루트) 많이 씀
                				      3) cookie => key읽기 => getName()
                				                   value읽기 => getValue()
                				      4) 삭제 => setMaxAge(0)
                				      
            			cookie / session => 상태관리 프로그램
            			                    ----- 데이터 유지 (Vue / React)
            			                    
            			=> 생성
            			   request를 이용해서 생성
            			   request.getSession() / request.getCookie()
            			   -------
            			    getParameter() : 요청값 받기 => String
            			    getParameterValues : 2개 이상의 요청값 받기 => String[]
            			    setAttribute() : request 안에 새로운 데이터 저장
            			      => getAttribute() : => JSP : ${key}
            			      
            			   response : 응답
            			      => HTML => setContentType("text/html")
            			      							 text/xml
            			      							 text/plain
            			      => COOKIE => addCookie()
            			      => setHeader()
            			      => sendRedirect()
            			   application : 서버 관리
            			      => getRealPath() / getResource()
            			                         ------------- 운영체제 관계 없이 사용 가능
            			                         
            			MVC
            			  브라우저 : .do
            			   | request
            			  DispatcherServlet (Controller)
            			   | request
            			  Model <=====> DAO
            			   | request안에 출력에 필요한 데이터를 담는다
            			  DispatcherServlet
            			   | request
            			  JSP
            			  
            			  ------------------------------------------------------------- Back
            			  
            			  MyBatis
            			   => 환경설정 (config.xml)
            			       | Connection 관련
            			   => SQL 저장 파일(mapper.xml) : 여러개 생성 가능 (보통 테이블당 하나)
            			       | DAO
            			         = selectList("id",매개변수)
            			         = selectOne("id",매개변수)
            			       
            			        
                
                 --%>
				</c:forEach>
				
                <div class="col-12">
                    <div class="pagination-area d-sm-flex mt-15">
                        <nav aria-label="#">
                            <ul class="pagination">
                            <c:if test="${startPage>1 }">
                            	<li class="page-item">
                                    <a class="page-link" href="../food/list.do?page=${startPage-1 }">이전 <i class="fa fa-angle-double-left" aria-hidden="true"></i></a>
                                </li>
                            </c:if>
                                <c:forEach var="i" begin="${startPage }" end="${endPage }">
                                	<li class="page-item ${curpage==i?'active':'' }"><a class="page-link" href="../food/list.do?page=${i }">${i }</a></li>
                                </c:forEach>
                            <c:if test="${endPage<totalpage }">
                                <li class="page-item">
                                    <a class="page-link" href="../food/list.do?page=${endPage+1 }">다음 <i class="fa fa-angle-double-right" aria-hidden="true"></i></a>
                                </li>
                            </c:if>
                            </ul>
                        </nav>
                        <div class="page-status">
                            <p>Page ${curpage } of ${totalpage } results</p>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>
</body>
</html>