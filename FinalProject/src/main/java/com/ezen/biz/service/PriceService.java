package com.ezen.biz.service;

import java.util.List;

import com.ezen.biz.dto.PriceVO;


public interface PriceService {

	void insertPrice(PriceVO vo);

	List<PriceVO> selectPriceList();

	PriceVO selectPrice(PriceVO vo);

	void updatePrice(PriceVO vo);
	
	void deletePrice(int bno);
}
