package com.jns.myinfo.dao;

import java.util.List;

import com.jns.board.vo.BoardVO;
import com.jns.member.vo.MemberVO;
import com.jns.recipeboard.vo.RecipeBoardVO;

public interface MyinfoDAO {

	public List<RecipeBoardVO> myRecipeList(MemberVO mvo);
	public List<BoardVO> myQnAList(MemberVO mvo);
	public int myQnADelete(BoardVO bvo);
	public int myRecipeDelete(RecipeBoardVO rbvo);
	public int myRankUpdate(BoardVO bvo);
}
