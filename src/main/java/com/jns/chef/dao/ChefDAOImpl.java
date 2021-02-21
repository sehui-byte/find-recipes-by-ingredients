package com.jns.chef.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jns.chef.vo.ChefVO;

@Repository
public class ChefDAOImpl implements ChefDAO {

	public SqlSessionTemplate sqlSession;
	
	@Override
	public List<ChefVO> chefSelectAll(ChefVO cvo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int chefInsert(ChefVO cvo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("chefInsert");
	}

	@Override
	public int chefDelete(ChefVO cvo) {
		// TODO Auto-generated method stub
		return sqlSession.update("chefDelete");
	}

}
