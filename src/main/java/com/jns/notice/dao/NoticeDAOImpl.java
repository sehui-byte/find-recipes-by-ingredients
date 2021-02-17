package com.jns.notice.dao;

import java.util.List;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.jns.notice.vo.NoticeVO;

public class NoticeDAOImpl implements NoticeDAO {

	Logger logger = Logger.getLogger(NoticeDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<NoticeVO> NoticeSelectPaging(NoticeVO nvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("NoticeSelectPaging", nvo);
	}

	@Override
	public List<NoticeVO> NoticeSelectAll(NoticeVO nvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("NoticeSelectAll", nvo);
	}

	@Override
	public List<NoticeVO> NoticeSelect(NoticeVO nvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("NoticeSelect", nvo);
	}

	@Override
	public int NoticeInsert(NoticeVO nvo) {
		// TODO Auto-generated method stub
		return (Integer)sqlSession.insert("NoticeInsert", nvo);
	}

	@Override
	public int NoticeUpdate(NoticeVO nvo) {
		// TODO Auto-generated method stub
		return (Integer)sqlSession.update("NoticeUpdate", nvo);
	}

	@Override
	public int NoticeDelete(NoticeVO nvo) {
		// TODO Auto-generated method stub
		return (Integer)sqlSession.delete("NoticeDelete", nvo);
	}

}
