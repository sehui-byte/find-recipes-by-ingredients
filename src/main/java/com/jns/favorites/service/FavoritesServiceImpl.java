package com.jns.favorites.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jns.favorites.dao.FavoritesDAO;
import com.jns.favorites.vo.FavoritesVO;
import com.jns.recipe.vo.RecipeVO;

@Service
@Transactional
public class FavoritesServiceImpl implements FavoritesService {

	Logger logger = Logger.getLogger(FavoritesServiceImpl.class);

	private FavoritesDAO favoritesDAO;

	@Autowired(required = false)
	public FavoritesServiceImpl(FavoritesDAO favoritesDAO) {
		this.favoritesDAO = favoritesDAO;

	}

	@Override
	public int myFavRecipeCheck(FavoritesVO fvo) {
		logger.info("myFavRecipeCheck() 진입 >>> ");

		return favoritesDAO.myFavRecipeCheck(fvo);
	}

	@Override
	public int myFavRecipeInsert(FavoritesVO fvo) {
		logger.info("myFavRecipeInsert() 진입 >>> ");

		return favoritesDAO.myFavRecipeInsert(fvo);
	}

	@Override
	public int myFavRecipeDelete(FavoritesVO fvo) {
		logger.info("myFavRecipeDelete() 진입 >>> ");

		return favoritesDAO.myFavRecipeDelete(fvo);
	}

	@Override
	public List<RecipeVO> myFavRecipeList(FavoritesVO fvo) {
		logger.info("myFavRecipeList() 진입 >>> ");

		return favoritesDAO.myFavRecipeList(fvo);
	}
}
