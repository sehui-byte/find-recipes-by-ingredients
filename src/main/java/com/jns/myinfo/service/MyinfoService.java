package com.jns.myinfo.service;

import java.util.List;

import com.jns.board.vo.BoardVO;
import com.jns.member.vo.MemberVO;
import com.jns.recipe.vo.RecipeVO;
import com.jns.recipeboard.vo.RecipeBoardVO;

public interface MyinfoService {

	public List<RecipeBoardVO> myRecipeList(MemberVO mvo);

	public List<BoardVO> myQnAList(BoardVO bvo);

	public int myQnADelete(BoardVO bvo);

	public int myRecipeDelete(RecipeBoardVO rbvo);
	
	public int myPWUpdate(MemberVO mvo, MemberVO _mvo);

	public int myLevelUpdate(BoardVO bvo);

	// 내가 추천한 레시피 가져오기 >> 식약처 레시피
	public List<RecipeVO> myFavRecipeList1(MemberVO mvo);

	// 내가 추천한 레시피 가져오기 >> 유저 레시피
	public List<RecipeBoardVO> myFavRecipeList2(MemberVO mvo);
	
	public List<MemberVO> myinfoSelect(MemberVO mvo);
	
	public List<RecipeBoardVO> myRecipeListPage(RecipeBoardVO rbvo);

}
