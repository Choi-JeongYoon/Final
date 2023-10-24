package com.ezen.biz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.biz.dto.ProductVO;
import com.ezen.biz.utils.Criteria;

@Repository
public class ProductDAO{
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertProduct(ProductVO vo) {
		mybatis.insert("ProductDAO.insertProduct", vo);
	}
	public List<ProductVO> selectproductList(){
		return mybatis.selectList("ProductDAO.selectProductList");
	}
	public int selectRowCount() {
		return mybatis.selectOne("ProductDAO.selectRowCount");
	}
	public List<ProductVO> selectProductList(Criteria cri){
		return mybatis.selectList("ProductDAO.selectProductListPaging", cri);
	}
	public int selectRowCount(Criteria cri) {
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
}
