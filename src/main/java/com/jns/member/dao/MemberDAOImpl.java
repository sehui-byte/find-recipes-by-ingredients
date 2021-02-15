package com.jns.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jns.member.vo.MemberDetailsVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Autowired(required=false)
	private SqlSession sqlSession;

	@Override
	public MemberDetailsVO memberLogin(MemberDetailsVO mvo) {
		
		return sqlSession.selectOne("memgerLogin", mvo);
	}

}