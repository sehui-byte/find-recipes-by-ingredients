package com.jns.myinfo.dao;

import java.util.List;

import com.jns.board.vo.BoardVO;
import com.jns.member.vo.MemberVO;
import com.jns.recipe.vo.RecipeVO;
import com.jns.recipeboard.vo.RecipeBoardVO;

public interface MyinfoDAO {

	public List<RecipeBoardVO> myRecipeList(MemberVO mvo);

	public List<BoardVO> myQnAList(MemberVO mvo);

	public int myQnADelete(BoardVO bvo);

	public int myRankUpdateCheckCount(BoardVO bvo);

	public int myRankUpdateCheckHits(BoardVO bvo);

	public int myRankUpdate(BoardVO bvo);

	public List<RecipeVO> myFavRecipeList1(MemberVO mvo);

	public List<RecipeBoardVO> myFavRecipeList2(MemberVO mvo);

	public int myRecipeDelete(RecipeBoardVO rbvo);

}
