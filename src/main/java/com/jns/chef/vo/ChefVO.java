package com.jns.chef.vo;

import com.jns.member.vo.MemberVO;

public class ChefVO {

	private String ino;
	private String mno;
	private String iinsertdate;
	private String iupdatedate;
	private String ideleteyn;
	
	// Member Table JOIN ***********************************************
	private String mlevel;
	private String mid;
	private String mname;
	private String mnick;

	public String getMlevel() {
		return mlevel;
	}

	public void setMlevel(String mlevel) {
		this.mlevel = mlevel;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getMnick() {
		return mnick;
	}

	public void setMnick(String mnick) {
		this.mnick = mnick;
	}

	//***************************************************************	
	
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
