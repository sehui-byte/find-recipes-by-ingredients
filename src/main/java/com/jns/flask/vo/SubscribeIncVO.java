package com.jns.flask.vo;

import org.json.simple.JSONObject;

public class SubscribeIncVO //Subscribe Increase trend : 구독 증가 추이 
{
	private String year;// 년
	private String mon;// 월
	private String inc;// 증가 수
	
	public SubscribeIncVO() 
	{

	}//Default Constructor
	
	public SubscribeIncVO(String year, String mon, String inc) {
		this.year = year;
		this.mon = mon;
		this.inc = inc;
	}

	public String getYear() {
		return year;
	}

	public String getMon() {
		return mon;
	}

	public String getInc() {
		return inc;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public void setMon(String mon) {
		this.mon = mon;
	}

	public void setInc(String inc) {
		this.inc = inc;
	}

	@Override
	public String toString() {
		return "SubscribeIncVO [year=" + year + ", mon=" + mon + ", inc=" + inc + "]";
	}
	
	@SuppressWarnings("unchecked")
	public JSONObject toJSONObject()
	{
		JSONObject json = new JSONObject();
		json.put("year", Integer.parseInt(year));
		json.put("mon", Integer.parseInt(mon));
		json.put("inc", Integer.parseInt(inc));
		
		return json;
	}
	
	
}
