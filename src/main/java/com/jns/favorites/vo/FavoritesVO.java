package com.jns.favorites.vo;

public class FavoritesVO {

	private String fno;
	private String mno;
	private String rbno;
	private String rcp_seq;
	private String insertdate;

	// 레시피 타입 설정
	private String recipeType;

	public FavoritesVO() {

	}

	public FavoritesVO(String fno, String mno, String rbno, String rcp_seq, String insertdate, String recipeType) {
		this.fno = fno;
		this.mno = mno;
		this.rbno = rbno;
		this.rcp_seq = rcp_seq;
		this.insertdate = insertdate;
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

	public void setRecipeType(String recipeType) {
		this.recipeType = recipeType;
	}
	
	
	
	
	
	
}
