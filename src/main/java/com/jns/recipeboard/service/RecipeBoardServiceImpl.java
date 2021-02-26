package com.jns.recipeboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jns.favorites.vo.FavoritesVO;
import com.jns.recipeboard.dao.RecipeBoardDAO;
import com.jns.recipeboard.vo.RecipeBoardVO;

@Service
@Transactional
public class RecipeBoardServiceImpl implements RecipeBoardService {
	private RecipeBoardDAO recipeBoardDAO;

	@Autowired(required = false)
	public RecipeBoardServiceImpl(RecipeBoardDAO recipeBoardDAO) {
		this.recipeBoardDAO = recipeBoardDAO;
	}

	@Override
	public List<RecipeBoardVO> recipeBoardSelectAll() {
		// TODO Auto-generated method stub
		return recipeBoardDAO.recipeBoardSelectAll();
	}

	@Override
	public RecipeBoardVO recipeBoardSelect(RecipeBoardVO rbvo) {
		// TODO Auto-generated method stub
		return recipeBoardDAO.recipeBoardSelect(rbvo);
	}

	@Override
	public boolean recipeBoardInsert(RecipeBoardVO rbvo) {
		// TODO Auto-generated method stub
		return recipeBoardDAO.recipeBoardInsert(rbvo);
	}

	@Override
	public boolean recipeBoardUpdate(RecipeBoardVO rbvo) {
		// TODO Auto-generated method stub
		return recipeBoardDAO.recipeBoardUpdate(rbvo);
	}

	@Override
	public boolean recipeBoardDelete(RecipeBoardVO rbvo) {
		return recipeBoardDAO.recipeBoardDelete(rbvo);
	}

	@Override
	public boolean recipeBoardViewsPP(RecipeBoardVO rbvo) {
		// TODO Auto-generated method stub
		return recipeBoardDAO.recipeBoardViewsPP(rbvo);
	}

	@Override
	public boolean recipeBoardHitsPP(RecipeBoardVO rbvo) {
		// TODO Auto-generated method stub
		return recipeBoardDAO.recipeBoardHitsPP(rbvo);
	}
}
