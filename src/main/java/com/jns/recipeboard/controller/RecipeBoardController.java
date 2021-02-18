package com.jns.recipeboard.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jns.recipe.service.RecipeService;
import com.jns.recipeboard.service.RecipeBoardService;
import com.jns.recipeboard.vo.RecipeBoardVO;

@Controller
public class RecipeBoardController 
{
	private RecipeBoardService recipeBoardService;
	private Logger logger = Logger.getLogger(RecipeBoardController.class);
	
	public RecipeBoardController() 
	{

	}//Default Constructor
	
	@Autowired(required = false)
	public RecipeBoardController(RecipeBoardService recipeBoardService) 
	{
		this.recipeBoardService = recipeBoardService;
	}
	
	@RequestMapping(value = "recipeboard", method = RequestMethod.GET)
	public String recipeboard(Model model)
	{
		return "recipeboard/recipeboard";
	}
	
	@RequestMapping(value = "recipeboardSelectAll")
	@ResponseBody
	public List<RecipeBoardVO> recipeBoardSelectAll()
	{
		return recipeBoardService.recipeBoardSelectAll();
	}
	
	@RequestMapping(value = "recipeboardSelect")
	@ResponseBody
	public RecipeBoardVO recipeBoardSelect(RecipeBoardVO rbvo)
	{
		return recipeBoardService.recipeBoardSelect(rbvo);
	}
//	public boolean recipeBoardInsert();
//	public boolean recipeBoardUpdate();
//	public boolean recipeBoardDelete();
}
