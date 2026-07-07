package com.sist.vo;

import lombok.Data;

//CONTENTID     NOT NULL NUMBER(38)     
//CONTENTTYPEID          NUMBER(38)     
//AREACODE               NUMBER(38)     
//TITLE         NOT NULL VARCHAR2(400)  
//ADDR1                  VARCHAR2(1000) 
//ADDR2                  VARCHAR2(500)  
//MAPX                   NUMBER(38,10)  
//MAPY                   NUMBER(38,10)  
//FIRSTIMAGE             VARCHAR2(4000) 
@Data
public class TourVO {
	private int contentid,contenttypeid,areaCode,likecount,replycount,hit;
	private double mapx,mapy;
	private String title,addr1,addr2,firstimage;
}
