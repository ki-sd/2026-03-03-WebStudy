package com.sist.service;

import java.util.*;

import com.sist.vo.FoodVO;

public interface FoodService {
	public List<FoodVO> foodListData(int start);
	public int foodTotalPage();
	public FoodVO foodDetailData(int no);
}
