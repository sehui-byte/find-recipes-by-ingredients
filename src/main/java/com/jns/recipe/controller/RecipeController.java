package com.jns.recipe.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jns.recipe.service.RecipeService;
import com.jns.recipe.vo.RecipeVO;

@Controller
public class RecipeController 
{
	private RecipeService recipeService;
	private Logger logger = Logger.getLogger(RecipeController.class);
	
	public RecipeController() 
	{
	
	}//Default Constructor
	
	@Autowired(required = false)
	public RecipeController(RecipeService recipeServce) 
	{
		this.recipeService = recipeServce;
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "recipeList")
	public String recipeList(Model model)
	{
		logger.info("[RecipeController] recipeList() 호출");
		model.addAttribute("list", recipeService.recipeSelectAll());
		return "recipe/recipeList";
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "recipeDetail")
	public String recipeDetail(RecipeVO rvo, Model model)
	{
		logger.info("[RecipeController] recipeDetail() 호출");
		logger.info("rcp_seq >>> : " + rvo.getRcp_seq());
		logger.info("recipeService.recipeSelect(rvo) >>> : " + recipeService.recipeSelect(rvo));
		model.addAttribute("data", recipeService.recipeSelect(rvo));
		
		return "recipe/recipeDetail";
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "recipeSelectAll")
	@ResponseBody
	public List<RecipeVO> recipeSelectAll()
	{
		System.out.println("[RecipeController] recipeSelectAll() >>> : 진입");
		logger.info("[RecipeController] recipeSelectAll() >>> : 진입");
		return recipeService.recipeSelectAll();
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "recipeSelect")
	@ResponseBody
	public RecipeVO recipeSelect(RecipeVO rvo)
	{
		logger.info("[RecipeController] recipeSelect() rvo >>> : " + rvo.toString());
		return recipeService.recipeSelect(rvo);
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "recipeJsonInsert")
	@ResponseBody
	public HashMap<String, Integer> recipeJsonInsert()
	{
		HashMap<String, Integer> result = new HashMap<String, Integer>();
		result.put("cnt", recipeService.recipeJsonInsert());
		return result;
	}

	
//	public String recipeInsert(RecipeVO rvo)
//	{
//		return null;
//	}
//	
//	public String recipeUpdate(RecipeVO rvo)
//	{
//		return null;
//	}
//	
//	public String recipeDelete(RecipeVO rvo)
//	{
//		return null;
//	}
}
