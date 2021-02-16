package com.jns.member.dao;

import java.util.List;

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

	// 회원 전체 목록 조회
	@Override
	public List<MemberVO> memberSelectAll(MemberVO mvo) {
		// TODO Auto-generated method stub

		System.out.println("목록 조회 시작");

		logger.info("memberDAOIMpl >>> : SelectAll  함수 시작 ");
		logger.info("mvo >>> : " + mvo);

		return sqlSession.selectList("MemberSelectAll", mvo);
	}

	// 회원 선택 조회
	@Override
	public List<MemberVO> memberSelect(MemberVO mvo) {
		// TODO Auto-generated method stub

		logger.info("memberDAOIMpl >>> : Select  함수 시작 ");
		logger.info("mvo >>> : " + mvo);
		return sqlSession.selectList("MemberSelect", mvo);
	}

	// 회원 등록
	@Override
	public int memberInsert(MemberVO mvo) {
		// TODO Auto-generated method stub

		logger.info("memberDAOIMpl >>> : Insert  함수 시작 ");
		logger.info("mvo >>> : " + mvo);

		return sqlSession.insert("MemberInsert", mvo);
	}

	// 회원 정보 수정
	@Override
	public int memberUpdate(MemberVO mvo) {
		// TODO Auto-generated method stub

		logger.info("memberDAOIMpl >>> : Update  함수 시작 ");
		logger.info("mvo >>> : " + mvo);

		return (Integer) sqlSession.update("MemberUpdate", mvo);
	}

	// 회원 정보 삭제
	@Override
	public int memberDelete(MemberVO mvo) {
		// TODO Auto-generated method stub

		logger.info("memberDAOIMpl >>> : Delete  함수 시작 ");
		logger.info("mvo >>> : " + mvo);

		return (Integer) sqlSession.update("MemberDelete", mvo);
	}

	// 아이디 중복 체크
	@Override
	public List<MemberVO> checkID(MemberVO mvo) {
		// TODO Auto-generated method stub
		logger.info("memberDAOIMpl >>> : CheckID  함수 시작 ");
		logger.info("mvo >>> : " + mvo);

		return sqlSession.selectList("CheckID", mvo);
	}

	@Override
	public MemberVO memberLogin(MemberVO mvo) {
		
		logger.info("memberDAOIMpl >>> : memberLogin 함수 시작");
	
		return sqlSession.selectOne("memberLogin", mvo);
	}

}