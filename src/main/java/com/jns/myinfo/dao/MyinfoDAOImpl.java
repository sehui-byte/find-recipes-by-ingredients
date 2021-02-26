package com.jns.myinfo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jns.board.vo.BoardVO;
import com.jns.member.vo.MemberVO;
import com.jns.recipe.vo.RecipeVO;
import com.jns.recipeboard.vo.RecipeBoardVO;

@Repository
public class MyinfoDAOImpl implements MyinfoDAO {

	@Autowired(required = false)
	private SqlSession sqlSession;

	@Override
	public List<RecipeBoardVO> myRecipeList(MemberVO mvo) {

		return sqlSession.selectList("myRecipeList", mvo);
	}

	@Override
	public List<BoardVO> myQnAList(BoardVO bvo) {

		return sqlSession.selectList("myQnAList", bvo);
	}

	@Override
	public int myQnADelete(BoardVO bvo) {

		return sqlSession.update("myQnADelete", bvo);
	}

	@Override
	public int myRecipeDelete(RecipeBoardVO rbvo) {

		return sqlSession.update("myRecipeDelete", rbvo);
	}

	@Override
	public List<MemberVO> myPWUpdateCheck(MemberVO mvo) {

		return sqlSession.selectOne("myPWUpdateCheck", mvo);
	}

	@Override
	public int myPWUpdate(MemberVO mvo) {

		return sqlSession.update("myPWUpdate", mvo);
	}

	@Override
	public int myLevelUpdateCheckCount(BoardVO bvo) {

		return (Integer) sqlSession.selectOne("myRankUpdateCheckCount", bvo);
	}

	@Override
	public int myLevelUpdateCheckHits(BoardVO bvo) {

		return (Integer) sqlSession.selectOne("myRankUpdateCheckHits", bvo);
	}

	@Override
	public int myLevelUpdate(BoardVO bvo) {

		return sqlSession.update("myLevelUpdate", bvo);
	}

	@Override
	public List<RecipeVO> myFavRecipeList(MemberVO mvo) {

		return sqlSession.selectList("myFavRecipeList", mvo);
	}

	@Override
	public List<RecipeBoardVO> myFavRecipeBoardList(MemberVO mvo) {

		return sqlSession.selectList("myFavRecipeBoardList", mvo);
	}

	@Override
	public List<MemberVO> myinfoSelect(MemberVO mvo) {

		return sqlSession.selectOne("myinfoSelect", mvo);
	}

	@Override
	public List<RecipeBoardVO> myRecipeListPage(RecipeBoardVO rbvo) {

		return sqlSession.selectList("myRecipeListPage", rbvo);
	}
}
