package com.jns.myinfo.service;

import java.util.List;

import com.jns.member.vo.MemberVO;
import com.jns.qna.vo.QnAVO;
import com.jns.recipe.vo.RecipeVO;

public interface MyinfoService {
	
	public List<RecipeVO> myRecipeList(MemberVO mvo);
	public List<QnAVO> myQnAList(MemberVO mvo);

}
