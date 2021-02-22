package com.jns.favorites.dao;

import com.jns.favorites.vo.FavoritesVO;

public interface FavoritesDAO {
	// 추천 레시피 확인하기
	public int myFavRecipeCheck(FavoritesVO fvo);

	// 추천 레시피 삽입
	public int myFavRecipeInsert(FavoritesVO fvo);

	// 추천 레시피 제거
	public int myFavRecipeDelete(FavoritesVO fvo);
}
