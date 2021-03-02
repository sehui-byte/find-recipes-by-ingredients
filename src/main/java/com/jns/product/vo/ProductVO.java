package com.jns.product.vo;

public class ProductVO {
	
	private String lpno;
	private String productId;
	private String link;
	private String image;
	private String lprice;
	private String hprice;
	private String title;
	private String mno;
	
	
	// 페이징 **
	private int pageSize;
	private int groupSize;
	private int curPage;
	private int totalCount;
	
	
	public ProductVO() {}
	
	public ProductVO(int pageSize, int groupSize, int curPage, int totalCount) {
	
		this.pageSize = pageSize;
		this.groupSize = groupSize;
		this.curPage = curPage;
		this.totalCount = totalCount;
	}
	
	
	//페이징
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
	
	
	
	public String getLpno() {
		return lpno;
	}
	public void setLpno(String lpno) {
		this.lpno = lpno;
	}
	public String getMno() {
		return mno;
	}
	public void setMno(String mno) {
		this.mno = mno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getProductId() {
		return productId;
	}
	public String getLink() {
		return link;
	}
	public String getImage() {
		return image;
	}
	public String getLprice() {
		return lprice;
	}
	public String getHprice() {
		return hprice;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public void setLprice(String lprice) {
		this.lprice = lprice;
	}
	public void setHprice(String hprice) {
		this.hprice = hprice;
	}
	@Override
	public String toString() {
		return "ProductVO [lpno=" + lpno + ", productId=" + productId + ", link=" + link + ", image=" + image
				+ ", lprice=" + lprice + ", hprice=" + hprice + ", title=" + title + ", mno=" + mno + "]";
	}
	
	

}
