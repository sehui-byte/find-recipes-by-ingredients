package com.jns.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jns.member.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	Logger logger = Logger.getLogger(MemberDAOImpl.class);

	@Autowired(required = false)
	private SqlSession sqlSession;

	@Override
	public MemberVO memberLogin(MemberVO mvo) {
		
		logger.info(mvo.getMid());
		

		return sqlSession.selectOne("memberLogin", mvo);
	}

}