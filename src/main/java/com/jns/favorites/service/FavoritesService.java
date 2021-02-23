package com.jns.favorites.service;

import java.util.List;

import com.jns.favorites.vo.FavoritesVO;
import com.jns.recipe.vo.RecipeVO;

public interface FavoritesService {
	// 추천 레시피 확인하기
	public int myFavRecipeCheck(FavoritesVO fvo);

	// 레시피 추천하기
	public int myFavRecipeInsert(FavoritesVO fvo);

	// 추천 레시피 취소
	public int myFavRecipeDelete(FavoritesVO fvo);
	
	// 추천 레시피 검색
	public List<RecipeVO> myFavRecipeList(FavoritesVO fvo);
}
