package com.jns.chabun;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jns.mem.vo.MemberVO;



@Service
@Transactional
public class ChabunServiceImpl implements ChabunService {
	
	private Logger logger = Logger.getLogger(ChabunServiceImpl.class);
	
	private ChabunDAO chabunDAO;
	
	@Autowired(required=false)
	public ChabunServiceImpl(ChabunDAO chabunDAO) {
		this.chabunDAO= chabunDAO;
	}
	
	@Override
	public MemberVO getMemberChabun() {
		// TODO Auto-generated method stub
		logger.info("채번호출 ");
		return chabunDAO.getMemberChabun();
	}

}
