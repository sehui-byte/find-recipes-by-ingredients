package com.jns.flask.service;

import java.util.List;

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
	public LikeProductInfoVO getLikeProductInfo(String productId, ProductVO pvo);
}
