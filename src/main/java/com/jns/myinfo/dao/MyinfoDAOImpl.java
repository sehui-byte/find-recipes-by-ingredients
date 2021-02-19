package com.jns.myinfo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jns.member.vo.MemberVO;
import com.jns.qna.vo.QnAVO;
import com.jns.recipe.vo.RecipeVO;

@Repository
public class MyinfoDAOImpl implements MyinfoDAO {

	@Autowired(required = false)
	private SqlSession sqlSession;

	@Override
	public List<RecipeVO> myRecipeList(MemberVO mvo) {

		return sqlSession.selectList("myRecipeList", mvo);
	}

	@Override
	public List<QnAVO> myQnAList(MemberVO mvo) {
	
		return sqlSession.selectList("myQnAList", mvo);
	}
}
