package com.jns.chabun.dao;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jns.member.vo.MemberVO;
import com.jns.board.vo.BoardVO;

@Repository
public class ChabunDAOImpl implements ChabunDAO {
	
	private Logger logger = Logger.getLogger(ChabunDAOImpl.class);
	
	@Autowired(required=false)
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


	@Override
	public BoardVO getQnABoardChabun() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("getQnaBoardChabun");
	}

}
