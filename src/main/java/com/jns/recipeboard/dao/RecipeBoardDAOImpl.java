package com.jns.recipeboard.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.jns.favorites.vo.FavoritesVO;
import com.jns.recipeboard.vo.RecipeBoardVO;

public class RecipeBoardDAOImpl implements RecipeBoardDAO {
	@Autowired(required = false)
	private SqlSession sqlSession;

	@Override
	public List<RecipeBoardVO> recipeBoardSelectAll() {
		return sqlSession.selectList("recipeBoardSelectAll");
	}

	@Override
	public RecipeBoardVO recipeBoardSelect(RecipeBoardVO rbvo) 
	{
		return sqlSession.selectOne("recipeBoardSelect", rbvo);
	}

	@Override
	public boolean recipeBoardInsert(RecipeBoardVO rbvo) 
	{
		return sqlSession.insert("recipeBoardInsert", rbvo) > 0;
	}

	@Override
	public boolean recipeBoardUpdate(RecipeBoardVO rbvo) 
	{
		return sqlSession.update("recipeBoardUpdate", rbvo) > 0;
	}

	@Override
	public boolean recipeBoardDelete(RecipeBoardVO rbvo) 
	{
		return sqlSession.update("recipeBoardDelete", rbvo) > 0;
	}

	@Override
	public boolean recipeBoardViewsPP(RecipeBoardVO rbvo) 
	{	
		return sqlSession.update("recipeBoardViewsPP", rbvo) > 0;
	}

	@Override
	public boolean recipeBoardHitsPP(RecipeBoardVO rbvo) 
	{
		return sqlSession.update("recipeBoardHitsPP", rbvo) > 0;
	}
}
