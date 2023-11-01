package com.ezen.biz.service;

import java.util.List;

import com.ezen.biz.dto.ProductVO;
import com.ezen.biz.utils.Criteria;

public interface ProductService {

	void insertProduct(ProductVO vo);

	List<ProductVO> selectProductList();

	int selectRowCount();

	List<ProductVO> selectProductList(String subcategory);

	int selectRowCount(Criteria cri);

	ProductVO selectProduct(ProductVO vo);

	void updateProduct(ProductVO vo);
	
	void deleteProduct(int bno);
}