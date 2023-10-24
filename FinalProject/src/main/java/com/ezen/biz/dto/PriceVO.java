package com.ezen.biz.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class PriceVO {
	private int pinum,pnum,price;
	private String picompa,pipage;
	private Date regdate;
	private String filename;
}
