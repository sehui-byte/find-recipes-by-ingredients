package com.jns.notice.vo;

public class NoticeVO {

	private String nno;
	private String ntitle;
	private String ncontent;
	private String nwriter;
	private String nfile;
	private String ninsertdate;
	private String nupdatedate;
	private String nview;
	private String ndeleteyn;
	
	private String page;
	private String pagesize;
	private String groupsize;
	private String curpage;
	private String totalcount;
	
	public NoticeVO() {
		
	}

	public NoticeVO( String nno
					,String ntitle
					,String ncontent
					,String nwriter
					,String nfile
					,String ninsertdate
					,String nupdatedate
					,String nview
					,String ndeleteyn
					,String page
					,String pagesize
					,String groupsize
					,String curpage
					,String totalcount) {
		
		this.nno = nno;
		this.ntitle = ntitle;
		this.ncontent = ncontent;
		this.nwriter = nwriter;
		this.nfile = nfile;
		this.ninsertdate = ninsertdate;
		this.nupdatedate = nupdatedate;
		this.nview = nview;
		this.ndeleteyn = ndeleteyn;
		this.page = page;
		this.pagesize = pagesize;
		this.groupsize = groupsize;
		this.curpage = curpage;
		this.totalcount = totalcount;
	}

	public String getNno() {
		return nno;
	}

	public void setNno(String nno) {
		this.nno = nno;
	}

	public String getNtitle() {
		return ntitle;
	}

	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}

	public String getNcontent() {
		return ncontent;
	}

	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}

	public String getNwriter() {
		return nwriter;
	}

	public void setNwriter(String nwriter) {
		this.nwriter = nwriter;
	}

	public String getNfile() {
		return nfile;
	}

	public void setNfile(String nfile) {
		this.nfile = nfile;
	}

	public String getNinsertdate() {
		return ninsertdate;
	}

	public void setNinsertdate(String ninsertdate) {
		this.ninsertdate = ninsertdate;
	}

	public String getNupdatedate() {
		return nupdatedate;
	}

	public void setNupdatedate(String nupdatedate) {
		this.nupdatedate = nupdatedate;
	}

	public String getNview() {
		return nview;
	}

	public void setNview(String nview) {
		this.nview = nview;
	}

	public String getNdeleteyn() {
		return ndeleteyn;
	}

	public void setNdeleteyn(String ndeleteyn) {
		this.ndeleteyn = ndeleteyn;
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
	
}
