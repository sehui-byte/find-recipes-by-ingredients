package com.jns.notice.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jns.board.vo.BoardVO;
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
	public List<BoardVO> NoticeSelectPaging(BoardVO nvo) {
		// TODO Auto-generated method stub
		return noticeDAO.NoticeSelectPaging(nvo);
	}

	@Override
	public List<BoardVO> NoticeSelectAll(BoardVO nvo) {
		// TODO Auto-generated method stub
		return noticeDAO.NoticeSelectAll(nvo);
	}

	@Override
	public List<BoardVO> NoticeSelect(BoardVO nvo) {
		// TODO Auto-generated method stub
		return noticeDAO.NoticeSelect(nvo);
	}

	@Override
	public int NoticeInsert(BoardVO nvo) {
		// TODO Auto-generated method stub
		return noticeDAO.NoticeInsert(nvo);
	}

	@Override
	public int NoticeUpdate(BoardVO nvo) {
		// TODO Auto-generated method stub
		return noticeDAO.NoticeUpdate(nvo);
	}

	@Override
	public int NoticeDelete(BoardVO nvo) {
		// TODO Auto-generated method stub
		return noticeDAO.NoticeDelete(nvo);
	}

}
