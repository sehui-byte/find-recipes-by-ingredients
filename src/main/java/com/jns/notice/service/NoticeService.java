package com.jns.notice.service;

import com.jns.board.vo.BoardVO;
import java.util.List;

public interface NoticeService {

	public List<BoardVO> NoticeSelectPaging(BoardVO nvo);
	public List<BoardVO> NoticeSelectAll(BoardVO nvo);
	public List<BoardVO> NoticeSelect(BoardVO nvo);
	
	public int NoticeInsert(BoardVO nvo);
	public int NoticeUpdate(BoardVO nvo);
	public int NoticeDelete(BoardVO nvo);
}
