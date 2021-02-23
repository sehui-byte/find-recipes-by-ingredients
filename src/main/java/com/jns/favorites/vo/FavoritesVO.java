package com.jns.favorites.vo;

public class FavoritesVO {

	private String fno;
	private String mno;
	private String rbno;
	private String rcp_seq;
	private String insertdate;
	
	
	// 검색기능
	private String keyfilter;
	private String keyword;
	private String startdate;
	private String enddate;	

	// 레시피 타입 설정
	private String recipeType;

	public FavoritesVO() {

	}

	public FavoritesVO(String fno, String mno, String rbno, String rcp_seq, String insertdate, String keyfilter,
			String keyword, String startdate, String enddate, String recipeType) {
		this.fno = fno;
		this.mno = mno;
		this.rbno = rbno;
		this.rcp_seq = rcp_seq;
		this.insertdate = insertdate;
		this.keyfilter = keyfilter;
		this.keyword = keyword;
		this.startdate = startdate;
		this.enddate = enddate;
		this.recipeType = recipeType;
	}

	public String getFno() {
		return fno;
	}

	public String getMno() {
		return mno;
	}

	public String getRbno() {
		return rbno;
	}

	public String getRcp_seq() {
		return rcp_seq;
	}

	public String getInsertdate() {
		return insertdate;
	}

	public String getKeyfilter() {
		return keyfilter;
	}

	public String getKeyword() {
		return keyword;
	}

	public String getStartdate() {
		return startdate;
	}

	public String getEnddate() {
		return enddate;
	}

	public String getRecipeType() {
		return recipeType;
	}

	public void setFno(String fno) {
		this.fno = fno;
	}

	public void setMno(String mno) {
		this.mno = mno;
	}

	public void setRbno(String rbno) {
		this.rbno = rbno;
	}

	public void setRcp_seq(String rcp_seq) {
		this.rcp_seq = rcp_seq;
	}

	public void setInsertdate(String insertdate) {
		this.insertdate = insertdate;
	}

	public void setKeyfilter(String keyfilter) {
		this.keyfilter = keyfilter;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}

	public void setRecipeType(String recipeType) {
		this.recipeType = recipeType;
	}
}
