package com.sist.service;

import java.util.*;

import com.sist.dao.RecommendDAO;
import com.sist.vo.FoodVO;

public class RecommendServiceImpl implements RecommendService {
	RecommendDAO dao=new RecommendDAO();
	@Override
	public List<FoodVO> foodRecommendData(String id) {
		String type=dao.foodGetType(id);
		String address=dao.memberGetAddress(id);
		String[] addrs=address.split(" ");
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("type", type);
		map.put("address", addrs[1]);
		return dao.foodRecommendData(map);
	}

}
