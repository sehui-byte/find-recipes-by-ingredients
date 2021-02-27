package com.jns.chefboard.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jns.chefboard.dao.ChefBoardDAO;
import com.jns.chefboard.vo.ChefBoardVO;
import com.jns.favorites.vo.FavoritesVO;

@Service
@Transactional
public class ChefBoardServiceImpl implements ChefBoardService {
	Logger logger = Logger.getLogger(ChefBoardServiceImpl.class);
	
	private ChefBoardDAO chefBoardDAO;
	
	//기본생성자 주입
	@Autowired(required=false)
	public ChefBoardServiceImpl(ChefBoardDAO chefBoardDAO) {
		this.chefBoardDAO = chefBoardDAO;
	}

	@Override
	public List<ChefBoardVO> chefBoardSelectAll(ChefBoardVO cbvo) {
		// TODO Auto-generated method stub
		
		List<ChefBoardVO> list = chefBoardDAO.chefBoardSelectAll(cbvo);
		
		int nCnt = list.size();

		if(nCnt > 0 ) {
			for (int i = 0 ; i < nCnt; i++) {
				FavoritesVO fvo = null;
				fvo = new FavoritesVO();
				// 게시판 번호 추출
				fvo.setRbno(list.get(i).getRbno());
				
				// 즐겨찾기 수 조회
				int hitCount = chefBoardDAO.chefBoardHitsCount(fvo);
				
				logger.info("즐겨찾기 수는 >>> "  + hitCount);
				
				list.get(i).setHits(hitCount);
				
			}
			
		}
		//return chefBoardDAO.chefBoardSelectAll(cbvo);
		return list;
	}

	@Override
	public List<ChefBoardVO> chefBoardSelect(ChefBoardVO cbvo) {
		// TODO Auto-generated method stub
		return chefBoardDAO.chefBoardSelect(cbvo);
	}

	@Override
	public int boardInsert(ChefBoardVO cbvo) {
		// TODO Auto-generated method stub
		return chefBoardDAO.boardInsert(cbvo);
	}

	@Override
	public int boardUpdate(ChefBoardVO cbvo) {
		// TODO Auto-generated method stub
		return chefBoardDAO.boardUpdate(cbvo);
	}

	@Override
	public int boardDelete(ChefBoardVO cbvo) {
		// TODO Auto-generated method stub
		return chefBoardDAO.boardDelete(cbvo);
	}

	@Override
	public int chefBoardViewsPP(ChefBoardVO cbvo) {
		// TODO Auto-generated method stub
		return chefBoardDAO.chefBoardViewsPP(cbvo);
	}	

	@Override
	public int chefBoardHitsPP(ChefBoardVO cbvo) {
		// TODO Auto-generated method stub
		return chefBoardDAO.chefBoardHitsPP(cbvo);
	}

	@Override
	public List<ChefBoardVO> chefBoardSelectAllPage(ChefBoardVO cbvo) {
		// TODO Auto-generated method stub
		return chefBoardDAO.chefBoardSelectAllPage(cbvo);
	}
	
	

}
