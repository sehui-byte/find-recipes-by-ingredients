package com.jns.chef.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jns.chabun.service.ChabunService;
import com.jns.chef.service.ChefService;
import com.jns.chef.vo.ChefVO;
import com.jns.common.ChabunUtil;
import com.jns.common.Paging;
import com.jns.myinfo.service.MyinfoService;
import com.jns.recipeboard.vo.RecipeBoardVO;

@Controller
public class ChefController {
	Logger logger = Logger.getLogger(ChefController.class);
		
	private ChefService chefService;
	private ChabunService chabunService;
	private MyinfoService myinfoService;
	
	@Autowired(required=false)
	public ChefController(ChefService chefService
						 ,ChabunService chabunService
						 ,MyinfoService myinfoService) {
		this.chefService = chefService;
		this.chabunService = chabunService;
		this.myinfoService = myinfoService;
	}
	
	// 테스트
	@RequestMapping(value="chef/test", method=RequestMethod.GET)
	public String test() {
		return "chef/test";
	}
	
	/********************************************************************************************
	* 세프 등록 >> url을 없애고 MyinfoController에 셰프 레벨 등업시 호출하도록 로직을 변경
	********************************************************************************************/
	//@RequestMapping(value="chef/chefinsert", method=RequestMethod.POST)
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
			//url = "/chef/test.do";
			return "OK";
		}
		
		//return "redirect:" + url;
		return "ERROR";
	}
	
	
	/********************************************************************************************
	* 세프 전체 조회
	********************************************************************************************/
	@RequestMapping(value="chef/chefselectall", method=RequestMethod.GET)
	public String chefSelectAll(ChefVO cvo, Model model) {
		logger.info("[ChefController] >> chefSelectAll 호출 성공");
		
		//페이징
		
		List<ChefVO> listChef = chefService.chefSelectAll(cvo);
		
		model.addAttribute("listChef", listChef);
		logger.info("[ChefController] >> chefSelectAll listChef.size() >>> : " + listChef.size());
		
		return "chef/chefselectall";
	}
	
	
	/********************************************************************************************
	* 세프 조회
	********************************************************************************************/
	@RequestMapping(value="chef/chefselect", method=RequestMethod.GET)
	public String chefSelect(ChefVO cvo, RecipeBoardVO rbvo, Model model, HttpServletRequest request) {
		logger.info("[ChefController] >> chefSelect 호출 성공");
		logger.info("[ChefController] >> chefSelect >> cvo.getMno()>>> :" + cvo.getMno());
		
		rbvo.setMno(cvo.getMno());
		logger.info("[ChefController] >> chefSelect >> rbvo.getMno()>>> :" + rbvo.getMno());
		
		List<ChefVO> list = chefService.chefSelect(cvo);
		logger.info("[ChefController] >> chefSelect list.size() >>> : " + list.size());
		
		int totalCnt = 0;
		String cPage = request.getParameter("curPage");
		String pageCtrl = request.getParameter("pageCtrl");

		Paging.setPage(rbvo, cPage, pageCtrl); // 페이징할 정보를 Paging클래스에 보내줍니다

		List<RecipeBoardVO> chefRecipeList = myinfoService.myRecipeListPage(rbvo);
		logger.info("[ChefController] >> chefSelect chefRecipeList.size() >>> : " + chefRecipeList.size());

		if (chefRecipeList.size() != 0) {
			totalCnt = chefRecipeList.get(0).getTotalCount(); // 쿼리 조회한 리스트의 0번 인덱스에 담긴 totalCount값
			rbvo.setTotalCount(totalCnt); // vo에 담기
		}
		
		if(list.size() == 1) {
			model.addAttribute("list", list);
			model.addAttribute("chefRecipeList", chefRecipeList);
			model.addAttribute("p_rbvo", rbvo);
			return "chef/chefselect";
		}
		
		return "chef/chefselectall";
	}
	
	
	/********************************************************************************************
	* 세프 삭제
	********************************************************************************************/
	@RequestMapping(value="chef/chefdelete", method=RequestMethod.POST)
	public String chefDelete(ChefVO cvo) {
		logger.info("[ChefController] >> chefDelete 호출 성공");
		logger.info("[ChefController] >> chefDelete >> cvo.getIno() >>> : " + cvo.getIno());
		
		int nCnt = 0;
		String url = "";		
		
		nCnt = chefService.chefDelete(cvo);
		logger.info("[ChefController] >> chefDelete >> nCnt >>> : " + nCnt);
		
		if (nCnt ==1 ) {
			url = "/chef/test.do";
		}
		
		return "redirect:" + url;
	}

}
