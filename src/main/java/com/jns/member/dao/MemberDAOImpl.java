package com.jns.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jns.member.vo.MemberDetailsVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Autowired(required=false)
	private SqlSession sqlSession;

	// 회원 전체 목록 조회 
		@Override
		public List<MemberVO> MemberSelectAll(MemberVO mvo) {
			// TODO Auto-generated method stub
			
			System.out.println("목록 조회 시작");
			
			logger.info("MemberDAOImpl >>> : SelectAll  함수 시작 ");
			logger.info("mvo >>> : "+mvo);
			
			
			return sqlSession.selectList("MemberSelectAll", mvo);
		}
		// 회원 선택 조회 
		@Override
		public List<MemberVO> MemberSelect(MemberVO mvo) {
			// TODO Auto-generated method stub
			
			logger.info("MemberDAOImpl >>> : Select  함수 시작 ");
			logger.info("mvo >>> : "+mvo);
			return sqlSession.selectList("MemberSelect", mvo);
		}
		// 회원 등록 
		@Override
		public int MemberInsert(MemberVO mvo) {
			// TODO Auto-generated method stub
			
			logger.info("MemberDAOImpl >>> : Insert  함수 시작 ");
			logger.info("mvo >>> : "+mvo);
			
			return sqlSession.insert("MemberInsert", mvo);
		}
		// 회원 정보 수정 
		@Override
		public int MemberUpdate(MemberVO mvo) {
			// TODO Auto-generated method stub
			
			logger.info("MemberDAOImpl >>> : Update  함수 시작 ");
			logger.info("mvo >>> : "+mvo);
			
			return (Integer)sqlSession.update("MemberUpdate", mvo);
		}
		// 회원 정보  삭제 
		@Override
		public int MemberDelete(MemberVO mvo) {
			// TODO Auto-generated method stub
			
			logger.info("MemberDAOImpl >>> : Delete  함수 시작 ");
			logger.info("mvo >>> : "+mvo);
			
			return (Integer)sqlSession.update("MemberDelete", mvo);
		}


		// 아이디 중복 체크 
		@Override
		public List<MemberVO> CheckID(MemberVO mvo) {
			// TODO Auto-generated method stub
			logger.info("MemberDAOImpl >>> : CheckID  함수 시작 ");
			logger.info("mvo >>> : "+mvo);
			
			return sqlSession.selectList("CheckID", mvo);
		}

	
	@Override
	public MemberDetailsVO memberLogin(MemberDetailsVO mvo) {
		
		return sqlSession.selectOne("memgerLogin", mvo);
	}

}