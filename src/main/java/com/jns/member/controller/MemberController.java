package com.jns.member.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {

	Logger logger = Logger.getLogger(MemberController.class);

	// login page 보여주는 함수
	// spring security의 검증이 확인되면 이쪽 함수를 탄다
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login() {
		System.out.println("login 입니다 >>>> ");

		return "/login/login";
	}

	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String main() {
		logger.info("main page 진입 >>> ");

		return "main";
	}

	@RequestMapping(value="admin/main", method=RequestMethod.GET)
	public String adminMain() {
		logger.info("admin main page 진입 >>> ");

		return "/admin/admin_main";
	}
	
}