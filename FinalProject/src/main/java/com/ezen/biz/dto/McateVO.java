package com.ezen.biz.dto;

import java.util.List;

import lombok.Data;

@Data
public class McateVO {
	private int mseq;
	private String mname;
	
	private List<ScateVO> subCateList;
}
