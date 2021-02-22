package com.jns.subscribe.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jns.subscribe.dao.SubscribeDAO;
import com.jns.subscribe.vo.SubscribeVO;

@Service
@Transactional
public class SubscribeServiceImpl implements SubscribeService {
	Logger logger = Logger.getLogger(SubscribeServiceImpl.class);
	
	private SubscribeDAO subscribeDAO;
	
	@Autowired(required=false)
	public SubscribeServiceImpl(SubscribeDAO subscribeDAO) {
		this.subscribeDAO = subscribeDAO;
	}
	
	@Override
	public List<SubscribeVO> mySubList(SubscribeVO svo) {
		// TODO Auto-generated method stub
		return subscribeDAO.mySubList(svo);
	}

	@Override
	public int chefSubCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int subInsert(SubscribeVO svo) {
		// TODO Auto-generated method stub
		return subscribeDAO.subInsert(svo);
	}

	@Override
	public int subDelete(SubscribeVO svo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<SubscribeVO> subRank(SubscribeVO svo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<SubscribeVO> subCheck(SubscribeVO svo) {
		// TODO Auto-generated method stub
		return null;
	}

}
