package com.jns.product.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jns.product.vo.ProductVO;

//@Repository
//이거 쓰면 오류 나서 일단 주석처리함 ㅠㅠ
public class ProductDAOImpl implements ProductDAO {
	
	@Autowired(required=false)
	private SqlSession sqlSession;

	@Override
	public List<ProductVO> LikeProductSelectAll() {
		return sqlSession.selectList("LikeProductSelectAll");
	}

	@Override
	public int likeProductInsert(ProductVO pvo) {
		return (Integer)sqlSession.insert("likeProductInsert",pvo);
	}
}
