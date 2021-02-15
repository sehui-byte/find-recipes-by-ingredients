package com.jns.myinfo.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MyinfoController {

	Logger logger = Logger.getLogger(MyinfoController.class);
	
	@RequestMapping(value="myinfo", method=RequestMethod.GET)
	public String myinfoPage() {
		logger.info("myinfoPage() 진입 >>> ");

		return "myinfo/main";
	}
}
