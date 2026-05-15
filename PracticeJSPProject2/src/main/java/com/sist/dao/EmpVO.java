package com.sist.dao;

import java.util.*;

import lombok.Data;
//EMPNO    NOT NULL NUMBER       
//ENAME    NOT NULL VARCHAR2(50) 
//JOB      NOT NULL VARCHAR2(50) 
//HIREDATE NOT NULL DATE         
//SAL      NOT NULL NUMBER(10,2) 
//DEPTNO   NOT NULL NUMBER       
//ISADMIN           CHAR(1)     
@Data
public class EmpVO {
	private int empno,sal,deptno;
	private String ename,job,dbday,isadmin,sal2;
	private Date hiredate;
	
	DeptVO dvo=new DeptVO();
}
