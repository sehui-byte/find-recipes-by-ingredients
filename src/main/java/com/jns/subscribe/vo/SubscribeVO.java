package com.jns.subscribe.vo;

public class SubscribeVO {
	
	private String sno;
	private String mno;
	private String ino;
	private String sinsertdate;
	private String supdatedate;
	private String sdeleteyn;
	
	// 구독 관련 JOIN *************************************************
	private String mid;
	private String chefnick;
	
	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getChefnick() {
		return chefnick;
	}

	public void setChefnick(String chefnick) {
		this.chefnick = chefnick;
	}
	
	// *************************************************************
	
	// 구독자 수 확인하기 ******************************************
	private int subCount;
	
	public int getSubCount() {
		return subCount;
	}

	public void setSubCount(int subCount) {
		this.subCount = subCount;
	}
	
	// *************************************************************
	
	
	public SubscribeVO() {
		
	}
	
	public SubscribeVO(String sno, String mno, String ino
					  ,String sinsertdate, String supdatedate, String sdeleteyn) {
		this.sno = sno;
		this.mno = mno;
		this.ino = ino;
		this.sinsertdate = sinsertdate;
		this.supdatedate = supdatedate;
		this.sdeleteyn = sdeleteyn;
	}

	public String getSno() {
		return sno;
	}
	public void setSno(String sno) {
		this.sno = sno;
	}
	public String getMno() {
		return mno;
	}
	public void setMno(String mno) {
		this.mno = mno;
	}
	public String getIno() {
		return ino;
	}
	public void setIno(String ino) {
		this.ino = ino;
	}
	public String getSinsertdate() {
		return sinsertdate;
	}
	public void setSinsertdate(String sinsertdate) {
		this.sinsertdate = sinsertdate;
	}
	public String getSupdatedate() {
		return supdatedate;
	}
	public void setSupdatedate(String supdatedate) {
		this.supdatedate = supdatedate;
	}
	public String getSdeleteyn() {
		return sdeleteyn;
	}
	public void setSdeleteyn(String sdeleteyn) {
		this.sdeleteyn = sdeleteyn;
	}
	
	
}