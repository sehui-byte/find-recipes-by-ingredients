package com.jns.member.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jns.member.service.MemberService;
import com.jns.member.vo.MemberVO;

@Controller
public class MemberController {

	Logger logger = Logger.getLogger(MemberController.class);

	private MemberService memberService;

	@Autowired(required = false)
	public MemberController(MemberService memberService) {
		this.memberService = memberService;

	}

	// login page 보여주는 함수
	// spring security의 검증이 확인되면 이쪽 함수를 탄다
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String memberlogin() {
		System.out.println("login 입니다 >>>> ");

		return "/login/login";
	}

	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String main() {
		logger.info("main page 진입 >>> ");

		return "main";
	}

	@RequestMapping(value = "memberInsert", method = RequestMethod.GET)
	public String memberInsert() {
		
		logger.info("memberInsert 진입 >>>> : ");

		return "";
	}
}