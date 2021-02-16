package com.jns.recipe.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jns.recipe.service.RecipeService;
import com.jns.recipe.vo.RecipeVO;

@Controller
public class RecipeController 
{
	private RecipeService recipeService;
	
	public RecipeController() 
	{
	
	}//Default Constructor
	
	@Autowired(required = false)
	public RecipeController(RecipeService recipeServce) 
	{
		this.recipeService = recipeServce;
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "recipeSelectAll")
	@ResponseBody
	public List<RecipeVO> recipeSelectAll()
	{	
		return null;
	}
	
	public String recipeSelect(RecipeVO rvo)
	{
		return null;
	}
	
	public String recipeInsert(RecipeVO rvo)
	{
		return null;
	}
	
	public String recipeUpdate(RecipeVO rvo)
	{
		return null;
	}
	
	public String recipeDelete(RecipeVO rvo)
	{
		return null;
	}
}
