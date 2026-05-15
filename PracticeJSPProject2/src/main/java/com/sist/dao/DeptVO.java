package com.sist.dao;

import lombok.Data;

//DEPTNO NOT NULL NUMBER       
//DNAME           VARCHAR2(20) 
//LOC             VARCHAR2(20)
@Data
public class DeptVO {
	private int deptno;
	private String dname,loc;
}
