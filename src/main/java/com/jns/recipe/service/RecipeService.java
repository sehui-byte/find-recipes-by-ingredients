package com.jns.recipe.service;

import java.util.List;

import com.jns.recipe.vo.RecipeVO;

public interface RecipeService 
{
	public List<RecipeVO> recipeSelectAll();
	public RecipeVO recipeSelect(RecipeVO rvo);
	public int recipeJsonInsert();
//	public boolean recipeInsert(RecipeVO rvo);
//	public boolean recipeUpdate(RecipeVO rvo);
//	public boolean recipeDelete(RecipeVO rvo);
}
