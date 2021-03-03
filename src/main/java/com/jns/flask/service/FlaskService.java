package com.jns.flask.service;

import com.jns.flask.vo.HitsVO;
import com.jns.flask.vo.LikeProductInfoVO;
import com.jns.flask.vo.NutrientVO;
import com.jns.flask.vo.SignupIncVO;
import com.jns.flask.vo.SubscribeIncVO;
import com.jns.product.vo.ProductVO;
import com.jns.recipe.vo.RecipeVO;

public interface FlaskService 
{
	public NutrientVO getNutrient(RecipeVO rvo);
	public SubscribeIncVO getSubscribeInc(SubscribeIncVO ssvo);
	public SignupIncVO getSignupInc(SignupIncVO suvo);
	public HitsVO getHitsInc(HitsVO hvo);
	public LikeProductInfoVO getLikeProductInfo(String productId, ProductVO pvo);
}
