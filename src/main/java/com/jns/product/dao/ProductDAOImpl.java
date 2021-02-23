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

	//관심상품 목록조회
	@Override
	public List<ProductVO> LikeProductSelectAll(ProductVO pvo) {
		return sqlSession.selectList("LikeProductSelectAll",pvo);
	}

	//관심상품 등록
	@Override
	public int likeProductInsert(ProductVO pvo) {
		return (Integer)sqlSession.insert("likeProductInsert",pvo);
	}

	//관심상품 삭제
	@Override
	public int likeProductDelete(ProductVO pvo) {
		return (Integer)sqlSession.delete("likeProductDelete",pvo);
	}

	//로그인한 유저의 관심상품의 productId만 select
	@Override
	public List<ProductVO> likpProductIdSelectAll(ProductVO pvo) {
		return sqlSession.selectList("likpProductIdSelectAll",pvo);
	}
}
