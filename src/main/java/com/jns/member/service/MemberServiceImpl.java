package com.jns.member.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jns.member.dao.MemberDAO;
import com.jns.member.security.password.PasswordEncoder;
import com.jns.member.vo.MemberVO;

@Service
@Transactional
public class MemberServiceImpl implements MemberService {

	private Logger logger = Logger.getLogger(MemberServiceImpl.class);

	private MemberDAO memberDAO;

	public MemberServiceImpl() {

	}

	@Autowired(required = false)
	public MemberServiceImpl(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;

	}

	// 회원 전체 목록 조회
	@Override
	public List<MemberVO> memberSelectAll(MemberVO mvo) {
		// TODO Auto-generated method stub

		System.out.println("서비스 시작");

		logger.info("MemberServiceImpl >>>> :  SelectAll 함수 시작 ");
		logger.info("mvo >>> : " + mvo);

		return memberDAO.memberSelectAll(mvo);
	}

	// 회원 선택 조회
	@Override
	public List<MemberVO> memberSelect(MemberVO mvo) {
		// TODO Auto-generated method stub

		logger.info("MemberServiceImpl >>>> :  Select 함수 시작 ");
		logger.info("mvo >>> : " + mvo);

		return memberDAO.memberSelect(mvo);
	}

	// 회원 등록
	@Override
	public int memberInsert(MemberVO mvo) {
		// TODO Auto-generated method stub

		logger.info("MemberServiceImpl >>>> :  Insert 함수 시작 ");
		logger.info("mvo >>> : " + mvo);
		logger.info("채번 호출");
		
		// 비밀번호 암호화 Bcrypt
		String mpw = PasswordEncoder.pwEncoder(mvo.getMpw());
		mvo.setMpw(mpw);

		int nCnt = memberDAO.memberInsert(mvo);

		return nCnt;
	}

	// 회원 정보 수정
	@Override
	public int memberUpdate(MemberVO mvo) {
		// TODO Auto-generated method stub
		logger.info("MemberServiceImpl >>>> :  Update 함수 시작 ");
		logger.info("mvo >>> : " + mvo);

		// 비밀번호 암호화 Bcrypt
		String mpw = PasswordEncoder.pwEncoder(mvo.getMpw());
		mvo.setMpw(mpw);

		return memberDAO.memberUpdate(mvo);
	}

	// 회원 정보 삭제
	@Override
	public int memberDelete(MemberVO mvo) {
		// TODO Auto-generated method stub
		logger.info("MemberServiceImpl >>>> :  Delete 함수 시작 ");
		logger.info("mvo >>> : " + mvo);

		// 비밀번호 암호화 Bcrypt
		String mpw = PasswordEncoder.pwEncoder(mvo.getMpw());
		mvo.setMpw(mpw);

		return memberDAO.memberDelete(mvo);
	}

	// 아이디 중복 체크
	@Override
	public List<MemberVO> checkID(MemberVO mvo) {
		// TODO Auto-generated method stub
		logger.info("MemberServiceImpl >>>> :  CheckID 함수 시작 ");
		logger.info("mvo >>> : " + mvo);

		return memberDAO.checkID(mvo);
	}
}