package com.jns.myinfo.dao;

import java.util.List;

import com.jns.board.vo.BoardVO;
import com.jns.favorites.vo.FavoritesVO;
import com.jns.member.vo.MemberVO;
import com.jns.recipe.vo.RecipeVO;
import com.jns.recipeboard.vo.RecipeBoardVO;
import com.jns.reply.vo.ReplyVO;

public interface MyinfoDAO {

	public List<RecipeBoardVO> myRecipeList(MemberVO mvo);

	public List<BoardVO> myQnAList(BoardVO bvo);

	public int myQnADelete(BoardVO bvo);

	public int myLevelUpdateCheckCount(BoardVO bvo);
	
	public int myLevelUpdateCheckHits(BoardVO bvo);

	public int myLevelUpdate(BoardVO bvo);

	public List<MemberVO> myPWUpdateCheck(MemberVO mvo);

	public int myPWUpdate(MemberVO mvo);

	public List<RecipeVO> myFavRecipeList(MemberVO mvo);

	public List<RecipeBoardVO> myFavRecipeBoardList(MemberVO mvo);

	public int myRecipeDelete(RecipeBoardVO rbvo);
	
	public List<MemberVO> myinfoSelect(MemberVO mvo);	
	
	public List<RecipeBoardVO> myRecipeListPage(RecipeBoardVO rbvo);
	
	public int recipeHitsCount(FavoritesVO fvo);

	public int myRecipeReplyCount(ReplyVO rvo);
	
	public int myQnAReplyCount(ReplyVO rvo);
}
