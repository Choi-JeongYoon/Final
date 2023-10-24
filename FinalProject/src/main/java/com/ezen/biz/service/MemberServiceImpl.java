package com.ezen.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.biz.dao.MemberDAO;
import com.ezen.biz.dto.MemberVO;
@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO dao;
	public void insertMember(MemberVO vo) {
		dao.insertMember(vo);
	}
	public MemberVO selectMember(String userid) {
		return dao.selectMember(userid);
	}
	public List<MemberVO> selectMemberList() {
		return dao.selectMemberList();
	}

}
