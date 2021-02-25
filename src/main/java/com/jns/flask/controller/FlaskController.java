package com.jns.flask.controller;

import org.apache.log4j.Logger;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	@RequestMapping(value = "flaskTest", method = RequestMethod.GET)
	public String flaskTest()
	{
		RecipeVO rvo = recipeService.recipeSelectAll().get(0);
		SubscribeIncVO ssvo = new SubscribeIncVO();
		SignupIncVO suvo = new SignupIncVO();
		
		logger.info("nutrient >>> : " + flaskService.getNutrient(rvo).toJSONObject().toJSONString());
		
		ssvo.setYear("2021");
		ssvo.setMon("02");
		logger.info("subscribe >>> : " + flaskService.getSubscribeInc(ssvo).toJSONObject().toJSONString());
		
		suvo.setYear("2021");
		ssvo.setMon("02");
		logger.info("signup >>> : " + flaskService.getSignupInc(suvo).toJSONObject().toJSONString()); 
		
		return "index.jsp";
	}
	
//	public static void main(String[] args) 
//	{
//		NutrientVO nvo = new NutrientVO("445", "70", "26", "7", "245");
//		JSONObject nutrient = new JSONObject();
//		nutrient.put("nutrient", nvo.toJSONObject());
//		System.out.println(nutrient);
//	}
}
