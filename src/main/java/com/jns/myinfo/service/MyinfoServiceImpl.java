package com.jns.myinfo.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jns.board.vo.BoardVO;
import com.jns.favorites.vo.FavoritesVO;
import com.jns.member.security.password.PasswordEncoder;
import com.jns.member.vo.MemberVO;
import com.jns.myinfo.dao.MyinfoDAO;
import com.jns.recipe.vo.RecipeVO;
import com.jns.recipeboard.vo.RecipeBoardVO;

@Service
@Transactional
public class MyinfoServiceImpl implements MyinfoService {

	Logger logger = Logger.getLogger(MyinfoServiceImpl.class);

	private MyinfoDAO myinfoDAO;

	@Autowired(required = false)
	public MyinfoServiceImpl(MyinfoDAO myinfoDAO) {
		this.myinfoDAO = myinfoDAO;

	}

	@Override
	public List<RecipeBoardVO> myRecipeList(MemberVO mvo) {

		logger.info("myRecipeList() 진입 >>> ");

		return myinfoDAO.myRecipeList(mvo);
	}

	@Override
	public List<BoardVO> myQnAList(BoardVO bvo) {
		logger.info("myQnAList() 진입 >>> ");

		return myinfoDAO.myQnAList(bvo);
	}

	@Override
	public int myQnADelete(BoardVO bvo) {
		logger.info("myQnADelete() 진입 >>> ");

		return myinfoDAO.myQnADelete(bvo);
	}

	@Override
	public int myRecipeDelete(RecipeBoardVO rbvo) {
		logger.info("myRecipeDelete() 진입 >>> ");

		return myinfoDAO.myRecipeDelete(rbvo);

	}

	@Override
	public int myLevelUpdate(BoardVO bvo) {
		logger.info("myLevelUpdate() 진입 >>> ");

		// 게시글 50개
		int count = myinfoDAO.myLevelUpdateCheckCount(bvo);
		logger.info("해당 회원의 게시글 >>> : " + count);

		// 추천수 100
		int hits = myinfoDAO.myLevelUpdateCheckHits(bvo);
		logger.info("해당 회원의 게시글 추천수 총합 >>> : " + hits);

		if (count > 50 && hits >= 100) {
			return myinfoDAO.myLevelUpdate(bvo);

		} else {
			return 0;
		}

	}

	@Override
	public List<RecipeVO> myFavRecipeList(MemberVO mvo) {
		logger.info("myFavRecipeList() 진입 >>> ");

		return myinfoDAO.myFavRecipeList(mvo);
	}

	@Override
	public List<RecipeBoardVO> myFavRecipeBoardList(MemberVO mvo) {
		logger.info("myFavRecipeList2() 진입 >>> ");

		return myinfoDAO.myFavRecipeBoardList(mvo);
	}

	@Override
	public int myPWUpdate(MemberVO mvo, MemberVO _mvo) {

		logger.info("myPWUpdate() 진입 >>> ");

		int result = 0;

		logger.info("mpw >>> :" + mvo.getMpw());

		// ID로 암호화된 회원의 비밀번호 추출
		List<MemberVO> list = myinfoDAO.myPWUpdateCheck(mvo);

		MemberVO selectMvo = null;
		selectMvo = list.get(0);

		// 패스워드 일치 여부 체크
		boolean bool = PasswordEncoder.pwMatches(mvo.getMpw(), selectMvo.getMpw());

		// 회원 일치 >> 비밀번호 수정
		if (bool) {

			String nMpw = _mvo.getMpw();
			logger.info(nMpw);
			String nMpw_encoded = PasswordEncoder.pwEncoder(nMpw);
			mvo.setMpw(nMpw_encoded);

			result = myinfoDAO.myPWUpdate(mvo);
		}
		// 불일치
		return result;
	}

	@Override
	public List<MemberVO> myinfoSelect(MemberVO mvo) {

		return myinfoDAO.myinfoSelect(mvo);
	}

	@Override
	public List<RecipeBoardVO> myRecipeListPage(RecipeBoardVO rbvo) {

		List<RecipeBoardVO> list = myinfoDAO.myRecipeListPage(rbvo);

		int nCnt = list.size();

		for (int i = 0; i < nCnt; i++) {
			FavoritesVO fvo = null;
			fvo = new FavoritesVO();
			// 게시판 번호 추출
			fvo.setRbno(list.get(0).getRbno());
			// 추천 조회
			int hitCount = myinfoDAO.myRecipeListHitsCount(fvo);

			logger.info("추천 수는 >>> " + hitCount);

			String sHitCount = String.valueOf(hitCount);

			list.get(0).setHits(sHitCount);
		}
		return list;
	}

}
