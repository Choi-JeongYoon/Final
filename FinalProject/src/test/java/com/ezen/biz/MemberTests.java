package com.ezen.biz;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ezen.biz.dao.MemberDAO;
import com.ezen.biz.dto.MemberVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class MemberTests {
	@Autowired
	private MemberDAO dao;
	@Autowired
	private PasswordEncoder encoder;
	//삽입 테스트 메소드
	@Test
	public void insertMTest() {
		//MemberVO 객체 생성, 패스워드 암호화 저장
//		MemberVO vo=new MemberVO();
//		vo.setId("hong");
//		vo.setNickname("홍길동");
//		vo.setPwd(encoder.encode("hong"));
//		vo.setEmail(null);
//		vo.setRole("CUSTOMER");
//		dao.insertMember(vo);
		MemberVO vo=new MemberVO();
		vo.setId("hongadmin");
		vo.setNickname("홍길동admin");
		vo.setPwd(encoder.encode("hongadmin"));
		vo.setEmail(null);
		vo.setRole("ADMIN");
		dao.insertMember(vo);
	
	}
	
	@Test
	public void selectMemberTest() {
		//로그인 기능
		MemberVO vo=new MemberVO();
		vo=dao.selectMember("hong4");
		log.info("vo:"+vo);	
		if(vo!=null)
			if(encoder.matches("hong4", vo.getPwd())) {
				log.info("로그인 성공");
			}else log.info("로그인 실패:비밀번호 다름");
		else log.info("로그인 실패:없는 아이디");
	}
	
	
	@Test
	public void selectMemberAll() {
		List<MemberVO> list=dao.selectMemberList();
		for(MemberVO vo:list)
			log.info(vo);
	}
	
	
}
