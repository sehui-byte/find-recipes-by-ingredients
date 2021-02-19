package com.jns.reply.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jns.reply.vo.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public List<ReplyVO> breplyList(ReplyVO rvo) {
		// TODO Auto-generated method stub
		System.out.println("ReplyDAOImpl >> breplyList 호출 성공");
		return sqlsession.selectList("breplyList", rvo);
	}
	
	@Override
	public List<ReplyVO> rbreplyList(ReplyVO rvo) {
		// TODO Auto-generated method stub
		System.out.println("ReplyDAOImpl >> rbreplyList 호출 성공");
		return sqlsession.selectList("rbreplyList", rvo);
	}

	@Override
	public int replyInsert(ReplyVO rvo) {
		// TODO Auto-generated method stub
		return sqlsession.insert("replyInsert");
	}

	@Override
	public int replyUpdate(ReplyVO rvo) {
		// TODO Auto-generated method stub
		return sqlsession.update("replyUpdate");
	}

	@Override
	public int replyDelete(ReplyVO rvo) {
		// TODO Auto-generated method stub
		return sqlsession.update("replyDelete");
	}

}
