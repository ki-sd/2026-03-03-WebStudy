package com.sist.service;

import java.util.List;
import java.util.Map;

import com.sist.dao.FoodDAO;
import com.sist.vo.FoodVO;

public class FoodServiceImpl implements FoodService {
	private FoodDAO dao=new FoodDAO();
	@Override
	public List<FoodVO> foodListData(int start) {
		return dao.foodListData(start);
	}

	@Override
	public int foodTotalPage() {
		return dao.foodTotalPage();
	}

	@Override
	public FoodVO foodDetailData(int no) {
		dao.foodHitIncrement(no);
		return dao.foodDetailData(no);
	}

	@Override
	public FoodVO foodCookieData(int no) {
		return dao.foodDetailData(no);
	}

	@Override
	public List<FoodVO> foodFindListData(Map map) {
		return dao.foodFindListData(map);
	}

	@Override
	public int foodFindTotalPage(Map map) {
		return dao.foodFindTotalPage(map);
	}

}
