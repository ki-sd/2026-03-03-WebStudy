package com.sist.vo;

import lombok.Data;

@Data
public class FoodVO {
	private int no,likecount,replycount,jjimcount,hit;
	private double score;
	private String name,type,phone,address,price,theme,time,reserve,parking,content,poster,images;
}
