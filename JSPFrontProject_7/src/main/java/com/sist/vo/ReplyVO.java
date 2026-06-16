package com.sist.vo;
//NO      NOT NULL NUMBER       
//BNO              NUMBER       
//ID      NOT NULL VARCHAR2(20) 
//NAME    NOT NULL VARCHAR2(51) 
//SEX              CHAR(6)      
//MSG     NOT NULL CLOB         
//REGDATE          DATE        
import java.util.*;

import lombok.Data;
@Data
public class ReplyVO {
	private int no,bno;
	private String id,name,sex,msg,dbday;
	private Date regdate;
}
