package com.sist.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.*;
import java.lang.reflect.Method;
import java.util.*;
import com.sist.model.*;
/*
 *     브라우저 (주소창) 요청 ==== Controller ===== Model 찾기 ==== Model의 메서드 호출 ==== Controller ==== JSP 
 *                                                          ------           결과값            결과값전송
 *                                                           DAO 연동
 *     1) 클래스 구분 / 메서드 찾기 => 어노테이션
 *                              | 기능없음 => 검색
 *                                쉽게찾기
 *     2) 필요한 데이터 등록 => XML
 *     3) 데이터베이스 연동 => MyBatis / JPA
 *     4) MVC 동작 방법
 *     ---------------------------- 라이브러리화 => SpringFramework / Spring-Boot
 *     
 *     어노테이션 : 알아보기 쉽게 만든 것
 *               주석 아님
 *               => 구분 => 마커
 *       |복잡한 XML / If문 단순화 => 소스 간결화 / 생산성 향상
 *       
 *     => 제작
 *     1. Retention : 메모리 할당시 => 언제까지 사용
 *        SOURCE / CLASS / RUNTIME
 *        --------------
 *        컴파일시 바로 사라짐 예) @Override
 *     2. Target : 어디에 붙일까?
 *        **Type => 클래스 위
 *        **Method => 메서드 위
 *        Constructor => 생성자 위
 *        Parameter => 매개변수 위
 *        **Field => 멤버변수 위
 */
@WebServlet("*.do")
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String pack="com.sist.model";
	private List<String> clsList=new ArrayList<String>();
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		try {
			String path="C:\\webDev\\webStudy\\JSPMVCProject_5\\src\\main\\java";
			String s=path+"\\"+pack.replace(".", "\\");
			System.out.println(s);
			File dir=new File(s);
			File[] files=dir.listFiles();
			for(File f:files) {
				if(f.isFile()) {
					String name=f.getName();
					String ext=name.substring(name.lastIndexOf(".")+1);
					if(ext.equals("java")) {
//						System.out.println(name);
						String ss=pack+"."+name.substring(0,name.lastIndexOf("."));
//						System.out.println(ss);
//						Class clsName=Class.forName(ss);
//						Object obj=clsName.getDeclaredConstructor().newInstance();
//						System.out.println(obj);
						clsList.add(ss);
					}
				}
			}
		}catch(Exception ex) {}
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 사용자 요청 정보 받기
		String uri=request.getRequestURI();
		String cmd=uri.substring(request.getContextPath().length()+1);
		try {
			// 메서드 찾기 com.sist.model.FoodModel
			for(String cls:clsList) {
				Class clsName=Class.forName(cls);
				if(clsName.isAnnotationPresent(Controller.class)==false) {
					continue;
				}
				Object obj=clsName.getDeclaredConstructor().newInstance();
				// 클래스 안에서 메서드 찾기
				// 클래스 전체 메서드를 가지고 온다
				Method[] methods=clsName.getDeclaredMethods();
				for(Method m:methods) {
					// method 위에 @RequestMapping 존재하는지 확인
					RequestMapping rm=m.getAnnotation(RequestMapping.class);
					if(rm.value().equals(cmd)) {
						String jsp=(String)m.invoke(obj, request, response);
						if(jsp==null) {
							// void => Jquery / Vue => JSON 전송 : JS연결
							return;
						}
						else if(jsp.startsWith("redirect:")) {
							// sendRedirect() => request 초기화 후 화면 변경
							// => _ok
							response.sendRedirect(jsp.substring(jsp.indexOf(":")+1));
						}else {
							// request전송 => forward 이용 => request값을 유지
							RequestDispatcher rd=request.getRequestDispatcher(jsp);
							rd.forward(request, response);
						}
						return;
					}
				}
			}
		}catch(Exception ex) {}
	}

}
