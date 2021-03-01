package com.jns.flask.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jns.flask.dao.FlaskDAO;
import com.jns.flask.vo.LikeProductInfoVO;
import com.jns.flask.vo.NutrientVO;
import com.jns.flask.vo.SignupIncVO;
import com.jns.flask.vo.SubscribeIncVO;
import com.jns.member.vo.MemberVO;
import com.jns.product.vo.ProductVO;
import com.jns.recipe.vo.RecipeVO;

@Service
@Transactional
public class FlaskServiceImpl implements FlaskService 
{
	private Logger logger = Logger.getLogger(FlaskServiceImpl.class);
	
	private FlaskDAO flaskDAO;
	
	@Autowired(required = false)
	public FlaskServiceImpl(FlaskDAO flaskDAO) 
	{
		this.flaskDAO = flaskDAO;
	}
	
	
	@Override
	public NutrientVO getNutrient(RecipeVO rvo) {
		// TODO Auto-generated method stub
		return flaskDAO.getNutrient(rvo);
	}

	@Override
	public SubscribeIncVO getSubscribeInc(SubscribeIncVO ssvo) {
		// TODO Auto-generated method stub
		return flaskDAO.getSubscribeInc(ssvo);
	}

	@Override
	public SignupIncVO getSignupInc(SignupIncVO suvo) {
		// TODO Auto-generated method stub
		return flaskDAO.getSignupInc(suvo);
	}
	
	@Override
	public LikeProductInfoVO getLikeProductInfo(String productId, ProductVO pvo) {
		// TODO Auto-generated method stub
		pvo.setProductId(productId);
		pvo.setMno(getLoginMno(pvo));
		LikeProductInfoVO result = flaskDAO.getLikeProductInfo(pvo);
		return result;
	}
	//로그인한 사용자 mno가져오기
	private String getLoginMno(ProductVO pvo) {
		//로그인 사용자 mno 가져오기
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Object principal = auth.getPrincipal();
		String mno = ((MemberVO)principal).getMno();
		//System.out.println("mno >>" + mno);
		return mno;
	}

}
