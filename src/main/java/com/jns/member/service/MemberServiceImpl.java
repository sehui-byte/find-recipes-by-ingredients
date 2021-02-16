package com.jns.member.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jns.member.dao.MemberDAO;

@Service
@Transactional
public class MemberServiceImpl implements MemberService {

	private Logger logger = Logger.getLogger(MemberServiceImpl.class);

	private MemberDAO memberdao;

	public MemberServiceImpl() {

	}

	@Autowired(required = false)
	public MemberServiceImpl(MemberDAO memberdao) {
		this.memberdao = memberdao;

	}

	
}