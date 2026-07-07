package com.sist.service;

import java.util.List;

import com.sist.dao.MainDAO;
import com.sist.vo.*;

public class MainServiceImpl implements MainService {
	private MainDAO dao=new MainDAO();
	@Override
	public TourVO mainSeoulOne() {
		// TODO Auto-generated method stub
		return dao.mainSeoulOne();
	}

	@Override
	public List<TourVO> mainBusanTop4() {
		// TODO Auto-generated method stub
		return dao.mainBusanTop4();
	}

	@Override
	public List<TourVO> mainJejuTop4() {
		// TODO Auto-generated method stub
		return dao.mainJejuTop4();
	}

	@Override
	public List<FoodVO> mainFoodTop7() {
		// TODO Auto-generated method stub
		return dao.mainFoodTop7();
	}

}
