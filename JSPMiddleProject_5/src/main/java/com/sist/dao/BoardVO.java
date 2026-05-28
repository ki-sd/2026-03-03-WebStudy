package com.sist.dao;
//no NUMBER,
//name VARCHAR2(51) CONStRAINT jrb_name_nn NOT NULL,
//subject VARCHAR2(4000) CONStRAINT jrb_sub_nn NOT NULL,
//content CLOB CONStRAINT jrb_cont_nn NOT NULL,
//pwd VARCHAR2(10) CONStRAINT jrb_pwd_nn NOT NULL,
//regdate DATE DEFAULT SYSDATE,
//hit NUMBER DEFAULT 0,
//group_id NUMBER,
//group_step NUMBER DEFAULT 0,
//group_tab NUMBER DEFAULT 0,
//root NUMBER DEFAULT 0,
//depth NUMBER DEFAULT 0,
//CONSTRAINT jrb_no_pk PRIMARY KEY(no)
import java.util.*;

import lombok.Data;
@Data
public class BoardVO {
	private int no, hit, group_id,group_step,group_tab,root,depth;
	private String name,subject,content,pwd,dbday;
	private Date regdate;
}
