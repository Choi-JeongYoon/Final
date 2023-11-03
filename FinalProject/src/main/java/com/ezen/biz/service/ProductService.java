package com.ezen.biz.service;

import java.util.List;

import com.ezen.biz.dto.McateInfo;
import com.ezen.biz.dto.ProductVO;
import com.ezen.biz.dto.ScateInfo;
import com.ezen.biz.utils.Criteria;

public interface ProductService {

	void insertProduct(ProductVO vo);

	List<ProductVO> selectProductList();

	int selectRowCount();

	List<ProductVO> selectProductList(String subcategory);

	List<ProductVO> selectProductListPaging(Criteria cri);
	
	int selectRowCount(Criteria cri);

	int selectRowCountPaging(Criteria cri);
	
	ProductVO selectProduct(ProductVO vo);

	void updateProduct(ProductVO vo);
	
	void deleteProduct(int bno);
	

	List<McateInfo> selectProductMCateList();
	
	List<ScateInfo> selectProductSCateList();
	
	List<McateInfo> selectProductMenu();
}