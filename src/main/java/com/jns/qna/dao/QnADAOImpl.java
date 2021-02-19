package com.jns.qna.dao;

import java.util.List;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import com.jns.board.vo.BoardVO;

public class QnADAOImpl implements QnADAO {

	Logger logger = Logger.getLogger(QnADAOImpl.class);
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<BoardVO> QnASelectPaging(BoardVO bvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("qnaSelectPaging", bvo);
	}

	@Override
	public List<BoardVO> QnASelectAll(BoardVO bvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("qnaSelectAll", bvo);
	}

	@Override
	public List<BoardVO> QnASelect(BoardVO bvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("qnaSelect", bvo);
	}

	@Override
	public int QnAInsert(BoardVO bvo) {
		// TODO Auto-generated method stub
		return (Integer)sqlSession.insert("qnaInsert", bvo);
	}

	@Override
	public int QnAUpdate(BoardVO bvo) {
		// TODO Auto-generated method stub
		return (Integer)sqlSession.update("qnaUpdate", bvo);
	}

	@Override
	public int QnADelete(BoardVO bvo) {
		// TODO Auto-generated method stub
		return (Integer)sqlSession.delete("qnaDelete", bvo);
	}

}
