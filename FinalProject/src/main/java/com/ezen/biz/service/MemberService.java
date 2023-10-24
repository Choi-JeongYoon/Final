package com.ezen.biz.service;

import java.util.List;

import com.ezen.biz.dto.MemberVO;

public interface MemberService {

	//MemberDAO.insertMember  -> namespace,query문 id 
	void insertMember(MemberVO vo);

	MemberVO selectMember(String userid);

	List<MemberVO> selectMemberList();

}