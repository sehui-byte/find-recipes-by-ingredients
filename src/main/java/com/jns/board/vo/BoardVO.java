package com.jns.board.vo;

public class BoardVO {

	private String mno;
	private String bno;
	private String btype;
	private String btitle;
	private String bcontent;
	private String mnick;
	private String bfile;
	private String binsertdate;
	private String bupdatedate;
	private String bdeleteyn;
	private String bviews;
	private String bhits;
	
	
	private String page;
	private String pagesize;
	private String groupsize;
	private String curpage;
	private String totalcount;
	
	
	private String keyfilter;
	private String keyword;
	private String startdate;
	private String enddate;	
	
	public BoardVO() {
		
	}

	public BoardVO(String mno, String bno, String btype, String btitle, String bcontent, String mnick, String bfile,
			String binsertdate, String bupdatedate, String bdeleteyn, String bviews, String page, String pagesize,
			String groupsize, String curpage, String totalcount, String bhits
		   ,String keyfilter
		   ,String keyword
		   ,String startdate
		   ,String enddate) {
		
		this.mno = mno;
		this.bno = bno;
		this.btype = btype;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.mnick = mnick;
		this.bfile = bfile;
		this.binsertdate = binsertdate;
		this.bupdatedate = bupdatedate;
		this.bdeleteyn = bdeleteyn;
		this.bviews = bviews;
		this.bhits = bhits;
		
		this.page = page;
		this.pagesize = pagesize;
		this.groupsize = groupsize;
		this.curpage = curpage;
		this.totalcount = totalcount;
		
		this.keyfilter = keyfilter;
		this.keyword = keyword;
		this.startdate = startdate;
		this.enddate = enddate;
				
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

	public String getBdeleteyn() {
		return bdeleteyn;
	}

	public void setBdeleteyn(String bdeleteyn) {
		this.bdeleteyn = bdeleteyn;
	}

	public String getBviews() {
		return bviews;
	}

	public void setBviews(String bviews) {
		this.bviews = bviews;
	}

	public String getBhits() {
		return bhits;
	}

	public void setBhits(String bhits) {
		this.bhits = bhits;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public String getPagesize() {
		return pagesize;
	}

	public void setPagesize(String pagesize) {
		this.pagesize = pagesize;
	}

	public String getGroupsize() {
		return groupsize;
	}

	public void setGroupsize(String groupsize) {
		this.groupsize = groupsize;
	}

	public String getCurpage() {
		return curpage;
	}

	public void setCurpage(String curpage) {
		this.curpage = curpage;
	}

	public String getTotalcount() {
		return totalcount;
	}

	public void setTotalcount(String totalcount) {
		this.totalcount = totalcount;
	}

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


}
