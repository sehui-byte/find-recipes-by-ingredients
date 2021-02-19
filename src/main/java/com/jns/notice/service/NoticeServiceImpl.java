package com.jns.notice.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jns.common.vo.BoardVO;
import com.jns.notice.dao.NoticeDAO;

@Service
@Transactional
public class NoticeServiceImpl implements NoticeService {

	Logger logger = Logger.getLogger(NoticeServiceImpl.class);
	
	private NoticeDAO noticeDAO;
	
	@Autowired(required=false)
	public NoticeServiceImpl(NoticeDAO noticeDAO) {
		this.noticeDAO = noticeDAO;
	}
	
	@Override
	public List<BoardVO> NoticeSelectPaging(BoardVO bvo) {
		// TODO Auto-generated method stub
		return noticeDAO.NoticeSelectPaging(bvo);
	}

	@Override
	public List<BoardVO> NoticeSelectAll(BoardVO bvo) {
		// TODO Auto-generated method stub
		return noticeDAO.NoticeSelectAll(bvo);
	}

	@Override
	public List<BoardVO> NoticeSelect(BoardVO bvo) {
		// TODO Auto-generated method stub
		return noticeDAO.NoticeSelect(bvo);
	}

	@Override
	public int NoticeInsert(BoardVO bvo) {
		// TODO Auto-generated method stub
		return noticeDAO.NoticeInsert(bvo);
	}

	@Override
	public int NoticeUpdate(BoardVO bvo) {
		// TODO Auto-generated method stub
		return noticeDAO.NoticeUpdate(bvo);
	}

	@Override
	public int NoticeDelete(BoardVO bvo) {
		// TODO Auto-generated method stub
		return noticeDAO.NoticeDelete(bvo);
	}

}
