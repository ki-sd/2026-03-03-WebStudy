package com.sist.service;

import java.util.*;

import com.sist.dao.GoodsDAO;
import com.sist.vo.GoodsVO;

public class GoodsServiceImpl implements GoodsService{
	private GoodsDAO dao=new GoodsDAO();

	@Override
	public List<GoodsVO> goodsListData(int start) {
		return dao.goodsListData(start);
	}

	@Override
	public int goodsTotalPage() {
		return dao.goodsTotalPage();
	}

	@Override
	public GoodsVO goodsDetailData(int no) {
		return dao.goodsDetailData(no);
	}
}
