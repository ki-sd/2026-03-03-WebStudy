package com.sist.service;

import java.util.List;
import java.util.Map;

import com.sist.vo.FoodVO;

public interface RecommendService {
	public List<FoodVO> foodRecommendData(String id);
}
