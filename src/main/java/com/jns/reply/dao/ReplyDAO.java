package com.jns.reply.dao;

import java.util.List;

import com.jns.reply.vo.ReplyVO;

public interface ReplyDAO {

	public List<ReplyVO> replyList(ReplyVO rvo);
	public int replyInsert(ReplyVO rvo);
	public int replyUpdate(ReplyVO rvo);
	public int replyDelete(ReplyVO rvo);
}
