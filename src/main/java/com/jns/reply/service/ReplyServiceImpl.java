package com.jns.reply.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jns.reply.dao.ReplyDAO;
import com.jns.reply.vo.ReplyVO;

@Service
@Transactional
public class ReplyServiceImpl implements ReplyService {
	Logger logger = Logger.getLogger(ReplyServiceImpl.class);
	
	private ReplyDAO replyDAO;
	
	@Autowired(required=false)
	public ReplyServiceImpl(ReplyDAO replyDAO) {
		this.replyDAO = replyDAO;
	}
	
	@Override
	public List<ReplyVO> replyList(ReplyVO rvo) {
		// TODO Auto-generated method stub
		logger.info("ReplyServiceImpl >> replyList 호출 성공");
		logger.info("rvo.getBno() >>> : " + rvo.getBno());

		return replyDAO.replyList(rvo);
	}

	@Override
	public int replyInsert(ReplyVO rvo) {
		// TODO Auto-generated method stub
		int result = 0;
		result = replyDAO.replyInsert(rvo);
		return result;
	}

	@Override
	public int replyUpdate(ReplyVO rvo) {
		// TODO Auto-generated method stub
		int result = 0;
		result = replyDAO.replyUpdate(rvo);
		return result;
	}

	@Override
	public int replyDelete(ReplyVO rvo) {
		// TODO Auto-generated method stub
		int result = 0;
		result = replyDAO.replyDelete(rvo);
		return result;
	}

}
