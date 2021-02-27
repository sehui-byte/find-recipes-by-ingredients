package com.jns.flask.dao;

import com.jns.flask.vo.LikeProductInfoVO;
import com.jns.flask.vo.NutrientVO;
import com.jns.flask.vo.SignupIncVO;
import com.jns.flask.vo.SubscribeIncVO;
import com.jns.product.vo.ProductVO;
import com.jns.recipe.vo.RecipeVO;

public interface FlaskDAO 
{
	public NutrientVO getNutrient(RecipeVO rvo);
	public SubscribeIncVO getSubscribeInc(SubscribeIncVO ssvo);
	public SignupIncVO getSignupInc(SignupIncVO suvo);
	public LikeProductInfoVO getLikeProductInfo(ProductVO pvo);
}
