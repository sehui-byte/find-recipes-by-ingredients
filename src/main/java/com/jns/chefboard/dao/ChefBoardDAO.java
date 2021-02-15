package com.jns.chefboard.dao;

import java.util.List;

import com.jns.chefboard.vo.ChefBoardVO;

public interface ChefBoardDAO {

	public List<ChefBoardVO> boardList(ChefBoardVO cbvo);
	public int boardInsert(ChefBoardVO cbvo);
	public ChefBoardVO boardDetail(ChefBoardVO cbvo);
	public int boardUpdate(ChefBoardVO cbvo);
	public int boardDelete(ChefBoardVO cbvo);
}
