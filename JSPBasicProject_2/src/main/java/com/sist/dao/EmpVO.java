package com.sist.dao;
//EMPNO    NOT NULL NUMBER(4)    
//ENAME             VARCHAR2(10) 
//JOB               VARCHAR2(9)  
//MGR               NUMBER(4)    
//HIREDATE          DATE         
//SAL               NUMBER(7,2)  
//COMM              NUMBER(7,2)  
//DEPTNO            NUMBER(2)    
import java.util.*;

import lombok.Data;
@Data
public class EmpVO {
	private int empno,mgr,sal,comm,deptno;
	private String ename,job,dbday,strsal;
	private Date hiredate;
	private DeptVO dvo=new DeptVO();
}
