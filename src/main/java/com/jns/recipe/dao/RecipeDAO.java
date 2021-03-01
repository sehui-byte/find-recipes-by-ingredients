package com.jns.recipe.dao;

import java.util.List;

import com.jns.recipe.vo.RecipeVO;

public interface RecipeDAO 
{
	public List<RecipeVO> recipeSelectAll();
	public List<RecipeVO> recipeSelectAllPage(RecipeVO rvo);
	public RecipeVO recipeSelect(RecipeVO rvo);
	public int recipeJsonInsert(RecipeVO rvo);
//	public boolean recipeInsert(RecipeVO rvo);
//	public boolean recipeUpdate(RecipeVO rvo);
//	public boolean recipeDelete(RecipeVO rvo);
	public List<RecipeVO> searchRecipe(RecipeVO rvo);
}
