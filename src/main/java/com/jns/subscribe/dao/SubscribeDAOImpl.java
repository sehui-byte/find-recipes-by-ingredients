package com.jns.subscribe.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jns.subscribe.vo.SubscribeVO;

@Repository
public class SubscribeDAOImpl implements SubscribeDAO {

	public SqlSessionTemplate sqlSession;
	
	@Override
	public List<SubscribeVO> mySubList(SubscribeVO svo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mySubList");
	}

	@Override
	public int chefSubCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int subInsert(SubscribeVO svo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("subInsert");
	}

	@Override
	public int subDelete(SubscribeVO svo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<SubscribeVO> subRank(SubscribeVO svo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<SubscribeVO> subCheck(SubscribeVO svo) {
		// TODO Auto-generated method stub
		return null;
	}

}
