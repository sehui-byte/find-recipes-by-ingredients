package com.jns.recipeboard.dao;

import java.util.List;

import com.jns.favorites.vo.FavoritesVO;
import com.jns.recipeboard.vo.RecipeBoardVO;

public interface RecipeBoardDAO 
{
	public List<RecipeBoardVO> recipeBoardSelectAll();
	public RecipeBoardVO recipeBoardSelect(RecipeBoardVO rbvo);
	public boolean recipeBoardInsert(RecipeBoardVO rbvo);
	public boolean recipeBoardUpdate(RecipeBoardVO rbvo);
	public boolean recipeBoardDelete(RecipeBoardVO rbvo);
	public boolean recipeBoardViewsPP(RecipeBoardVO rbvo);
	public boolean recipeBoardHitsPP(RecipeBoardVO rbvo);
}
