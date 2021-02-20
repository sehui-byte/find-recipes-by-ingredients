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
	public List<BoardVO> NoticeSelectPaging(BoardVO nvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("NoticeSelectPaging", nvo);
	}

	@Override
	public List<BoardVO> NoticeSelectAll(BoardVO nvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("NoticeSelectAll", nvo);
	}

	@Override
	public List<BoardVO> NoticeSelect(BoardVO nvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("NoticeSelect", nvo);
	}

	@Override
	public int NoticeInsert(BoardVO nvo) {
		// TODO Auto-generated method stub
		return (Integer)sqlSession.insert("NoticeInsert", nvo);
	}

	@Override
	public int NoticeUpdate(BoardVO nvo) {
		// TODO Auto-generated method stub
		return (Integer)sqlSession.update("NoticeUpdate", nvo);
	}

	@Override
	public int NoticeDelete(BoardVO nvo) {
		// TODO Auto-generated method stub
		return (Integer)sqlSession.delete("NoticeDelete", nvo);
	}

}
