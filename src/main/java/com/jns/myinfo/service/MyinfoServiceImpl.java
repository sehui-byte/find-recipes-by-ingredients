package com.jns.myinfo.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jns.board.vo.BoardVO;
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
	public List<BoardVO> myQnAList(MemberVO mvo) {
		logger.info("myQnAList() 진입 >>> ");

		return myinfoDAO.myQnAList(mvo);
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
	public int myRankUpdate(BoardVO bvo) {
		logger.info("myRankUpdate() 진입 >>> ");

		// 게시글 50개
		int count = myinfoDAO.myRankUpdateCheckCount(bvo);
		logger.info("해당 회원의 게시글 >>> : "+count);

		// 추천수 100
		int hits = myinfoDAO.myRankUpdateCheckHits(bvo);
		logger.info("해당 회원의 게시글 추천수 총합 >>> : "+hits);

		if (count > 50 && hits > 100) {
			return myinfoDAO.myRankUpdate(bvo);

		} else {
			return 0;
		}

	}

	@Override
	public List<RecipeVO> myFavRecipeList1(MemberVO mvo) {
		logger.info("myFavRecipeList1() 진입 >>> ");

		return myinfoDAO.myFavRecipeList1(mvo);
	}

	@Override
	public List<RecipeBoardVO> myFavRecipeList2(MemberVO mvo) {
		logger.info("myFavRecipeList2() 진입 >>> ");

		return myinfoDAO.myFavRecipeList2(mvo);
	}

}
