package com.sist.service;

import java.util.List;
import java.util.Map;

import com.sist.dao.TourDAO;
import com.sist.vo.TourVO;

public class TourServiceImpl implements TourService {
	private TourDAO dao=new TourDAO();
	
	@Override
	public List<TourVO> travelListData(Map map) {
		return dao.travelListData(map);
	}

	@Override
	public int travelTotalPage(Map map) {
		return dao.travelTotalPage(map);
	}

}
