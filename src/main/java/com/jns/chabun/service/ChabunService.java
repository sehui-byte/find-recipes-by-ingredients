package com.jns.chabun.service;

import com.jns.board.vo.BoardVO;
import com.jns.chefboard.vo.ChefBoardVO;
import com.jns.member.vo.MemberVO;
import com.jns.reply.vo.ReplyVO;


public interface ChabunService {
	
	public  MemberVO getMemberChabun();

	public BoardVO getNoticeChabun();

	public BoardVO getQnABoardChabun();

	public ChefBoardVO getBoardChabun();
	public ReplyVO getReplyChabun();

}
