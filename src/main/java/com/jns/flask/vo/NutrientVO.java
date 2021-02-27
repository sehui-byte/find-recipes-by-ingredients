package com.jns.flask.vo;

import org.json.simple.JSONObject;

public class NutrientVO 
{
	private String eng;// 열량
	private String car;// 탄수화물
	private String pro;// 단백질
	private String fat;// 지방
	private String na;// 나트륨
	
	// Defalut Constructor
	public NutrientVO() {
	
	}

	public NutrientVO(String eng, String car, String pro, String fat, String na) {
		this.eng = eng;
		this.car = car;
		this.pro = pro;
		this.fat = fat;
		this.na = na;
	}

	public String getEng() {
		return eng;
	}

	public String getCar() {
		return car;
	}

	public String getPro() {
		return pro;
	}

	public String getFat() {
		return fat;
	}

	public String getNa() {
		return na;
	}

	public void setEng(String eng) {
		this.eng = eng;
	}

	public void setCar(String car) {
		this.car = car;
	}

	public void setPro(String pro) {
		this.pro = pro;
	}

	public void setFat(String fat) {
		this.fat = fat;
	}

	public void setNa(String na) {
		this.na = na;
	}

	@Override
	public String toString() {
		return "NutrientVO [eng=" + eng + ", car=" + car + ", pro=" + pro + ", fat=" + fat + ", na=" + na + "]";
	}
	
	@SuppressWarnings("unchecked")
	public JSONObject toJSONObject()
	{
		JSONObject json = new JSONObject();
		json.put("eng", Integer.parseInt(eng));
		json.put("car", Integer.parseInt(car));
		json.put("pro", Integer.parseInt(pro));
		json.put("fat", Integer.parseInt(fat));
		json.put("na", Integer.parseInt(na));
		
		
		return json;
	}
}
