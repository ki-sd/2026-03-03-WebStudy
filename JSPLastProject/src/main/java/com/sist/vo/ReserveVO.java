package com.sist.vo;
import java.util.*;

import lombok.Data;
@Data
public class ReserveVO {
	private int rno,fno;
	private String id,name,rdate,rtime,inwon,ok,dbday;
	private Date regdate;
	private FoodVO fvo=new FoodVO();
}
