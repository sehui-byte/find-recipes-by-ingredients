package com.jns.chabun.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jns.chabun.dao.ChabunDAO;
import com.jns.chefboard.vo.ChefBoardVO;
import com.jns.member.vo.MemberVO;

@Service
@Transactional
public class ChabunServiceImpl implements ChabunService {

	private Logger logger = Logger.getLogger(ChabunServiceImpl.class);

	private ChabunDAO chabunDAO;

	@Autowired(required = false)
	public ChabunServiceImpl(ChabunDAO chabunDAO) {
		this.chabunDAO = chabunDAO;
	}

	@Override
	public MemberVO getMemberChabun() {
		// TODO Auto-generated method stub
		logger.info("채번호출 ");
		return chabunDAO.getMemberChabun();
	}

	@Override
	public ChefBoardVO getBoardChabun() {
		// TODO Auto-generated method stub
		logger.info("ChefBoard 채번호출 ");
		return chabunDAO.getBoardChabun();
	}

	
	
}
