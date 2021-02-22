package com.jns.member.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jns.common.GoogleMailSend;
import com.jns.common.PasswordUtil;
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
		logger.info("MemberServiceImpl >>>> :  checkID 함수 시작 ");
		logger.info("mvo >>> : " + mvo);

		return memberDAO.checkID(mvo);
	}

	// 아이디 찾기
	@Override
	public List<MemberVO> memberFindIDOK(MemberVO _mvo) {
		logger.info("MemberServiceImpl >>>> :  memberFindIDOK 함수 시작 ");
		logger.info("mvo >>> : " + _mvo);

		List<MemberVO> aList = memberDAO.memberFindIDOK(_mvo);

		if (aList.size() == 1) {
			MemberVO mvo = null;
			mvo = aList.get(0);
			// 이메일 발송하기 ?? 현재 사용법을 몰라서 미완
			GoogleMailSend gm = new GoogleMailSend();
			gm.googleMailSend("전냉시 - ID 발송 메일", "fullsleeeep@gmail.com", "rlawoals!", mvo.getMemail(),
					"안녕하세요. 전냉시 운영진입니다. \n "
					+ "항상 저의 전냉시를 사랑해주셔서 대단히 감사합니다. \n"
					+ "문의하신 아이디는 " + mvo.getMid() + " 입니다");
		} else {
			logger.info("조회된 계정 정보 단일건이 아닙니다. 디비를 확인하세요. -  0 혹은 1보다 큽니다.");
		}

		return aList;
	}

	// 임시 비밀번호 발급용 회원 정보 조회
	@Override
	public List<MemberVO> memberTempPW(MemberVO _mvo) {

		// 입력된 회원 정보(아이디, 이메일)를 가지고 정보 조회
		List<MemberVO> aList = memberDAO.memberTempPW(_mvo);

		// 조회된 정보가 1
		if (aList.size() == 1) {

		} else {
			logger.info("조회된 계정 정보 단일건이 아닙니다. 디비를 확인하세요. -  0 혹은 1보다 큽니다.");
		}

		return aList;
	}

	// 임시 비밀번호 발급
	@Override
	public int memberTempPWOK(MemberVO mvo) {

		// 임시 비밀번호 생성
		String tempPw = PasswordUtil.tempPW(14);

		// 비밀번호 암호화
		String encodeTempPw = PasswordEncoder.pwEncoder(tempPw);

		mvo.setMpw(encodeTempPw);

		// 비밀번호 수정 -> 일단 단독 구현 -> 나중에 회원 정보 수정에 포함시켜야 하나?
		int result = memberDAO.memberTempPWOK(mvo);

		if (result == 1) {

			logger.info("회원 비밀번호가 임시 비밀번호로 변경되었습니다.");
			// 이메일 발송
			// google email class 사용
			GoogleMailSend gm = new GoogleMailSend();
			String memail = mvo.getMemail();

			gm.googleMailSend("전냉시 - 임시 비밀번호 발송 메일", "fullsleeeep@gmail.com", "rlawoals!", memail,
					"안녕하세요. 전냉시 운영진입니다. \n"
					+ "항상 저희 전냉시를 사랑해주셔서 대단히 감사드립니다. \n "
					+ "현재 임시 비밀번호 " + tempPw + " 로 변경되었습니다. \n 꼭 로그인 후 비밀번호를"
							+ " 변경해주시기 바랍니다. 감사합니다.");

		} else {

			logger.info("임시 비밀번호가 발급되었으나 데이터베이스에 반영되지 않았습니다. 임시 비밀번호 생성 로직을 확인해주세요.");
			result = 0;

		}

		return result;
	}

}