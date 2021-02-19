package com.jns.chabun.dao;

import com.jns.member.vo.MemberVO;
import com.jns.board.vo.BoardVO;

public interface ChabunDAO {

	public MemberVO getMemberChabun();

	public BoardVO getNoticeChabun();

	public BoardVO getQnABoardChabun();
}
