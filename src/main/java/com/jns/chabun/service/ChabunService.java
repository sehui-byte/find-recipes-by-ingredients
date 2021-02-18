package com.jns.chabun.service;

import com.jns.member.vo.MemberVO;
import com.jns.notice.vo.NoticeVO;
import com.jns.qna.vo.QnAVO;

public interface ChabunService {
	
	public  MemberVO getMemberChabun();
		// TODO Auto-generated method stub

	public NoticeVO getNoticeChabun();

	public QnAVO getQnABoardChabun();

	
	//public BoardVO getBoardChabun();

}
