package com.jns.recipeboard.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jns.favorites.vo.FavoritesVO;
import com.jns.recipeboard.dao.RecipeBoardDAO;
import com.jns.recipeboard.vo.RecipeBoardVO;

@Service
@Transactional
public class RecipeBoardServiceImpl implements RecipeBoardService {

	Logger logger = Logger.getLogger(RecipeBoardServiceImpl.class);

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
	public List<RecipeBoardVO> recipeBoardSelectAllPage(RecipeBoardVO rbvo) {

		List<RecipeBoardVO> list = recipeBoardDAO.recipeBoardSelectAllPage(rbvo);

		int nCnt = list.size();

		if (nCnt > 0) {
			for (int i = 0; i < nCnt; i++) {
				FavoritesVO fvo = null;
				fvo = new FavoritesVO();

				// 게시판 번호 추출
				fvo.setRbno(list.get(i).getRbno());

				// 추천수 조회
				int hitCount = recipeBoardDAO.recipeBoardHitsCount(fvo);

				String sHitCount = String.valueOf(hitCount);

				logger.info("추천 수는 >>> " + sHitCount);

				list.get(i).setHits(sHitCount);

			}
		}

		return list;
	}

	@Override
	public RecipeBoardVO recipeBoardSelect(RecipeBoardVO rbvo) {

		RecipeBoardVO _rbvo = recipeBoardDAO.recipeBoardSelect(rbvo);

		FavoritesVO fvo = null;
		fvo = new FavoritesVO();

		// 게시판 번호 추출
		fvo.setRbno(_rbvo.getRbno());

		// 추천수 조회
		int hitCount = recipeBoardDAO.recipeBoardHitsCount(fvo);

		String sHitCount = String.valueOf(hitCount);

		logger.info("추천 수는 >>> " + sHitCount);

		_rbvo.setHits(sHitCount);

		return _rbvo;
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
