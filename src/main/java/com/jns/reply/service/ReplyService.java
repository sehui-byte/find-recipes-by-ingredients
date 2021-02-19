package com.jns.reply.service;

import java.util.List;

import com.jns.reply.vo.ReplyVO;

public interface ReplyService {

	public List<ReplyVO> replyList(ReplyVO rvo);
	public int replyInsert(ReplyVO rvo);
	public int replyUpdate(ReplyVO rvo);
	public int replyDelete(ReplyVO rvo);
}
