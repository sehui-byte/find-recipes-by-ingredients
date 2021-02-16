package com.jns.recipe.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jns.recipe.dao.RecipeDAO;
import com.jns.recipe.vo.RecipeVO;

@Service
@Transactional
public class RecipeServiceImpl implements RecipeService 
{
	private RecipeDAO recipeDAO;
	private Logger logger = Logger.getLogger(RecipeServiceImpl.class);
	
	public RecipeServiceImpl() 
	{

	}//Default Constructor
	
	@Autowired(required = false)
	public RecipeServiceImpl(RecipeDAO recipeDAO)
	{
		this.recipeDAO = recipeDAO;
	}
	
	@Override
	public List<RecipeVO> recipeSelectAll() 
	{
		System.out.println("[RecipeController] recipeSelectAll() >>> : 진입");
		logger.info("[RecipeController] recipeSelectAll() >>> : 진입");
		return recipeDAO.recipeSelectAll();
	}

	@Override
	public RecipeVO recipeSelect(RecipeVO rvo) {
		// TODO Auto-generated method stub
		return null;
	}

//	@Override
//	public boolean recipeInsert(RecipeVO rvo) {
//		// TODO Auto-generated method stub
//		return false;
//	}
//
//	@Override
//	public boolean recipeUpdate(RecipeVO rvo) {
//		// TODO Auto-generated method stub
//		return false;
//	}
//
//	@Override
//	public boolean recipeDelete(RecipeVO rvo) {
//		// TODO Auto-generated method stub
//		return false;
//	}
	
}
