package com.jns.member.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jns.member.dao.MemberDAO;
import com.jns.member.vo.MemberDetailsVO;
import com.jns.member.vo.MemberVO;

@Service
@Transactional
public class MemberServiceImpl implements MemberService, UserDetailsService {

	private Logger logger = Logger.getLogger(MemberServiceImpl.class);

	private MemberDAO memberdao;

	public MemberServiceImpl() {

	}

	@Autowired(required = false)
	public MemberServiceImpl(MemberDAO memberdao) {
		this.memberdao = memberdao;

	}

	//회원 전체 목록 조회 
	@Override
	public List<MemberVO> MemberSelectAll(MemberVO mvo) {
		// TODO Auto-generated method stub
		
		System.out.println("서비스 시작");
		
		logger.info("MemberServiceImpl >>>> :  SelectAll 함수 시작 ");
		logger.info("mvo >>> : "+ mvo);
		
		return memberDAO.MemberSelectAll(mvo);
	}
	// 회원 선택 조회 
	@Override
	public List<MemberVO> MemberSelect(MemberVO mvo) {
		// TODO Auto-generated method stub
		
		logger.info("MemberServiceImpl >>>> :  Select 함수 시작 ");
		logger.info("mvo >>> : "+ mvo);
		
		return memberDAO.MemberSelect(mvo);
	}
	// 회원 등록 
	@Override
	public int MemberInsert(MemberVO mvo) {
		// TODO Auto-generated method stub
		
		logger.info("MemberServiceImpl >>>> :  Insert 함수 시작 ");
		logger.info("mvo >>> : "+ mvo);
		logger.info("채번 호출");
		
		int nCnt = memberDAO.MemberInsert(mvo);
		
		return nCnt;
	}
	// 회원 정보 수정 
	@Override
	public int MemberUpdate(MemberVO mvo) {
		// TODO Auto-generated method stub
		logger.info("MemberServiceImpl >>>> :  Update 함수 시작 ");
		logger.info("mvo >>> : "+ mvo);
		
		return memberDAO.MemberUpdate(mvo);
	}
	// 회원 정보 삭제 
	@Override
	public int MemberDelete(MemberVO mvo) {
		// TODO Auto-generated method stub
		logger.info("MemberServiceImpl >>>> :  Delete 함수 시작 ");
		logger.info("mvo >>> : "+ mvo);
		
		
		return memberDAO.MemberDelete(mvo);
	}

	// 아이디 중복 체크 
	@Override
	public List<MemberVO> CheckID(MemberVO mvo) {
		// TODO Auto-generated method stub
		logger.info("MemberServiceImpl >>>> :  CheckID 함수 시작 ");
		logger.info("mvo >>> : "+ mvo);
		
		return memberDAO.CheckID(mvo);
	}
	
	@Override
	public MemberDetailsVO memberLogin() {

		return null;
	}

	// UserDetailsService 구현 함수
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		logger.info("security service 함수 진입 >>>");

		MemberDetailsVO mvo = null;

		mvo = new MemberDetailsVO();

		mvo.setMid(username);

		mvo = memberdao.memberLogin(mvo);
		
		// 해당 테이블에서 권한 찾아서 List로 변환
		List<String> authList = new ArrayList<String>();
		authList.add(mvo.getMlevel());
		
		// setAUthorities로 객체 변환
		mvo.setAuthorities(authList);

		if (mvo == null) {
			return null;
		} else {
			return mvo;
		}

	}

}