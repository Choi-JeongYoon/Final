package com.ezen.biz.dto;

import java.util.List;

import lombok.Data;
//테이블의 일부 카테고리 작업을 위해서 만든 클래스 Mybatis ResultType과 연동

@Data
public class McateInfo {
	private String ptype1;
	//메뉴에서 보여주기 위해서 추가한 필드
	private List<String> ptype2;
}
