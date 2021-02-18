package com.jns.product.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jns.product.vo.ProductVO;

@Repository
public class ProductDAOImpl implements ProductDAO {
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;

	@Override
	public List<ProductVO> LikeProductSelectAll() {
		return sqlSession.selectList("LikeProductSelectAll");
	}

}
