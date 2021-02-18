package com.jns.product.service;

import java.util.List;

import com.jns.product.vo.ProductVO;

public interface ProductService {
	//네이버 api이용하여 json으로 데이터 받는다
	public String naverSearchApi(String keyword);
	public List<ProductVO> likeProductSelectAll();
	public int likeProductInsert(ProductVO pvo);
	public int likeProductDelete(ProductVO pvo);
}
