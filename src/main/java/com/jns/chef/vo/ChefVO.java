package com.jns.chef.vo;

public class ChefVO {

	private String ino;
	private String mno;
	private String iinsertdate;
	private String iupdatedate;
	private String ideleteyn;
	
	public ChefVO() {}
	
	public ChefVO(String ino, String mno, String iinsertdate
			     ,String iupdatedate, String ideleteyn) {
		this.ino = ino;
		this.mno = mno;
		this.iinsertdate = iinsertdate;
		this.iupdatedate = iupdatedate;
		this.ideleteyn = ideleteyn;
	}

	public String getIno() {
		return ino;
	}
	public void setIno(String ino) {
		this.ino = ino;
	}
	public String getMno() {
		return mno;
	}
	public void setMno(String mno) {
		this.mno = mno;
	}
	public String getIinsertdate() {
		return iinsertdate;
	}
	public void setIinsertdate(String iinsertdate) {
		this.iinsertdate = iinsertdate;
	}
	public String getIupdatedate() {
		return iupdatedate;
	}
	public void setIupdatedate(String iupdatedate) {
		this.iupdatedate = iupdatedate;
	}
	public String getIdeleteyn() {
		return ideleteyn;
	}
	public void setIdeleteyn(String ideleteyn) {
		this.ideleteyn = ideleteyn;
	}
	
	
}
