package com.jns.product.service;

import java.util.List;

import com.jns.product.vo.ProductVO;

public interface ProductService {
	//네이버 api이용하여 json으로 데이터 받아 jsp 페이지로 넘겨준다
	public String naverSearchApi(String keyword);
	//관심상품 목록 조회
	public List<ProductVO> likeProductSelectAll();
	//관심상품 등록
	public int likeProductInsert(ProductVO pvo);
	//관심상품 삭제
	public int likeProductDelete(ProductVO pvo);
	//최저가 변동 체크
	public void lpriceChk();
}
