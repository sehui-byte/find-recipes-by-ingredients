package com.jns.chefboard.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jns.chefboard.vo.ChefBoardVO;

@Repository
public class ChefBoardDAOImpl implements ChefBoardDAO {

	public SqlSessionTemplate sqlSession;
	
	@Override
	public List<ChefBoardVO> boardList(ChefBoardVO cbvo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int boardInsert(ChefBoardVO cbvo) {
		// TODO Auto-generated method stub
		return (Integer)sqlSession.insert("boardInsert", cbvo);
	}

	@Override
	public ChefBoardVO boardDetail(ChefBoardVO cbvo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int boardUpdate(ChefBoardVO cbvo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int boardDelete(ChefBoardVO cbvo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
