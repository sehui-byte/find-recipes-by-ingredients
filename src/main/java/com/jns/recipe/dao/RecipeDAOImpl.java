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
		return sqlSession.selectList("recipeSelectAll");
	}

	@Override
	public RecipeVO recipeSelect(RecipeVO rvo) 
	{
		return sqlSession.selectOne("recipeSelect", rvo);
	}
//
//	
//	@Override
//	public boolean recipeInsert(RecipeVO rvo) 
//	{
//		return sqlSession.insert("recipeInsert", rvo) > 0;
//	}
//
//	@Override
//	public boolean recipeUpdate(RecipeVO rvo) 
//	{
//		return sqlSession.update("recipeUpdate", rvo) > 0;
//	}
//
//	@Override
//	public boolean recipeDelete(RecipeVO rvo) 
//	{
//		return sqlSession.update("recipeDelete", rvo) > 0;
//	}
	
}
