package com.sist.vo;
import java.util.*;

import lombok.Data;
//NO       NOT NULL NUMBER         
//NAME     NOT NULL VARCHAR2(51)   
//SUBJECT  NOT NULL VARCHAR2(2000) 
//CONTENT  NOT NULL CLOB           
//PWD      NOT NULL VARCHAR2(10)   
//REGDATE           DATE           
//HIT               NUMBER         
//FILENAME          VARCHAR2(260)  
//FILESIZE          NUMBER       
@Data
public class DataBoardVO {
	private int no,hit,filesize;
	private String name,subject,content,pwd,dbday,filename;
	private Date regdate;
}
/*
 * 	1. MVC세팅 => Project
 *  2. VO => table 설정
 *  3. Mapper
 *  4. DAO
 *  5. Model
 *  6. JSP => 출력
 *  ----------------------------------
 *  1. 벤치마킹 => 화면UI (페이지분석)
 *  2. 요구사항 => 기능
 *  3. 벤치마킹 화면에서 프로젝트에 필요한 데이터 추출
 *  4. 데이터베이스 설정
 *  5. 데이터 수집 (크롤링) => INSERT
 *  6. 메인화면제작 => 공통 => GIT
 *  7. 회원가입 / 로그인
 *  8. 역할 분담
 *  9. 종료 => 테스트 (JUnit) : 단위테스트
 *  10. 배포 => AWS
 */
