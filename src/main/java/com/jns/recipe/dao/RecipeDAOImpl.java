package com.jns.recipe.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.jns.recipe.vo.RecipeVO;

public class RecipeDAOImpl implements RecipeDAO 
{
	@Autowired(required = false)
	private SqlSession sqlSession;
	
	@Override
	public List<RecipeVO> recipeSelectAll() 
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public RecipeVO recipeSelect(RecipeVO rvo) 
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean recipeInsert(RecipeVO rvo) 
	{
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean recipeUpdate(RecipeVO rvo) 
	{
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean recipeDelete(RecipeVO rvo) 
	{
		// TODO Auto-generated method stub
		return false;
	}
	
}
