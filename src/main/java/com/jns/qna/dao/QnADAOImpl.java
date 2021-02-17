package com.jns.qna.dao;

import java.util.List;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import com.jns.qna.vo.QnAVO;

public class QnADAOImpl implements QnADAO {

	Logger logger = Logger.getLogger(QnADAOImpl.class);
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<QnAVO> QnASelectPaging(QnAVO qvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("qnaSelectPaging", qvo);
	}

	@Override
	public List<QnAVO> QnAselectAll(QnAVO qvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("qnaSelectAll", qvo);
	}

	@Override
	public List<QnAVO> QnASelect(QnAVO qvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("qnaSelect", qvo);
	}

	@Override
	public int QnAInsert(QnAVO qvo) {
		// TODO Auto-generated method stub
		return (Integer)sqlSession.insert("qnaInsert", qvo);
	}

	@Override
	public int QnAUpdate(QnAVO qvo) {
		// TODO Auto-generated method stub
		return (Integer)sqlSession.update("qnaUpdate", qvo);
	}

	@Override
	public int QnADelete(QnAVO qvo) {
		// TODO Auto-generated method stub
		return (Integer)sqlSession.delete("qnaDelete", qvo);
	}

}
