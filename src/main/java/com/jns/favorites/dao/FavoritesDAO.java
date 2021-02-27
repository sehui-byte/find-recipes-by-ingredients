package com.jns.favorites.dao;

import java.util.List;

import com.jns.favorites.vo.FavoritesVO;
import com.jns.recipeboard.vo.RecipeBoardVO;

public interface FavoritesDAO {
	// 추천 레시피 확인하기
	public int myFavRecipeCheck(FavoritesVO fvo);

	// 추천 레시피 삽입
	public int myFavRecipeInsert(FavoritesVO fvo);

	// 추천 레시피 제거
	public int myFavRecipeDelete(FavoritesVO fvo);
	
	
}
