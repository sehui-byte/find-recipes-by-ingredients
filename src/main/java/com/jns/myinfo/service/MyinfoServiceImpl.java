package com.jns.myinfo.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jns.member.vo.MemberVO;
import com.jns.myinfo.dao.MyinfoDAO;
import com.jns.recipe.vo.RecipeVO;

@Service
@Transactional
public class MyinfoServiceImpl implements MyinfoService {
	
	Logger logger = Logger.getLogger(MyinfoServiceImpl.class);
	
	private MyinfoDAO myinfoDAO;
	
	@Autowired(required=false)
	public MyinfoServiceImpl(MyinfoDAO myinfoDAO) {
		this.myinfoDAO = myinfoDAO;
	
	}

	@Override
	public List<RecipeVO> myRecipeList(MemberVO mvo) {
		
		logger.info("myRecipeList() 진입 >>> ");
		
		return myinfoDAO.myRecipeList(mvo);
	}
}
