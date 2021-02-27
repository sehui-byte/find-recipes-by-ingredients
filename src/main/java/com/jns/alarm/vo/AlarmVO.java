package com.jns.alarm.vo;

public class AlarmVO {
	
	private String ano;
	private String sender;
	private String receiver;
	private String type;
	private String insertdate;
	private String readyn;
	
	
	
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
}
