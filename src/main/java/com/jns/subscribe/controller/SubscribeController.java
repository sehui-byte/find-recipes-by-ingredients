package com.jns.subscribe.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jns.chabun.service.ChabunService;
import com.jns.common.ChabunUtil;
import com.jns.subscribe.service.SubscribeService;
import com.jns.subscribe.vo.SubscribeVO;

@Controller
public class SubscribeController {
	Logger logger = Logger.getLogger(SubscribeController.class);
	
	private SubscribeService subscribeService;
	private ChabunService chabunService;
	
	@Autowired(required=false)
	public SubscribeController(SubscribeService subscribeService
							  ,ChabunService chabunService) {
		this.subscribeService = subscribeService;
		this.chabunService = chabunService;
	}
	
	// 테스트
	@RequestMapping(value="subscribe/test", method=RequestMethod.GET)
	public String test() {
		return "subscribe/test";
	}
	
	
	/********************************************************************************************
	* 구독 하기
	********************************************************************************************/
	@ResponseBody
	@RequestMapping(value="subscribe/subinsert", method=RequestMethod.POST)
	public String subInsert(SubscribeVO svo) {
		logger.info("[SubscribeC] >> subInsert 호출 성공");
		logger.info("[SubscribeC] >> subInsert >> mno >>> : " + svo.getMno());
		logger.info("[SubscribeC] >> subInsert >> ino >>> : " + svo.getIno());
		
		// 채번 setting
		String sno = ChabunUtil.getSubinfoChabun("D", chabunService.getSubscribeChabun().getSno());
		logger.info("[SubscribeC] >> subInsert >> mno >>> : " + sno);
		svo.setSno(sno);
		
		int result = subscribeService.subInsert(svo);
		logger.info("ReplyC >> replyInsert >> result >>> : " + result);
		
		if (1 == result) { return "GOOD"; }
		else{ return "BAD"; }
	}
	
	
	/********************************************************************************************
	* 내 구독 리스트 확인하기
	********************************************************************************************/
	@RequestMapping(value="subscribe/mysublist", method=RequestMethod.POST)
	public String mySubLinst(SubscribeVO svo, Model model) {
		logger.info("[SubscribeC] >> mySubLinst 호출 성공");
		logger.info("[SubscribeC] >> mySubLinst >> mno >>> : " + svo.getMno());
		
		List<SubscribeVO> subList = subscribeService.mySubList(svo);
		
		model.addAttribute("subList", subList);
		logger.info("[ChefController] >> chefSelectAll listChef.size() >>> : " + subList.size());
		
		return "subscribe/mysublist";
	}
	
}
