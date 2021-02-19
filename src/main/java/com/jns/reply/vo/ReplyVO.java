package com.jns.reply.vo;

public class ReplyVO {
	private String rno;
	private String mno;
	private String bno;
	private String rbno;
	private String rcontent;
	private String rwriter;
	private String rinsertdate;
	private String rupdatedate;
	private String rdeleteyn;
	
	public ReplyVO() {}
	
	public ReplyVO(String rno, String mno, String bno, String rbno
				  ,String rcontent, String rwriter, String rinsertdate
				  ,String rupdatedate, String rdeleteyn) {
		this.rno = rno;
		this.mno = mno;
		this.bno = bno;
		this.rbno = rbno;
		this.rcontent = rcontent;
		this.rwriter = rwriter;
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

	public String getMno() {
		return mno;
	}

	public void setMno(String mno) {
		this.mno = mno;
	}

	public String getBno() {
		return bno;
	}

	public void setBno(String bno) {
		this.bno = bno;
	}

	public String getRbno() {
		return rbno;
	}

	public void setRbno(String rbno) {
		this.rbno = rbno;
	}

	public String getRcontent() {
		return rcontent;
	}

	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}

	public String getRwriter() {
		return rwriter;
	}

	public void setRwriter(String rwriter) {
		this.rwriter = rwriter;
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
