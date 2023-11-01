package com.ezen.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.biz.dao.CateDAO;
import com.ezen.biz.dto.McateInfo;
import com.ezen.biz.dto.McateVO;
import com.ezen.biz.dto.ScateInfo;
import com.ezen.biz.dto.ScateVO;
@Service
public class CateServiceImpl implements CateService{
	@Autowired
	private CateDAO dao;
	@Override
	public List<McateVO> selectCate() {	
		return dao.selectCate();
	}

	@Override
	public List<McateInfo> selectProductMCateList() {
		return dao.selectProductMCateList();
	}
	@Override
	public List<ScateInfo> selectProductSCateList() {
		return dao.selectProductSCateList();
	}

}
