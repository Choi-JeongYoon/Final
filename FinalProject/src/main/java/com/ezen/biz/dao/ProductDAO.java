package com.ezen.biz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.biz.dto.McateInfo;
import com.ezen.biz.dto.ProductVO;
import com.ezen.biz.dto.ScateInfo;
import com.ezen.biz.utils.Criteria;

@Repository
public class ProductDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	public void insertProduct(ProductVO vo) {
		mybatis.insert("ProductDAO.insertProduct", vo);
	}

	public List<ProductVO> selectproductList(String subcategory) {
		return mybatis.selectList("ProductDAO.selectProductList", subcategory);
	}

	public List<ProductVO> selectProductListPaging(Criteria cri) {
		return mybatis.selectList("ProductDAO.selectProductListPaging", cri);
	}

	public List<ProductVO> selectProductList(Criteria cri) {
		return mybatis.selectList("ProductDAO.selectProductListPaging", cri);
	}

	public int selectRowCount() {
		return mybatis.selectOne("ProductDAO.selectRowCount");
	}

	public int selectRowCount(Criteria cri) {
		return mybatis.selectOne("ProductDAO.selectRowCount", cri);
	}

	public int selectRowCountPaging(Criteria cri) {
		return mybatis.selectOne("ProductDAO.selectRowCountPaging", cri);
	}

	public ProductVO selectProduct(ProductVO vo) {
		return mybatis.selectOne("ProductDAO.selectProduct", vo);
	}

	public void updateProduct(ProductVO vo) {
		mybatis.update("ProductDAO.updateProduct", vo);
	}

	public void deleteProduct(int bno) {
		mybatis.update("ProductDAO.deleteProduct", bno);
	}

	// 제품 입력시 : 카테고리선택(카테고리를 제품 테이블에 같이 넣어놓은 경우)
	public List<McateInfo> selectProductMCateList() {
		return mybatis.selectList("ProductDAO.selectProductMCateList");
	}

	public List<ScateInfo> selectProductSCateList() {
		return mybatis.selectList("ProductDAO.selectProductSCateList");
	}

	public List<McateInfo> selectProductMenu() {
		return mybatis.selectList("ProductDAO.selectProductMenu");
	}

}
