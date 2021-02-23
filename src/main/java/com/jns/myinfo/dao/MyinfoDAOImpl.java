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
	public List<BoardVO> myQnAList(MemberVO mvo) {

		return sqlSession.selectList("myQnAList", mvo);
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
	public int myRankUpdateCheckCount(BoardVO bvo) {
	
		return (Integer)sqlSession.selectOne("myRankUpdateCheckCount", bvo);
	}

	@Override
	public int myRankUpdateCheckHits(BoardVO bvo) {
	
		return (Integer)sqlSession.selectOne("myRankUpdateCheckHits", bvo);
	}

	@Override
	public int myRankUpdate(BoardVO bvo) {

		return sqlSession.update("myRankUpdate", bvo);
	}

	@Override
	public List<RecipeVO> myFavRecipeList1(MemberVO mvo) {

		return sqlSession.selectList("myFavRecipeList1", mvo);
	}

	@Override
	public List<RecipeBoardVO> myFavRecipeList2(MemberVO mvo) {

		return sqlSession.selectList("myFavRecipeList2", mvo);
	}

}
