package com.jns.favorites.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jns.favorites.vo.FavoritesVO;

@Repository
public class FavoritesDAOImpl implements FavoritesDAO {

	@Autowired(required = false)
	private SqlSession sqlSession;

	@Override
	public int myFavRecipeCheck(FavoritesVO fvo) {

		return (Integer) sqlSession.selectOne("myFavRecipeCheck", fvo);
	}

	@Override
	public int myFavRecipeInsert(FavoritesVO fvo) {

		return sqlSession.update("myFavRecipeInsert", fvo);
	}

	@Override
	public int myFavRecipeDelete(FavoritesVO fvo) {

		return sqlSession.delete("myFavRecipeDelete", fvo);
	}

}
