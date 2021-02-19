package com.jns.myinfo.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jns.member.vo.MemberVO;
import com.jns.myinfo.service.MyinfoService;
import com.jns.recipe.vo.RecipeVO;

@Controller
public class MyinfoController {

	Logger logger = Logger.getLogger(MyinfoController.class);

	private MyinfoService myinfoService;

	@Autowired(required = false)
	public MyinfoController(MyinfoService myinfoService) {
		this.myinfoService = myinfoService;

	}

	@RequestMapping(value = "myinfo", method = RequestMethod.GET)
	public String myinfoPage() {
		logger.info("myinfoPage() 진입 >>> ");

		return "myinfo/myinfo_main";
	}

	@RequestMapping(value = "myinfo/myRecipeList", method = RequestMethod.GET)
	public String myRecipeList(MemberVO mvo, Model model) {
		logger.info("myRecipeList() 진입 >>> ");

		logger.info("mno >>> " + mvo.getMno());

		List<RecipeVO> list = myinfoService.myRecipeList(mvo);
		int result = list.size();

		logger.info("result >>> " + result);

		if (result > 0) {

			model.addAttribute("myRecipeList", list);

		} else {

		}

		return "myinfo/myRecipeList";

	}

	@RequestMapping(value = "myinfo/myQnAList", method = RequestMethod.GET)
	public String myQnAList(MemberVO mvo, Model model) {

		logger.info("myQnAList() 진입 >>> ");

		logger.info("mno >>> " + mvo.getMno());
		
		List<BoardVO> list = myinfoService.myQnAList(mvo);

		return "";

	}
}
