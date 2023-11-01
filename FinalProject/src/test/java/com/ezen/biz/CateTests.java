package com.ezen.biz;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ezen.biz.dao.CateDAO;
import com.ezen.biz.dto.McateInfo;
import com.ezen.biz.dto.McateVO;
import com.ezen.biz.dto.ScateInfo;
import com.ezen.biz.dto.ScateVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class CateTests {
	@Autowired 
	private CateDAO dao;
	@Test
	public void cateTest() {
		List<McateVO> list=dao.selectCate();
		for(McateVO vo:list) {
			log.info("------"+vo.getMname());
			List<ScateVO> svo=vo.getSubCateList();
			for(ScateVO s:svo) {
				log.info(s.getSname());
			}
		}
		log.info(list);
	}
	
	@Test
	public void selectProductMCateListTest() {
		List<McateInfo> list=dao.selectProductMCateList();
		log.info(list);
	}
	@Test
	public void selectProductSCateListTest() {
		List<ScateInfo> list=dao.selectProductSCateList();
		log.info(list);
	}
}
