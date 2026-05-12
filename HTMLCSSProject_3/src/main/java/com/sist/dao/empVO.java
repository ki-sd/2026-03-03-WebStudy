package com.sist.dao;
//EMPNO                                     NOT NULL NUMBER
//ENAME                                     NOT NULL VARCHAR2(50)
//JOB                                       NOT NULL VARCHAR2(50)
//HIREDATE                                  NOT NULL DATE
//SAL                                       NOT NULL NUMBER(10,2)
//DEPTNO                                    NOT NULL NUMBER
//ISADMIN                                            CHAR(1)
import java.util.*;

import lombok.Data;
@Data
public class empVO {
	private int empno,sal,deptno;
	private String ename,job,isadmin,dbdate,dname;
	private Date hiredate;
}
