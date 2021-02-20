package com.jns.notice.dao;

import com.jns.board.vo.BoardVO;
import java.util.List;

public interface NoticeDAO {
	
	public List<BoardVO> NoticeSelectPaging(BoardVO nvo);
	public List<BoardVO> NoticeSelectAll(BoardVO nvo);
	public List<BoardVO> NoticeSelect(BoardVO nvo);
	
	public int NoticeInsert(BoardVO nvo);
	public int NoticeUpdate(BoardVO nvo);
	public int NoticeDelete(BoardVO nvo);
}
