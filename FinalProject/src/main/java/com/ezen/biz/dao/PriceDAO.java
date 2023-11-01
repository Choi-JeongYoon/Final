package com.ezen.biz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.biz.dto.PriceVO;


@Repository
public class PriceDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertPrice(PriceVO vo) {
		mybatis.insert("PriceDAO.insertPrice",vo);
	}
	public List<PriceVO> selectPriceList(int pnum){
		return mybatis.selectList("PriceDAO.selectPriceList",pnum);
	}
	public PriceVO selectPrice(PriceVO vo) {
		return mybatis.selectOne("PriceDAO.selectPrice", vo);
	}
	public void updatePrice(PriceVO vo) {
		mybatis.update("PriceDAO.updatePrice", vo);
	}
	public void deletePrice(int bno) {
		mybatis.update("PriceDAO.deletePrice", bno);
	}
}
