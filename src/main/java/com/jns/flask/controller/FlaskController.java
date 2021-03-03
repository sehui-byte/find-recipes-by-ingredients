package com.jns.flask.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jns.common.FlaskUtil;
import com.jns.flask.service.FlaskService;
import com.jns.flask.vo.HitsVO;
import com.jns.flask.vo.LikeProductInfoVO;
import com.jns.flask.vo.NutrientVO;
import com.jns.flask.vo.SignupIncVO;
import com.jns.flask.vo.SubscribeIncVO;
import com.jns.product.vo.ProductVO;
import com.jns.recipe.service.RecipeService;
import com.jns.recipe.vo.RecipeVO;

@CrossOrigin(origins="*")
@Controller
public class FlaskController 
{
	private Logger logger = Logger.getLogger(FlaskController.class);
	
	private RecipeService recipeService;
	private FlaskService flaskService;
	
	@Autowired(required = false)
	public FlaskController(FlaskService flaskService, RecipeService recipeService) 
	{
		this.flaskService = flaskService;
		this.recipeService = recipeService;
	}
	
	@RequestMapping(value = "sendNutrient", method = RequestMethod.GET)
	public String sendNutrient(RecipeVO rvo, RedirectAttributes redirectAttributes)
	{
		logger.info("rvo >>> : " + rvo.toString());
		NutrientVO nvo = flaskService.getNutrient(recipeService.recipeSelect(rvo));
		String jsonStr = FlaskUtil.getNutrientJSON(nvo).toJSONString();
		redirectAttributes.addAttribute("nutrient", jsonStr);
		redirectAttributes.addAttribute("rcp_seq", rvo.getRcp_seq());

		String flaskUrl = FlaskUtil.FLASK_SERVER_URL+"visualization"; 
		logger.info("flask로 데이터 전송 >>> "+ flaskUrl);
		
		return "redirect:" + flaskUrl;
	}
	
	@RequestMapping(value = "sendSubscribeInc", method = RequestMethod.GET)
	public String sendSubscribeInc(SubscribeIncVO ssvo, RedirectAttributes redirectAttributes)
	{
		logger.info("ssvo >>> : " + ssvo.toString());
		
		List<SubscribeIncVO> voList = FlaskUtil.divSsvoYYYYMM(ssvo); //startYYYYMM ~ endYYYYMM 값을 기준으로 1달 단위로 vo를 쪼개서 List로 리턴
		
		for(int i=0; i<voList.size(); i++)
		{
			voList.set(i, flaskService.getSubscribeInc(voList.get(i))); //날짜만 들어있는 vo를 증가값(Inc)까지 set된 vo로 교체
		}
		
		String jsonStr = FlaskUtil.getSubscribeInc(voList).toJSONString();
		logger.info("jsonStr >>> : " + jsonStr);
		
		redirectAttributes.addAttribute("subscribeInc", jsonStr);
		redirectAttributes.addAttribute("mno", ssvo.getMno());

		String flaskUrl = FlaskUtil.FLASK_SERVER_URL+"visualization"; 
		logger.info("flask로 데이터 전송 >>> "+ flaskUrl);
		
		return "redirect:" + flaskUrl;
	}
	
	@RequestMapping(value = "sendSignupInc", method = RequestMethod.GET)
	public String sendSignupInc(SignupIncVO suvo, RedirectAttributes redirectAttributes)
	{
		logger.info("suvo >>> : " + suvo);
		
		List<SignupIncVO> voList = FlaskUtil.divSuvoYYYYMM(suvo);
		
		for(int i=0; i<voList.size(); i++)
		{
			voList.set(i, flaskService.getSignupInc(voList.get(i)));
		}
		
		String jsonStr = FlaskUtil.getSignupInc(voList).toJSONString();
		logger.info("jsonStr >>> : " + jsonStr);
		
		redirectAttributes.addAttribute("signupInc", jsonStr);

		String flaskUrl = FlaskUtil.FLASK_SERVER_URL+"visualization"; 
		logger.info("flask로 데이터 전송 >>> "+ flaskUrl);
		
		return "redirect:" + flaskUrl;
	}
	
	@RequestMapping(value = "sendLikeProductInfo", method = RequestMethod.GET)
	public String sendLikeProductInfo(@RequestParam(value="productId") String productId,
			ProductVO pvo, RedirectAttributes redirectAttributes)
	{
		logger.info("productId >>> : " + productId.toString());
		logger.info("pvo >>> : " + pvo.toString());
		LikeProductInfoVO lpvo2 = flaskService.getLikeProductInfo(productId, pvo);
		String jsonStr = FlaskUtil.getLikeProductInfo(lpvo2).toJSONString();
		logger.info("jsonStr >>> : " + jsonStr);
		
		redirectAttributes.addAttribute("likeProductInfo", jsonStr);

		String flaskUrl = FlaskUtil.FLASK_SERVER_URL+"lprice"; 
		logger.info("flask로 데이터 전송 >>> "+ flaskUrl);
		
		return "redirect:" + flaskUrl;
	}
	
	// 월별 내 레시피 추천수 그래프 코드 
	@RequestMapping(value="sendHitsInc", method = RequestMethod.GET)
	public String sendHitsInc(HitsVO hvo, RedirectAttributes redirectAttributes) {
		
		List<HitsVO> voList = FlaskUtil.divHvoYYYYMM(hvo);
		
		for(int i=0; i<voList.size(); i++)
		{
			voList.set(i, flaskService.getHitsInc(voList.get(i)));
		}
		
		String jsonStr = FlaskUtil.getHitsInc(voList).toJSONString();
		logger.info("jsonStr >>> : " + jsonStr);
		
		redirectAttributes.addAttribute("hitsInc", jsonStr);
		redirectAttributes.addAttribute("mno", hvo.getMno());

		String flaskUrl = FlaskUtil.FLASK_SERVER_URL+"visualization"; 
		logger.info("flask로 데이터 전송 >>> "+ flaskUrl);
		
		return "redirect:" + flaskUrl;
	}
	
	
}