package com.ezen.biz;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ezen.biz.dao.PriceDAO;
import com.ezen.biz.dto.PriceVO;
import com.ezen.biz.dto.ProductVO;
import com.ezen.biz.utils.Criteria;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
@Log4j
public class PriceTest {
	@Autowired
	private PriceDAO dao;
	@Test
	public void insertPriceTest() {
		PriceVO vo = new PriceVO();
		vo.setPnum(2);
		vo.setPinum(2);
		vo.setPicompa("삼성");
	
		vo.setPipage("링크");
		dao.insertPrice(vo);
	}

	@Test 
public void selectPriceListTest() {
	PriceVO vo=new PriceVO();
	List<PriceVO> list=dao.selectPriceList(2);
	log.info(list);
}
}