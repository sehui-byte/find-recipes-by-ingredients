package com.jns.recipeboard.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jns.chabun.service.ChabunService;
import com.jns.common.DateFormatUtil;
import com.jns.recipe.service.RecipeService;
import com.jns.recipeboard.service.RecipeBoardService;
import com.jns.recipeboard.vo.RecipeBoardVO;

@Controller
public class RecipeBoardController 
{
	private RecipeBoardService recipeBoardService;
	private ChabunService chabunService;
	private Logger logger = Logger.getLogger(RecipeBoardController.class);
	
	public RecipeBoardController() 
	{

	}//Default Constructor
	
	@Autowired(required = false)
	public RecipeBoardController(RecipeBoardService recipeBoardService, ChabunService chabunService) 
	{
		this.recipeBoardService = recipeBoardService;
		this.chabunService = chabunService;
	}//생성자
	
	//================================= move =================================//
	@RequestMapping(value = "recipeboard", method = RequestMethod.GET)
	public String recipeboard(Model model)
	{
		logger.info("[RecipeBoardController] recipeboard.do 호출됨");
		model.addAttribute("list", recipeBoardService.recipeBoardSelectAll());
		return "recipeboard/recipeboard";
	}//레시피 게시판으로 이동
	
	@RequestMapping(value = "rbwriteform", method = RequestMethod.GET)
	public String rbwriteform()
	{
		logger.info("[RecipeBoardController] rbwriteform.do 호출됨");
		return "recipeboard/recipeboard_writeform";
	}//레시피 게시판 글쓰기 폼으로 이동
	
	@RequestMapping(value = "rbupdateform", method = RequestMethod.GET)
	public String rbupdateform(RecipeBoardVO rbvo, Model model)
	{
		return "recipeboard/recipeboard";
	}
	
	//================================= ISUD =================================//
	@RequestMapping(value = "rbwrite", method = RequestMethod.POST)
	public String rbwrite(RecipeBoardVO rbvo, Model model)
	{
		logger.info("[RecipeBoardController] rbwrite.do 호출됨");
		String no = chabunService.getRecipeBoardChabun().getRbno();
		String rbno = "RB" + DateFormatUtil.ymdFormat() + no;
		rbvo.setRbno(rbno);
		logger.info("rbvo >>> : " + rbvo.toString());
		
		//파일 업로드 처리해야함.......
		
		model.addAttribute("list", recipeBoardService.recipeBoardSelectAll());
		return "recipeboard/recipeboard";
	}
	
	@RequestMapping(value = "rbupdate", method = RequestMethod.POST)
	public String rbupdate(RecipeBoardVO rbvo, Model model)
	{
		//update code
		
		model.addAttribute("list", recipeBoardService.recipeBoardSelectAll());
		return "recipeboard/recipeboard";
	}
	
	//================================= Ajax =================================//
	@RequestMapping(value = "recipeBoardSelectAll", method = RequestMethod.GET)
	@ResponseBody
	public List<RecipeBoardVO> recipeBoardSelectAll()
	{
		return recipeBoardService.recipeBoardSelectAll();
	}
	
	@RequestMapping(value = "recipeBoardSelect", method = RequestMethod.GET)
	@ResponseBody
	public RecipeBoardVO recipeBoardSelect(RecipeBoardVO rbvo)
	{
		return recipeBoardService.recipeBoardSelect(rbvo);
	}
	
	@RequestMapping(value = "recipeBoardInsert", method = RequestMethod.GET)
	@ResponseBody
	public boolean recipeBoardInsert(RecipeBoardVO rbvo)
	{
		return recipeBoardService.recipeBoardInsert(rbvo);
	}
	
	@RequestMapping(value = "recipeBoardUpdate", method = RequestMethod.GET)
	@ResponseBody
	public boolean recipeBoardUpdate(RecipeBoardVO rbvo)
	{
		return recipeBoardService.recipeBoardUpdate(rbvo);
	}
		
	@RequestMapping(value = "recipeBoardDelete", method = RequestMethod.GET)
	@ResponseBody
	public boolean recipeBoardDelete(RecipeBoardVO rbvo)
	{
		return recipeBoardService.recipeBoardDelete(rbvo);
	}
}
