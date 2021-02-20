package com.jns.chef.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jns.chabun.service.ChabunService;
import com.jns.chef.service.ChefService;
import com.jns.chef.vo.ChefVO;
import com.jns.common.ChabunUtil;

@Controller
public class ChefController {
	Logger logger = Logger.getLogger(ChefController.class);
		
	private ChefService chefService;
	private ChabunService chabunService;
	
	@Autowired(required=false)
	public ChefController(ChefService chefService
						 ,ChabunService chabunService) {
		this.chefService = chefService;
		this.chabunService = chabunService;
	}
	
	// 테스트
	@RequestMapping(value="chef/test", method=RequestMethod.GET)
	public String test() {
		return "chef/test";
	}
	
	/********************************************************************************************
	* 세프 등록
	********************************************************************************************/
	@RequestMapping(value="chef/chefinsert", method=RequestMethod.POST)
	public String chefInsert(ChefVO cvo) {
		logger.info("[ChefController] >> chefinsert 호출 성공");
		logger.info("[ChefController] >> chefinsert >> cvo.getMno()>>> :" + cvo.getMno());
		
		int nCnt = 0;
		String url = "";
		
		// 채번 setting
		String ino = ChabunUtil.getChefChabun("D", chabunService.getChefChabun().getIno());
		logger.info("[ChefController] >> chefInsert >> ino >>> : " + ino);
		cvo.setIno(ino);
		
		nCnt = chefService.chefInsert(cvo);
		logger.info("[chefC] >> boardUpdate >> nCnt >>> : " + nCnt);
		
		if(nCnt == 1) {
			url = "/chef/test.do";
		}
		
		return "redirect:" + url;
	}
	
	
	/********************************************************************************************
	* 세프 전체 조회
	********************************************************************************************/
	
	
	/********************************************************************************************
	* 세프 삭제
	********************************************************************************************/
	
	
	
}
