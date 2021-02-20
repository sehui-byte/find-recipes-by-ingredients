package com.jns.notice.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.jns.board.vo.BoardVO;

public class NoticeDAOImpl implements NoticeDAO {

	Logger logger = Logger.getLogger(NoticeDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<BoardVO> NoticeSelectPaging(BoardVO bvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("NoticeSelectPaging", bvo);
	}

	@Override
	public List<BoardVO> NoticeSelectAll(BoardVO bvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("NoticeSelectAll", bvo);
	}

	@Override
	public List<BoardVO> NoticeSelect(BoardVO bvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("NoticeSelect", bvo);
	}

	@Override
	public int NoticeInsert(BoardVO bvo) {
		// TODO Auto-generated method stub
		return (Integer)sqlSession.insert("NoticeInsert", bvo);
	}

	@Override
	public int NoticeUpdate(BoardVO bvo) {
		// TODO Auto-generated method stub
		return (Integer)sqlSession.update("NoticeUpdate", bvo);
	}

	@Override
	public int NoticeDelete(BoardVO bvo) {
		// TODO Auto-generated method stub
		return (Integer)sqlSession.delete("NoticeDelete", bvo);
	}

}
