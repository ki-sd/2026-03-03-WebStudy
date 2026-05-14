package com.sist.vo;
//NO           NUMBER(3)     
//CNO          NUMBER(1)     
//TITLE        VARCHAR2(300) 
//SINGER       VARCHAR2(200) 
//ALBUM        VARCHAR2(200) 
//POSTER       VARCHAR2(260) 
//STATE        CHAR(6)       
//IDCREMENT    NUMBER(3)

import lombok.Data;
@Data
public class MusicVO {
	private int no,cno,idcrement;
	private String title,singer,album,poster,state,displayState;
	
	public String getDisplayState() {  
	    if ("상승".equals(state)) {
	        displayState = "<span style='color: red;'>▲" + idcrement + "</span>";
	    } else if ("하강".equals(state)) {
	        displayState = "<span style='color: blue;'>▼" + idcrement + "</span>";
	    } else {
	        displayState = "<span>-</span>";
	    }
	    return displayState;
	}
}
