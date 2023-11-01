package com.ezen.biz.service;

import java.util.List;

import com.ezen.biz.dto.McateInfo;
import com.ezen.biz.dto.McateVO;
import com.ezen.biz.dto.ScateInfo;
import com.ezen.biz.dto.ScateVO;

public interface CateService {

	List<McateVO> selectCate();
	
	List<McateInfo> selectProductMCateList();
	List<ScateInfo> selectProductSCateList();
}