package com.jns.myinfo.dao;

import java.util.List;

import com.jns.board.vo.BoardVO;
import com.jns.member.vo.MemberVO;
import com.jns.myinfo.vo.FavoritesVO;
import com.jns.recipe.vo.RecipeVO;
import com.jns.recipeboard.vo.RecipeBoardVO;

public interface MyinfoDAO {

	public List<RecipeBoardVO> myRecipeList(MemberVO mvo);
	public List<BoardVO> myQnAList(MemberVO mvo);

	public int myQnADelete(BoardVO bvo);
	public int myRecipeDelete(RecipeBoardVO rbvo);
	public int myRankUpdate(BoardVO bvo);

	public List<RecipeVO> myFavRecipeList1(MemberVO mvo);
	public List<RecipeBoardVO> myFavRecipeList2(MemberVO mvo);

	// 추천 레시피 확인하기
	public int mySubRecipeCheck(FavoritesVO fvo);
	
	// 추천 레시피 제거
	public int mySubRecipeDelete(FavoritesVO fvo);
	
	// 추천 레시피 추가
	public int mySubRecipeInsert(FavoritesVO fvo);
}
