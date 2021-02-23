package com.jns.admin.controller;


import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController {
	
	Logger logger = Logger.getLogger(AdminController.class);
	
	public AdminController() {
	
	}

	@RequestMapping(value = "admin/main", method = RequestMethod.GET)
	public String adminMain() {
		logger.info("admin main page 진입 >>> ");

		return "/admin/admin_main";
	}
	

}
