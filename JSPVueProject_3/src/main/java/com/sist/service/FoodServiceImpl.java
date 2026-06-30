package com.sist.service;

import java.util.List;

import com.sist.dao.FoodDAO;
import com.sist.vo.FoodVO;

public class FoodServiceImpl implements FoodService {
	FoodDAO dao=new FoodDAO();
	@Override
	public List<FoodVO> foodListData(int start) {
		return dao.foodListData(start);
	}

	@Override
	public int foodTotalPage() {
		return dao.foodTotalPage();
	}

	@Override
	public FoodVO foodDetailData(int fno) {
		return dao.foodDetailData(fno);
	}

}
