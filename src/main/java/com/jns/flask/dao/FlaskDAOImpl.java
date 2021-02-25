package com.jns.flask.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.jns.flask.vo.NutrientVO;
import com.jns.flask.vo.SignupIncVO;
import com.jns.flask.vo.SubscribeIncVO;
import com.jns.recipe.vo.RecipeVO;

public class FlaskDAOImpl implements FlaskDAO
{
	@Autowired(required = false)
	private SqlSession sqlSession;
	
	@Override
	public NutrientVO getNutrient(RecipeVO rvo)
	{
		return sqlSession.selectOne("getNutrient", rvo);
	}

	@Override
	public SubscribeIncVO getSubscribeInc(SubscribeIncVO ssvo) 
	{
		return sqlSession.selectOne("getSubscribeInc", ssvo);
	}

	@Override
	public SignupIncVO getSignupInc(SignupIncVO suvo) 
	{
		return sqlSession.selectOne("getSignupInc", suvo);
	}
	
}
