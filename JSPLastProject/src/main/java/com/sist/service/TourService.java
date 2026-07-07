package com.sist.service;
import java.util.*;

import com.sist.vo.TourVO;
public interface TourService {
	public List<TourVO> travelListData(Map map);
	public int travelTotalPage(Map map);
}
