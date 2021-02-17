package com.jns.notice.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jns.notice.dao.NoticeDAO;
import com.jns.notice.vo.NoticeVO;

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
	public List<NoticeVO> NoticeSelectPaging(NoticeVO nvo) {
		// TODO Auto-generated method stub
		return noticeDAO.NoticeSelectPaging(nvo);
	}

	@Override
	public List<NoticeVO> NoticeSelectAll(NoticeVO nvo) {
		// TODO Auto-generated method stub
		return noticeDAO.NoticeSelectAll(nvo);
	}

	@Override
	public List<NoticeVO> NoticeSelect(NoticeVO nvo) {
		// TODO Auto-generated method stub
		return noticeDAO.NoticeSelect(nvo);
	}

	@Override
	public int NoticeInsert(NoticeVO nvo) {
		// TODO Auto-generated method stub
		return noticeDAO.NoticeInsert(nvo);
	}

	@Override
	public int NoticeUpdate(NoticeVO nvo) {
		// TODO Auto-generated method stub
		return noticeDAO.NoticeUpdate(nvo);
	}

	@Override
	public int NoticeDelete(NoticeVO nvo) {
		// TODO Auto-generated method stub
		return noticeDAO.NoticeDelete(nvo);
	}

}
