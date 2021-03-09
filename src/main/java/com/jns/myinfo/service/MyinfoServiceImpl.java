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
import com.jns.reply.vo.ReplyVO;

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
		List<BoardVO> list = myinfoDAO.myQnAList(bvo);

		int nCnt = list.size();

		if (nCnt != 0) {
			for (int i = 0; i < nCnt; i++) {
				ReplyVO rvo = null;
				rvo = new ReplyVO();
				rvo.setBno(list.get(i).getBno());

				// 답변 개수 체크 로직
				int replyCount = myinfoDAO.myQnAReplyCount(rvo);

				String sReplyCount = String.valueOf(replyCount);

				list.get(i).setBhits(sReplyCount);

			}

		}

		return list;
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

		List<RecipeVO> list = myinfoDAO.myFavRecipeList(mvo);

		int nCnt = list.size();

		if (nCnt != 0) {
			for (int i = 0; i < nCnt; i++) {

				FavoritesVO fvo = null;
				fvo = new FavoritesVO();

				fvo.setRcp_seq(list.get(i).getRcp_seq());

				// 추천수 확인하기
				int hitsCount = myinfoDAO.recipeHitsCount(fvo);

				logger.info("추천수는 >>> " + hitsCount);

				String sHitsCount = String.valueOf(hitsCount);

				list.get(i).setRcpHits(sHitsCount);
			}
		}
		return list;
	}

	@Override
	public List<RecipeBoardVO> myFavRecipeBoardList(MemberVO mvo) {
		logger.info("myFavRecipeList2() 진입 >>> ");

		List<RecipeBoardVO> list = myinfoDAO.myFavRecipeBoardList(mvo);

		int nCnt = list.size();

		if (nCnt != 0) {
			for (int i = 0; i < nCnt; i++) {

				FavoritesVO fvo = null;
				fvo = new FavoritesVO();

				fvo.setRbno(list.get(i).getRbno());

				// 추천수 확인하기
				int hitsCount = myinfoDAO.recipeHitsCount(fvo);

				logger.info("추천수는 >>> " + hitsCount);

				String sHitsCount = String.valueOf(hitsCount);

				list.get(i).setHits(sHitsCount);
			}
		}

		return list;
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
			logger.info(result);
		}
		// 불일치
		logger.info(result);
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
			// 추천 삽입 로직
			FavoritesVO fvo = null;
			fvo = new FavoritesVO();
			// 게시판 번호 추출
			fvo.setRbno(list.get(i).getRbno());
			// 추천 조회
			int hitCount = myinfoDAO.recipeHitsCount(fvo);

			// 댓글 삽입 로직
			ReplyVO rvo = null;
			rvo = new ReplyVO();

			rvo.setRbno(list.get(i).getRbno());

			int replyCount = myinfoDAO.myRecipeReplyCount(rvo);

			logger.info("추천 수는 >>> " + hitCount);
			logger.info("댓글 수는 >>> " + replyCount);

			String sHitCount = String.valueOf(hitCount);
			String sReplyCount = String.valueOf(replyCount);

			list.get(i).setHits(sHitCount);
			list.get(i).setRb_reply(sReplyCount);
		}
		return list;
	}

}
