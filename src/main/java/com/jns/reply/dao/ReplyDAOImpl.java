package com.jns.reply.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jns.reply.vo.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Autowired(required=false)
	private SqlSession sqlSession;
	
	@Override
	public List<ReplyVO> replyList(String bno) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("replyList", bno);
	}

	@Override
	public int replyInsert(ReplyVO rvo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("replyInsert");
	}

	@Override
	public int replyUpdate(ReplyVO rvo) {
		// TODO Auto-generated method stub
		return sqlSession.update("replyUpdate");
	}

	@Override
	public int replyDelete(String rno) {
		// TODO Auto-generated method stub
		return sqlSession.update("replyDelete");
	}

}
