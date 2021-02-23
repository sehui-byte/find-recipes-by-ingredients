package com.jns.chef.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jns.chef.dao.ChefDAO;
import com.jns.chef.vo.ChefVO;

@Service
@Transactional
public class ChefServiceImpl implements ChefService {
	Logger logger = Logger.getLogger(ChefServiceImpl.class);
	
	private ChefDAO chefDAO;
	
	// 기본생성자 주입
	@Autowired(required=false)
	public ChefServiceImpl(ChefDAO chefDAO) {
		this.chefDAO = chefDAO;
	}
	
	@Override
	public List<ChefVO> chefSelectAll(ChefVO cvo) {
		// TODO Auto-generated method stub
		return chefDAO.chefSelectAll(cvo);
	}

	@Override
	public List<ChefVO> chefSelect(ChefVO cvo) {
		// TODO Auto-generated method stub
		return chefDAO.chefSelect(cvo);
	}

	@Override
	public int chefInsert(ChefVO cvo) {
		// TODO Auto-generated method stub
		return chefDAO.chefInsert(cvo);
	}

	@Override
	public int chefDelete(ChefVO cvo) {
		// TODO Auto-generated method stub
		return chefDAO.chefDelete(cvo);
	}
}
