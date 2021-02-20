package com.jns.myinfo.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jns.board.vo.BoardVO;
import com.jns.member.vo.MemberVO;
import com.jns.myinfo.service.MyinfoService;
import com.jns.recipeboard.vo.RecipeBoardVO;

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
		logger.info("name >>> " + mvo.getKeyword());
		logger.info("keyfilter >>> " + mvo.getKeyfilter());
		logger.info("startdate >>> " + mvo.getStartdate());
		logger.info("enddate >>> " + mvo.getEnddate());

		List<RecipeBoardVO> list = myinfoService.myRecipeList(mvo);
		int result = list.size();

		logger.info("result >>> " + result);

		if (result > 0) {

			model.addAttribute("myRecipeList", list);

		} else {

		}

		return "myinfo/myRecipeList";

	}

	@RequestMapping(value = "myinfo/myRecipeDelete", method = RequestMethod.POST)
	@ResponseBody
	public String myRecipeDelete(RecipeBoardVO rbvo) {

		logger.info("myRecipeDelete() 진입 >>> ");

		logger.info("rbno >>> " + rbvo.getRbno());

		int result = myinfoService.myRecipeDelete(rbvo);

		logger.info(result);

		if (result == 1) {
			return "OK";
		} else {
			return "ERROR";
		}

	}

	@RequestMapping(value = "myinfo/myQnAList", method = RequestMethod.GET)
	public String myQnAList(MemberVO mvo, Model model) {

		logger.info("myQnAList() 진입 >>> ");

		logger.info("mno >>> " + mvo.getMno());

		List<BoardVO> list = myinfoService.myQnAList(mvo);

		int result = list.size();

		logger.info(result);

		if (result > 0) {
			model.addAttribute("myQnAList", list);
		}

		return "myinfo/myQnAList";

	}

	@RequestMapping(value = "myinfo/myQnADelete", method = RequestMethod.POST)
	@ResponseBody
	public String myQnADelete(BoardVO bvo) {

		logger.info("myQnADelete() 진입 >>> ");

		logger.info("bno >>> " + bvo.getBno());

		int result = myinfoService.myQnADelete(bvo);
		logger.info(result);
		if (result == 1) {
			return "OK";
		} else {
			return "ERROR";
		}

	}

	@RequestMapping(value="myinfo/myRankUpdate", method=RequestMethod.GET)
	public String myRankUpdate(BoardVO bvo) {

		logger.info("myRankUpdate() 진입 >>> ");
	
		return "";
	}
	
	
}
