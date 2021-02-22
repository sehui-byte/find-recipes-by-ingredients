package com.jns.favorites.service;

import com.jns.favorites.vo.FavoritesVO;

public interface FavoritesService {
	// 추천 레시피 확인하기
	public int myFavRecipeCheck(FavoritesVO fvo);

	// 레시피 추천하기
	public int myFavRecipeInsert(FavoritesVO fvo);
	
	// 추천 레시피 제거
	public int myFavRecipeDelete(FavoritesVO fvo);

}
