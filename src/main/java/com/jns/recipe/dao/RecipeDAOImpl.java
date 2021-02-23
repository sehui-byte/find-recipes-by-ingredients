package com.jns.recipe.dao;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import org.apache.commons.io.IOUtils;
import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jns.recipe.vo.RecipeVO;

@Repository
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
	
	@Override
	public int recipeJsonInsert(RecipeVO rvo)
	{
		return sqlSession.insert("recipeJsonInsert", rvo);
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
