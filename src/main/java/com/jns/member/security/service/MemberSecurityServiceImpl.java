package com.jns.member.security.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.jns.member.dao.MemberDAO;
import com.jns.member.service.MemberServiceImpl;
import com.jns.member.vo.MemberVO;

public class MemberSecurityServiceImpl implements UserDetailsService {

	private Logger logger = Logger.getLogger(MemberServiceImpl.class);
	
	private MemberDAO memberdao;

	@Autowired(required=false)
	public MemberSecurityServiceImpl(MemberDAO memberdao) {
		this.memberdao = memberdao;
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		logger.info("securityService 진입 >>>");

		MemberVO mvo = null;
		mvo = new MemberVO();
		

		mvo.setMid(username);
		
		logger.info("mid >>> "+mvo.getMid());

		MemberVO mvo2 = null;
		mvo2 = new MemberVO();

		// 여기서 값을 못가져옴
		mvo2 = memberdao.memberLogin(mvo);
		logger.info(mvo2.getMid());
		logger.info(mvo2.getMlevel());

		// 해당 테이블에서 권한 찾아서 List로 변환
		List<String> authList = new ArrayList<String>();
		authList.add(mvo2.getMlevel());

		// setAUthorities로 객체 변환
		mvo2.setAuthorities(authList);

		if (mvo2 == null) {
			throw new UsernameNotFoundException("User Not Found");
		} 
			return mvo2;

	}

}
