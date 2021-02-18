package com.jns.product.dao;

import java.util.List;

import com.jns.product.vo.ProductVO;

public interface ProductDAO {

	public List<ProductVO> LikeProductSelectAll();
	public int likeProductInsert(ProductVO pvo);
	public int likeProductDelete(ProductVO pvo);
}
