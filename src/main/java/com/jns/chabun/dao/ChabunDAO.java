package com.jns.chabun.dao;

import com.jns.member.vo.MemberVO;
import com.jns.notice.vo.NoticeVO;
import com.jns.qna.vo.QnAVO;

public interface ChabunDAO {

	public MemberVO getMemberChabun();

	public NoticeVO getNoticeChabun();

	public QnAVO getQnABoardChabun();
}
