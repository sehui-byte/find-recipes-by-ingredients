package com.jns.chefboard.vo;

public class ChefBoardVO {
	
	private String bno;
	private String btype;
	private String btitle;
	private String bcontent;
	private String mnick;
	private String bfile;
	private String binsertdate;
	private String bupdatedate;
	private String bview;
	private String bdeleteyn;
	private String bhits;

	//**************************
	//검색 설정
	private String keyfilter;
	private String keyword;
	private String startdate;
	private String enddate;	
	
	public String getKeyfilter() {
		return keyfilter;
	}

	public void setKeyfilter(String keyfilter) {
		this.keyfilter = keyfilter;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getStartdate() {
		return startdate;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public String getEnddate() {
		return enddate;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	//**************************	

	public ChefBoardVO() {}
	
	public ChefBoardVO(String bno, String btype, String btitle, String bcontent
					  ,String mnick, String bfile, String binsertdate, String bupdatedate
					  ,String bview, String bdeleteyn, String bhits) {
		this.bno = bno;
		this.btype = btype;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.mnick = mnick;
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
	public String getMnick() {
		return mnick;
	}
	public void setMnick(String mnick) {
		this.mnick = mnick;
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
