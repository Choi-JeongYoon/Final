package com.ezen.biz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.biz.dto.McateInfo;
import com.ezen.biz.dto.McateVO;
import com.ezen.biz.dto.ScateInfo;
import com.ezen.biz.dto.ScateVO;

@Repository
public class CateDAO{
	@Autowired
	private SqlSessionTemplate mybatis;
	// 카테고리 메뉴 보여주기
	public List<McateVO> selectCate(){
		return mybatis.selectList("CategoryDAO.selectCate");
	}
	// 제품 입력시 : 카테고리선택(카테고리를 제품 테이블에 같이 넣어놓은 경우)
	public List<McateInfo> selectProductMCateList(){
		return mybatis.selectList("CategoryDAO.selectProductMCateList");
	}
	public List<ScateInfo> selectProductSCateList(){
		return mybatis.selectList("CategoryDAO.selectProductSCateList");
	}
}
