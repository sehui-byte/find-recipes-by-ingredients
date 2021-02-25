package com.jns.chefboard.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jns.chefboard.vo.ChefBoardVO;
import com.jns.favorites.vo.FavoritesVO;
import com.jns.recipeboard.vo.RecipeBoardVO;

@Repository
public class ChefBoardDAOImpl implements ChefBoardDAO {

	public SqlSessionTemplate sqlSession;

	@Override
	public List<ChefBoardVO> chefBoardSelectAll(ChefBoardVO cbvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("chefBoardSelectAll");
	}

	@Override
	public List<ChefBoardVO> chefBoardSelect(ChefBoardVO cbvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("chefBoardSelect");
	}

	@Override
	public int boardInsert(ChefBoardVO cbvo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("boardInsert");
	}

	@Override
	public int boardUpdate(ChefBoardVO rbvo) {
		// TODO Auto-generated method stub
		return sqlSession.update("boardUpdate");
	}

	@Override
	public int boardDelete(ChefBoardVO cbvo) {
		// TODO Auto-generated method stub
		return sqlSession.update("boardDelete");
	}

	@Override
	public int chefBoardViewsPP(ChefBoardVO cbvo) {
		// TODO Auto-generated method stub
		return sqlSession.update("chefBoardViewsPP");
	}

	@Override
	public int chefBoardHitsPP(ChefBoardVO cbvo) {
		// TODO Auto-generated method stub
		return sqlSession.update("chefBoardHitsPP");
	}

	@Override
	public List<ChefBoardVO> chefBoardSelectAllPage(ChefBoardVO cbvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("chefBoardSelectAllPage");
	}

	@Override
	public int chefBoardHitsCount(FavoritesVO fvo) {
	
		return sqlSession.selectOne("chefBoardHitsCount", fvo);
	}

}
