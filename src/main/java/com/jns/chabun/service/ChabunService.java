package com.jns.chabun.service;

import com.jns.chefboard.vo.ChefBoardVO;
import com.jns.member.vo.MemberVO;

import com.jns.notice.vo.NoticeVO;
import com.jns.qna.vo.QnAVO;

import com.jns.reply.vo.ReplyVO;


public interface ChabunService {
	
	public  MemberVO getMemberChabun();
		// TODO Auto-generated method stub

	public NoticeVO getNoticeChabun();

	public QnAVO getQnABoardChabun();

	
	public ChefBoardVO getBoardChabun();
	public ReplyVO getReplyChabun();

}
