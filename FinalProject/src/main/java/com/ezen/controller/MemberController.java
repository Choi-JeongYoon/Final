package com.ezen.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezen.biz.dto.BoardVO;
import com.ezen.biz.dto.MemberVO;
import com.ezen.biz.service.MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MemberController {
	@Autowired
	private PasswordEncoder encoder;	
	@Autowired
	private MemberService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {		
		return "home";
	}
	
	@GetMapping("login")
	public String login() {
		return "member/login";
	}
	@PostMapping("login")
	public String login(MemberVO vo,Model model
			,HttpServletRequest request) {
		MemberVO v=service.selectMember(vo.getId());
		log.info("post login");
		if(v==null) {
			model.addAttribute("error", "없는 아이디 입니다.");
			return "member/login";
		}else {//패스워드 일치 확인
			if(encoder.matches(vo.getPwd(), v.getPwd())) {
				//로그인 성공 --> 세션에 담기
				HttpSession session=request.getSession();
				session.setAttribute("id", v.getId());
				session.setAttribute("name", v.getNickname());
				session.setAttribute("role", v.getRole());
				return "forward:productList";
			}else {
				model.addAttribute("error", "패스워드가 다릅니다.");
				return "member/login";
			}
		}
	}
	@RequestMapping("logout")
	public String logout(HttpServletRequest request) {
		request.getSession().invalidate();
		return "forward:productList";
	}
	
	@GetMapping("register")
	public String register() {
		return "member/register";
	}
	
	@PostMapping("register")
	public String register(MemberVO vo) {
		//db에 삽입작업-비밀번호 암호화 후
		log.info(vo);  //vo안넘어오고
		//비밀번호 암호화
		vo.setPwd(encoder.encode(vo.getPwd()));
		//일반회원가입 페이지 : 등급 ROLE_MEMBER 설정
		vo.setRole("role_member");
		//db삽입
		service.insertMember(vo);
		return "member/login";
	}
	
	@GetMapping("home")
	public String home(BoardVO bvo) {
		return "home";
	}
	
}
