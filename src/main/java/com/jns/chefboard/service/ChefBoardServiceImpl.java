package com.jns.chefboard.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jns.chefboard.vo.ChefBoardVO;

@Service
@Transactional
public class ChefBoardServiceImpl implements ChefBoardService {

	@Override
	public List<ChefBoardVO> boardList(ChefBoardVO cbvo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int boardInsert(ChefBoardVO cbvo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ChefBoardVO boardDetail(ChefBoardVO cbvo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int boardUpdate(ChefBoardVO cbvo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int boardDelete(ChefBoardVO cbvo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
