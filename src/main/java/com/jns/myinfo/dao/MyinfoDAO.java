package com.jns.myinfo.dao;

import java.util.List;

import com.jns.common.vo.BoardVO;
import com.jns.member.vo.MemberVO;
import com.jns.recipe.vo.RecipeVO;

public interface MyinfoDAO {

	public List<RecipeVO> myRecipeList(MemberVO mvo);
	public List<BoardVO> myQnAList(MemberVO mvo);
}
