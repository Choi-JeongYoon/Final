package com.ezen.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.biz.dao.ProductDAO;
import com.ezen.biz.dto.McateInfo;
import com.ezen.biz.dto.ProductVO;
import com.ezen.biz.dto.ScateInfo;
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

	public List<ProductVO> selectProductList(Criteria cri) {
		return dao.selectProductList(cri);
	}

	
	public List<ProductVO> selectProductListPaging(Criteria cri){
		return dao.selectProductListPaging(cri);
	}


	public int selectRowCount() {
		return dao.selectRowCount();
	}

	
	public int selectRowCount(Criteria cri) {
		return dao.selectRowCount(cri);
	}

	public int selectRowCountPaging(Criteria cri){
		return dao.selectRowCountPaging(cri);
	}

	public List<ProductVO> selectProductList() {
		return null;
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
	public List<McateInfo> selectProductMCateList() {
		return dao.selectProductMCateList();
	}
	@Override
	public List<ScateInfo> selectProductSCateList() {
		return dao.selectProductSCateList();
	}
	@Override
	public List<McateInfo> selectProductMenu() {
		return dao.selectProductMenu();
	}


	
}
