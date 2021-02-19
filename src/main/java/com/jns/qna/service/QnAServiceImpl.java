package com.jns.qna.service;

import java.util.List;

import com.jns.qna.dao.QnADAO;
import com.jns.board.vo.BoardVO;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class QnAServiceImpl implements QnAService {

	Logger logger = Logger.getLogger(QnAServiceImpl.class);
	
	private QnADAO qnaDAO;
	
	@Autowired(required=false)
	public QnAServiceImpl(QnADAO qnaDAO) {
		this.qnaDAO = qnaDAO;
	}
	
	@Override
	public List<BoardVO> QnASelectPaging(BoardVO bvo) {
		// TODO Auto-generated method stub
		return qnaDAO.QnASelectPaging(bvo);
	}

	@Override
	public List<BoardVO> QnASelectAll(BoardVO bvo) {
		// TODO Auto-generated method stub
		return qnaDAO.QnASelectAll(bvo);
	}

	@Override
	public List<BoardVO> QnASelect(BoardVO bvo) {
		// TODO Auto-generated method stub
		return qnaDAO.QnASelect(bvo);
	}

	@Override
	public int QnAInsert(BoardVO bvo) {
		// TODO Auto-generated method stub
		return qnaDAO.QnAInsert(bvo);
	}

	@Override
	public int QnAUpdate(BoardVO bvo) {
		// TODO Auto-generated method stub
		return qnaDAO.QnAUpdate(bvo);
	}

	@Override
	public int QnADelete(BoardVO bvo) {
		// TODO Auto-generated method stub
		return qnaDAO.QnADelete(bvo);
	}

}
