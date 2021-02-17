package com.jns.reply.vo;

public class ReplyVO {
	private String rno;
	private String rcontent;
	private String bno;
	private String mnick;
	private String rinsertdate;
	private String rupdatedate;
	private String rdeleteyn;
	
	public ReplyVO() {}
	
	
	public ReplyVO(String rno, String rcontent, String bno
				  ,String mnick, String rinsertdate, String rupdatedate
				  ,String rdeleteyn) {
		this.rno = rno;
		this.rcontent = rcontent;
		this.bno = bno;
		this.mnick = mnick;
		this.rinsertdate = rinsertdate;
		this.rupdatedate = rupdatedate;
		this.rdeleteyn = rdeleteyn;
	}

	public String getRno() {
		return rno;
	}
	public void setRno(String rno) {
		this.rno = rno;
	}
	public String getRcontent() {
		return rcontent;
	}
	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}
	public String getBno() {
		return bno;
	}
	public void setBno(String bno) {
		this.bno = bno;
	}
	public String getMnick() {
		return mnick;
	}
	public void setMnick(String mnick) {
		this.mnick = mnick;
	}
	public String getRinsertdate() {
		return rinsertdate;
	}
	public void setRinsertdate(String rinsertdate) {
		this.rinsertdate = rinsertdate;
	}
	public String getRupdatedate() {
		return rupdatedate;
	}
	public void setRupdatedate(String rupdatedate) {
		this.rupdatedate = rupdatedate;
	}
	public String getRdeleteyn() {
		return rdeleteyn;
	}
	public void setRdeleteyn(String rdeleteyn) {
		this.rdeleteyn = rdeleteyn;
	}
	
	
}
