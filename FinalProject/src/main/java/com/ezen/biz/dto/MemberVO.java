package com.ezen.biz.dto;

import java.sql.Date;

import lombok.Data;
@Data
public class MemberVO {
	private String id, pwd, email, nickname,role,enabled;
	private Date regdate;

}
