package com.jns.chefboard.service;

import java.util.List;

import com.jns.chefboard.vo.ChefBoardVO;

public interface ChefBoardService {

	public List<ChefBoardVO> boardList(ChefBoardVO cbvo);
	public int boardInsert(ChefBoardVO cbvo);
	public List<ChefBoardVO> boardDetail(ChefBoardVO cbvo);
	public int boardUpdate(ChefBoardVO cbvo);
	public int boardDelete(ChefBoardVO cbvo);
}
