package com.jns.notice.service;

import com.jns.board.vo.BoardVO;
import java.util.List;

public interface NoticeService {

	public List<BoardVO> NoticeSelectPaging(BoardVO bvo);
	public List<BoardVO> NoticeSelectAll(BoardVO bvo);
	public List<BoardVO> NoticeSelect(BoardVO bvo);
	
	public int NoticeInsert(BoardVO bvo);
	public int NoticeUpdate(BoardVO bvo);
	public int NoticeDelete(BoardVO bvo);
}
