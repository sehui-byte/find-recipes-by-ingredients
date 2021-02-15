package com.jns.chefboard.vo;

public class ChefBoardVO {
	
	private String bno;
	private String btype;
	private String btitle;
	private String bcontent;
	private String bwriter;
	private String bfile;
	private String binsertdate;
	private String bupdatedate;
	private String bview;
	private String bdeleteyn;
	private String bhits;
	
	public ChefBoardVO() {}
	
	public ChefBoardVO(String bno, String btype, String btitle, String bcontent
					  ,String bwriter, String bfile, String binsertdate, String bupdatedate
					  ,String bview, String bdeleteyn, String bhits) {
		this.bno = bno;
		this.btype = btype;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.bwriter = bwriter;
		this.bfile = bfile;
		this.binsertdate = binsertdate;
		this.bupdatedate = bupdatedate;
		this.bview = bview;
		this.bdeleteyn = bdeleteyn;
		this.bhits = bhits;
	}



	public String getBno() {
		return bno;
	}
	public void setBno(String bno) {
		this.bno = bno;
	}
	public String getBtype() {
		return btype;
	}
	public void setBtype(String btype) {
		this.btype = btype;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public String getBwriter() {
		return bwriter;
	}
	public void setBwriter(String bwriter) {
		this.bwriter = bwriter;
	}
	public String getBfile() {
		return bfile;
	}
	public void setBfile(String bfile) {
		this.bfile = bfile;
	}
	public String getBinsertdate() {
		return binsertdate;
	}
	public void setBinsertdate(String binsertdate) {
		this.binsertdate = binsertdate;
	}
	public String getBupdatedate() {
		return bupdatedate;
	}
	public void setBupdatedate(String bupdatedate) {
		this.bupdatedate = bupdatedate;
	}
	public String getBview() {
		return bview;
	}
	public void setBview(String bview) {
		this.bview = bview;
	}
	public String getBdeleteyn() {
		return bdeleteyn;
	}
	public void setBdeleteyn(String bdeleteyn) {
		this.bdeleteyn = bdeleteyn;
	}
	public String getBhits() {
		return bhits;
	}
	public void setBhits(String bhits) {
		this.bhits = bhits;
	}
}
