package com.jns.common;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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
	//public static String FLASK_SERVER_URL = "http://54.180.83.249:5000/graph";
	
	public static List<SubscribeIncVO> divSsvoYYYYMM(SubscribeIncVO ssvo)
	{
		List<SubscribeIncVO> list = new ArrayList<SubscribeIncVO>();
		int start_yyyy = Integer.parseInt(ssvo.getStart_yyyymm().substring(0, 4));
		int start_mm = Integer.parseInt(ssvo.getStart_yyyymm().substring(4));
		int end_yyyy = Integer.parseInt(ssvo.getEnd_yyyymm().substring(0, 4));
		int end_mm = Integer.parseInt(ssvo.getEnd_yyyymm().substring(4));
		
		logger.info("start_yyyy >>> : " + start_yyyy);
		logger.info("start_mm >>> : " + start_mm);
		logger.info("end_yyyy >>> : " + end_yyyy);
		logger.info("end_mm >>> : " + end_mm);
		
		Date startDate = new Date(start_yyyy-1900, start_mm-1, 1);
		Date endDate = new Date(end_yyyy-1900, end_mm-1, 1);
		
		logger.info("startDate >>> : " + startDate);
		logger.info("endDate >>> : " + endDate);
		
		int monDiff = (end_yyyy * 12 + end_mm) -(start_yyyy * 12 + start_mm); //시작 ~ 끝 개월 차이 : 예)2001.04, 2002.04 = 12
		logger.info("monDiff >>> : " + monDiff);
		
		for(int i=0; i<=monDiff; i++)
		{
			Calendar cal = Calendar.getInstance();
			cal.setTime(startDate);
			cal.add(Calendar.MONTH, i);
			
			SubscribeIncVO tempVo = new SubscribeIncVO();
			tempVo.setYear(String.valueOf(cal.getTime().getYear()+1900));
			tempVo.setMon(String.valueOf(cal.getTime().getMonth()+1));
			
			logger.info("tempVO >>> : " + tempVo.toString());
			
			list.add(tempVo);
		}
		
		logger.info("list.size >>> : " + list.size());
		return list;
	}
	
	public static List<SignupIncVO> divSuvoYYYYMM(SignupIncVO suvo)
	{
		List<SignupIncVO> list = new ArrayList<SignupIncVO>();
		int start_yyyy = Integer.parseInt(suvo.getStart_yyyymm().substring(0, 4));
		int start_mm = Integer.parseInt(suvo.getStart_yyyymm().substring(4));
		int end_yyyy = Integer.parseInt(suvo.getEnd_yyyymm().substring(0, 4));
		int end_mm = Integer.parseInt(suvo.getEnd_yyyymm().substring(4));
		
		logger.info("start_yyyy >>> : " + start_yyyy);
		logger.info("start_mm >>> : " + start_mm);
		logger.info("end_yyyy >>> : " + end_yyyy);
		logger.info("end_mm >>> : " + end_mm);
		
		Date startDate = new Date(start_yyyy-1900, start_mm-1, 1);
		Date endDate = new Date(end_yyyy-1900, end_mm-1, 1);
		
		logger.info("startDate >>> : " + startDate);
		logger.info("endDate >>> : " + endDate);
		
		int monDiff = (end_yyyy * 12 + end_mm) -(start_yyyy * 12 + start_mm); //시작 ~ 끝 개월 차이 : 예)2001.04, 2002.04 = 12
		logger.info("monDiff >>> : " + monDiff);
		
		for(int i=0; i<=monDiff; i++)
		{
			Calendar cal = Calendar.getInstance();
			cal.setTime(startDate);
			cal.add(Calendar.MONTH, i);
			
			SignupIncVO tempVo = new SignupIncVO();
			tempVo.setYear(String.valueOf(cal.getTime().getYear()+1900));
			tempVo.setMon(String.valueOf(cal.getTime().getMonth()+1));
			
			logger.info("tempVO >>> : " + tempVo.toString());
			
			list.add(tempVo);
		}
		
		logger.info("list.size >>> : " + list.size());
		return list;
	}
	
	
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
