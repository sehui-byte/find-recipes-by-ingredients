package com.jns.chabun.dao;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jns.alarm.vo.AlarmVO;
import com.jns.board.vo.BoardVO;
import com.jns.chef.vo.ChefVO;
import com.jns.chefboard.vo.ChefBoardVO;
import com.jns.favorites.vo.FavoritesVO;
import com.jns.member.vo.MemberVO;
import com.jns.product.vo.ProductVO;
import com.jns.recipeboard.vo.RecipeBoardVO;
import com.jns.reply.vo.ReplyVO;
import com.jns.subscribe.vo.SubscribeVO;

@Repository
public class ChabunDAOImpl implements ChabunDAO {

	private Logger logger = Logger.getLogger(ChabunDAOImpl.class);

	@Autowired(required = false)
	private SqlSessionTemplate sqlSession;

	@Override
	public MemberVO getMemberChabun() {
		// TODO Auto-generated method stub

		logger.info("채번 호출");

		return sqlSession.selectOne("getMemberChabun");
	}

	@Override
	public BoardVO getNoticeChabun() {

		// TODO Auto-generated method stub
		return sqlSession.selectOne("getNoticeChabun");
	}

	public ChefBoardVO getBoardChabun() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("getBoardChabun");

	}

	@Override
	public BoardVO getQnABoardChabun() {

		// TODO Auto-generated method stub
		return sqlSession.selectOne("getQnABoardChabun");
	}

	@Override
	public ReplyVO getReplyChabun() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("getReplyChabun");
	}

	@Override
	public RecipeBoardVO getRecipeBoardChabun() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("getRecipeBoardChabun");
	}

	@Override
	public ChefVO getChefChabun() {

		return sqlSession.selectOne("getChefChabun");
	}

	@Override
	public ProductVO getLikeProductChabun() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("getLikeProductChabun");
	}

	@Override
	public SubscribeVO getSubscribeChabun() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("getSubscribeChabun");
	}

	@Override
	public FavoritesVO getFavoritesChabun() {

		return sqlSession.selectOne("getFavoritesChabun");
	}

	@Override
	public AlarmVO getAlarmChabun() {
		return sqlSession.selectOne("getAlarmChabun");
	}

}
