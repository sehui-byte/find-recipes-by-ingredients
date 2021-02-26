package com.jns.common;

import java.util.List;

import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.jns.flask.vo.NutrientVO;
import com.jns.flask.vo.SignupIncVO;
import com.jns.flask.vo.SubscribeIncVO;

public abstract class FlaskUtil 
{
	private static Logger logger = Logger.getLogger(FlaskUtil.class);
	public static String FLASK_SERVER_URL = "http://127.0.0.1:5000/test";
	
	@SuppressWarnings("unchecked")
	public static JSONObject getNutrientJSON(NutrientVO nvo)
	{
		JSONObject json = new JSONObject();
		json.put("nutrient", nvo.toJSONObject());
		logger.info("json >>> : " + json.toJSONString());
		return json;
	}
	
	@SuppressWarnings("unchecked")
	public static JSONObject getSubscribeInc(List<SubscribeIncVO> svoList)
	{
		JSONObject json = new JSONObject();// result
		JSONArray jArr = new JSONArray();// array
		
		for(int i=0; i<svoList.size(); i++)
		{
			jArr.add(svoList.get(i).toJSONObject());
		}
		json.put("subscribeInc", jArr); 
		logger.info("json >>> : " + json.toJSONString());
		
		return json;
	}
	
	@SuppressWarnings("unchecked")
	public static JSONObject getSignupInc(List<SignupIncVO> svoList)
	{
		JSONObject json = new JSONObject();// result
		JSONArray jArr = new JSONArray();// array
		
		for(int i=0; i<svoList.size(); i++)
		{
			jArr.add(svoList.get(i).toJSONObject());
		}
		json.put("signupInc", jArr); 
		logger.info("json >>> : " + json.toJSONString());
		
		return json;
	}
}
