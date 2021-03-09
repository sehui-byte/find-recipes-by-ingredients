package com.jns.alarm.vo;

public class AlarmVO {
	
	private String ano;
	private String sender;
	private String receiver;
	private String type;
	private String insertdate;
	private String readyn;
	private String mnick;
	
	private int pageSize;
	private int groupSize;
	private int curPage;
	private int totalCount;
	
	
	
	public AlarmVO() {
		
	}
	

	public AlarmVO(int pageSize, int groupSize, int curPage, int totalCount) {
	
		this.pageSize = pageSize;
		this.groupSize = groupSize;
		this.curPage = curPage;
		this.totalCount = totalCount;
	}
	
	public String getMnick() {
		return mnick;
	}

	public void setMnick(String mnick) {
		this.mnick = mnick;
	}

	public String getReadyn() {
		return readyn;
	}
	public void setReadyn(String readyn) {
		this.readyn = readyn;
	}
	public String getInsertdate() {
		return insertdate;
	}
	public void setInsertdate(String insertdate) {
		this.insertdate = insertdate;
	}
	public String getAno() {
		return ano;
	}
	public String getSender() {
		return sender;
	}
	public String getReceiver() {
		return receiver;
	}
	public String getType() {
		return type;
	}
	public void setAno(String ano) {
		this.ano = ano;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getPageSize() {
		return pageSize;
	}
	public int getGroupSize() {
		return groupSize;
	}
	public int getCurPage() {
		return curPage;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public void setGroupSize(int groupSize) {
		this.groupSize = groupSize;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	
	
}
