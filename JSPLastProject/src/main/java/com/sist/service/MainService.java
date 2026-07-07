package com.sist.service;

import java.util.List;

import com.sist.vo.*;

public interface MainService {
	public TourVO mainSeoulOne();
	public List<TourVO> mainBusanTop4();
	public List<TourVO> mainJejuTop4();
	public List<FoodVO> mainFoodTop7();
}
