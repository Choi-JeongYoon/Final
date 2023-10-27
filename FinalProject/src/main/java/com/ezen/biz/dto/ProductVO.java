package com.ezen.biz.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class ProductVO {
	private int pnum,pinum;
	private String ptype1,ptype2,ptype3,ptype4,ptype5,ptype6,ptype7
	,pname,pcompa,pcontent,useitem;
	private Date preg;
	private String pimg1,pimg2,psavimg;
	private String filename;
}
