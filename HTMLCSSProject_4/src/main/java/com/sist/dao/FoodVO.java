package com.sist.dao;

import lombok.Data;

//NAME                                      NOT NULL VARCHAR2(200)
//TYPE                                               VARCHAR2(100)
//PHONE                                              VARCHAR2(50)
//ADDRESS                                            VARCHAR2(500)
//SCORE                                              NUMBER(3,1)
//THEME                                              VARCHAR2(2000)
//POSTER                                             VARCHAR2(500)
//TIME                                               VARCHAR2(500)
//PARKING                                            VARCHAR2(500)
//CONTENT                                            CLOB
//PRICE                                              VARCHAR2(100)
@Data
public class FoodVO {
	private int fno;
	private double score;
	private String name,type,phone,address,theme,poster,parking,content,time,price;
}
