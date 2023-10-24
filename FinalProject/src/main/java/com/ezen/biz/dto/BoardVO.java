package com.ezen.biz.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardVO {
	private String id,type,title,content,img,saveimg;
	private int bnum,bview,bsym,bdlike;
	private Date regdate;
}
