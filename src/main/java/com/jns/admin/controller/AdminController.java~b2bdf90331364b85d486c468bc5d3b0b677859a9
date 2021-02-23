package com.jns.admin.controller;


import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jns.member.service.MemberService;
import com.jns.member.vo.MemberVO;

@Controller
public class AdminController {
	
	Logger logger = Logger.getLogger(AdminController.class);
	
	private MemberService memberService;

	
	public AdminController() {
	
	}

	@RequestMapping(value = "admin/main", method = RequestMethod.GET)
	public String adminMain() {
		logger.info("admin main page 진입 >>> ");

		return "/admin/admin_main";
	}
	

}
