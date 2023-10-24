package com.ezen.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.biz.dao.PriceDAO;
import com.ezen.biz.dto.PriceVO;

@Service
public class PriceServiceImpl implements PriceService{
	@Autowired
	private PriceDAO dao;
	public void insertPrice(PriceVO vo) {
		dao.insertPrice(vo);
	}

	public List<PriceVO> selectPriceList() {
		return dao.selectPriceList();
	}

	
	public PriceVO selectPrice(PriceVO vo) {
		return dao.selectPrice(vo);
	}
	public void updatePrice(PriceVO vo) {
		dao.updatePrice(vo);
	}
	
	public void deletePrice(int bno) {
		dao.deletePrice(bno);
	}
}