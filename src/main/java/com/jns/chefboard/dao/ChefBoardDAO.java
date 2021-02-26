package com.jns.chefboard.dao;

import java.util.List;

import com.jns.chefboard.vo.ChefBoardVO;
import com.jns.favorites.vo.FavoritesVO;
import com.jns.recipeboard.vo.RecipeBoardVO;

public interface ChefBoardDAO {

	public List<ChefBoardVO> chefBoardSelectAll(ChefBoardVO cbvo);
	public List<ChefBoardVO> chefBoardSelect(ChefBoardVO cbvo);
	public int boardInsert(ChefBoardVO cbvo);
	public int boardUpdate(ChefBoardVO cbvo);
	public int boardDelete(ChefBoardVO cbvo);
	
	// 조회, 추천
	public int chefBoardViewsPP(ChefBoardVO cbvo);
	public int chefBoardHitsPP(ChefBoardVO cbvo);
	
	// 페이징
	public List<ChefBoardVO> chefBoardSelectAllPage(ChefBoardVO cbvo);
	
	public int chefBoardHitsCount(FavoritesVO fvo);
	
}
