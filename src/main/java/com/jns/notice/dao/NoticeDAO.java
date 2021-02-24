package com.jns.notice.dao;

import java.util.List;

import com.jns.board.vo.BoardVO;

public interface NoticeDAO {
	
	public List<BoardVO> NoticeSelectPaging(BoardVO nvo);
	public List<BoardVO> NoticeSelectAll(BoardVO nvo);
	public List<BoardVO> NoticeSelect(BoardVO nvo);
	
	public int NoticeInsert(BoardVO nvo);
	public int NoticeUpdate(BoardVO nvo);
	public int NoticeDelete(BoardVO nvo);
	
	public int NoticeVIEWS(BoardVO nvo);
	public int NoticeHITS(BoardVO nvo);
}
