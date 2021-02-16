package com.jns.qna.vo;

public class QnAVO {

	private String sno;
	private String stitle;
	private String scontent;
	private String swriter;
	private String sfile;
	private String sinsertdate;
	private String supdatedate;
	private String sview;
	private String sdeleteyn;
	
	private String page;
	private String pagesize;
	private String groupsize;
	private String curpage;
	private String totalcount;
	
	public QnAVO() {
		
	}

	

	public QnAVO(String sno
				,String stitle
				,String scontent
				,String swriter
				,String sfile
				,String sinsertdate
				,String supdatedate
				,String sview
				,String sdeleteyn
				,String page
				,String pagesize
				,String groupsize
				,String curpage
				,String totalcount) {
		
		this.sno = sno;
		this.stitle = stitle;
		this.scontent = scontent;
		this.swriter = swriter;
		this.sfile = sfile;
		this.sinsertdate = sinsertdate;
		this.supdatedate = supdatedate;
		this.sview = sview;
		this.sdeleteyn = sdeleteyn;
		this.pagesize = pagesize;
		this.groupsize = groupsize;
		this.curpage = curpage;
		this.totalcount = totalcount;
	}



	public String getPage() {
		return page;
	}



	public void setPage(String page) {
		this.page = page;
	}



	public String getSno() {
		return sno;
	}



	public void setSno(String sno) {
		this.sno = sno;
	}



	public String getStitle() {
		return stitle;
	}



	public void setStitle(String stitle) {
		this.stitle = stitle;
	}



	public String getScontent() {
		return scontent;
	}



	public void setScontent(String scontent) {
		this.scontent = scontent;
	}



	public String getSwriter() {
		return swriter;
	}



	public void setSwriter(String swriter) {
		this.swriter = swriter;
	}



	public String getSfile() {
		return sfile;
	}



	public void setSfile(String sfile) {
		this.sfile = sfile;
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



	public String getSview() {
		return sview;
	}



	public void setSview(String sview) {
		this.sview = sview;
	}



	public String getSdeleteyn() {
		return sdeleteyn;
	}



	public void setSdeleteyn(String sdeleteyn) {
		this.sdeleteyn = sdeleteyn;
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



	public void setStart_row(String string) {
		// TODO Auto-generated method stub
		
	}



	public void setEnd_row(String string) {
		// TODO Auto-generated method stub
		
	}


}
