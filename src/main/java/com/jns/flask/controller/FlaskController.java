package com.jns.flask.controller;

import org.apache.log4j.Logger;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jns.common.FlaskUtil;
import com.jns.flask.service.FlaskService;
import com.jns.flask.vo.NutrientVO;
import com.jns.flask.vo.SignupIncVO;
import com.jns.flask.vo.SubscribeIncVO;
import com.jns.recipe.service.RecipeService;
import com.jns.recipe.vo.RecipeVO;

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
		
		return "redirect:" + FlaskUtil.FLASK_SERVER_URL;
	}
//	
//	@RequestMapping(value = "sendSubscribeInc", method = RequestMethod.GET)
//	public String sendSubscribeInc(SubscribeIncVO svo, RedirectAttributes redirectAttributes)
//	{
//		logger.info("svo >>> : " + svo.toString());
//		SubscribeIncVO svo = flaskService.getSubscribeInc(svo);
//		return "redirect:" + FlaskUtil.FLASK_SERVER_URL;
//	}
//	
//	@RequestMapping(value = "sendSignupInc", method = RequestMethod.GET)
//	public String sendSignupInc(SignupIncVO svo, RedirectAttributes redirectAttributes)
//	{
//		return "redirect:" + FlaskUtil.FLASK_SERVER_URL;
//	}
//	
/*
	@RequestMapping(value = "flaskTest", method = RequestMethod.GET)
	public String flaskTest(RedirectAttributes redirectAttributes)
	{
		RecipeVO rvo = recipeService.recipeSelectAll().get(0);
		SubscribeIncVO ssvo = new SubscribeIncVO();
		SignupIncVO suvo = new SignupIncVO();
		
		String nutrient = flaskService.getNutrient(rvo).toJSONObject().toJSONString();
		logger.info("nutrient >>> : " + nutrient);
		
		ssvo.setYear("2021");
		ssvo.setMon("02");
		String subscribe = flaskService.getSubscribeInc(ssvo).toJSONObject().toJSONString();
		logger.info("subscribe >>> : " + subscribe);
		
		suvo.setYear("2021");
		suvo.setMon("02");
		String signup = flaskService.getSignupInc(suvo).toJSONObject().toJSONString();
		logger.info("signup >>> : " + signup); 
		
		redirectAttributes.addAttribute("nutrient", nutrient);
		redirectAttributes.addAttribute("subscribeInc", subscribe);
		redirectAttributes.addAttribute("signupInc", signup);
		
		return "redirect:http://127.0.0.1:5000/test";
	}
*/
}
