package com.ezen.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.biz.dao.ProductDAO;
import com.ezen.biz.dto.ProductVO;
import com.ezen.biz.utils.Criteria;
@Service
public class ProductServiceImpl implements ProductService{
	@Autowired
	private ProductDAO dao;
	public void insertProduct(ProductVO vo) {
		dao.insertProduct(vo);
	}

	public List<ProductVO> selectProductList(String subcategory) {
		return dao.selectproductList(subcategory);
	}

	public int selectRowCount() {
		return dao.selectRowCount();
	}

	public List<ProductVO> selectProductList(Criteria cri) {
		return dao.selectProductList(cri);
	}

	public int selectRowCount(Criteria cri) {
		return dao.selectRowCount(cri);
	}

	public ProductVO selectProduct(ProductVO vo) {
		return dao.selectProduct(vo);
	}
	public void updateProduct(ProductVO vo) {
		dao.updateProduct(vo);
	}
	
	public void deleteProduct(int bno) {
		dao.deleteProduct(bno);
	}

	@Override
	public List<ProductVO> selectProductList() {
		return null;
	}
}
