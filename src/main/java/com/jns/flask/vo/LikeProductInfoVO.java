package com.jns.flask.vo;

import org.json.simple.JSONObject;

public class LikeProductInfoVO { // 관심 상품 최저가 검색
	
	private String productId;	// 상품번호	
	private String title;		// 상품명
	private String lprice;		// 최저가
	
	public LikeProductInfoVO() {
		
	}

	public LikeProductInfoVO(String productId
						   , String title
						   , String lprice) {
		this.productId = productId;
		this.title = title;
		this.lprice = lprice;
	}

	// getter
	public String getProductId() {
		return productId;
	}

	public String getTitle() {
		return title;
	}

	public String getLprice() {
		return lprice;
	}
	
	// setter
	public void setProductId(String productId) {
		this.productId = productId;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setLprice(String lprice) {
		this.lprice = lprice;
	}
	
	
	@Override
	public String toString() {
		return "LikeProductInfoVO [productId=" + productId + ", title=" + title + ", lprice=" + lprice + "]";
	}
	
	@SuppressWarnings("unchecked")
	public JSONObject toJSONObject()
	{
		JSONObject json = new JSONObject();
		json.put("productId", productId);
		json.put("title", title);
		json.put("lprice", lprice);
		
		return json;
	}
}
