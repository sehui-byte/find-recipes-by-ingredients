package com.jns.qna.service;

import java.util.List;

import com.jns.qna.dao.QnADAO;
import com.jns.qna.vo.QnAVO;

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
	public List<QnAVO> QnASelectPaging(QnAVO qvo) {
		// TODO Auto-generated method stub
		return qnaDAO.QnASelectPaging(qvo);
	}

	@Override
	public List<QnAVO> QnASelectAll(QnAVO qvo) {
		// TODO Auto-generated method stub
		return qnaDAO.QnAselectAll(qvo);
	}

	@Override
	public List<QnAVO> QnASelect(QnAVO qvo) {
		// TODO Auto-generated method stub
		return qnaDAO.QnASelect(qvo);
	}

	@Override
	public int QnAInsert(QnAVO qvo) {
		// TODO Auto-generated method stub
		return qnaDAO.QnAInsert(qvo);
	}

	@Override
	public int QnAUpdate(QnAVO qvo) {
		// TODO Auto-generated method stub
		return qnaDAO.QnAUpdate(qvo);
	}

	@Override
	public int QnADelete(QnAVO qvo) {
		// TODO Auto-generated method stub
		return qnaDAO.QnADelete(qvo);
	}

}
