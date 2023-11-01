package com.ezen.biz;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ezen.biz.dao.ProductDAO;
import com.ezen.biz.dto.ProductVO;
import com.ezen.biz.utils.Criteria;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class ProductTest {
	@Autowired
	private ProductDAO dao;
	@Test
	public void insertProductTest() {
	
	}
	
	@Test 
	public void selectProductListTest() {
		Criteria cri=new  Criteria();
		List<ProductVO> list=dao.selectProductList(cri);
		log.info(list);
	}
	@Test
	public void selectRowCountTest() {
		int n=dao.selectRowCount();
		log.info(n);
	}

	@Test
	public void selectRowCountPaging() {
		Criteria cri=new  Criteria();
		cri.setSearchtype("pname");
		cri.setSearchword("삼성");
		int row=dao.selectRowCount(cri);
		log.info(row);
	}
	
	@Test
	public void selectProductTest() {
		ProductVO vo=new ProductVO();
		vo.setPnum(1);
		vo=dao.selectProduct(vo);
		log.info(vo);
	}
	
	@Test
	public void upadteProductTest() {
		ProductVO vo=new ProductVO();
		vo.setPnum(1);
		vo=dao.selectProduct(vo);
		vo.setPcompa("엘지");
		dao.updateProduct(vo);
		log.info(vo);
	}
	
	@Test
	public void deleteProduct() {
		
	}
}
