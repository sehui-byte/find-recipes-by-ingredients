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