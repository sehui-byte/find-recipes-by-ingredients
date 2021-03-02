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
	
	//**************************
	//검색 설정
	private String keyfilter;
	private String keyword;
	private String startdate;
	private String enddate;	
	
	// 페이징 *************************************************
	private int pageSize;
	private int groupSize;
	private int curPage;
	private int totalCount;


	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getGroupSize() {
		return groupSize;
	}

	public void setGroupSize(int groupSize) {
		this.groupSize = groupSize;
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	
	
	//**************************************************************
	
	
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
	//**************************************************************	
	
	
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
