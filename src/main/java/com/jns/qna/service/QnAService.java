package com.jns.qna.service;

import java.util.List;

import com.jns.board.vo.BoardVO;

public interface QnAService {

	public int QnASelectPaging(BoardVO bvo);
	public List<BoardVO> QnASelectAll(BoardVO bvo);
	public List<BoardVO> QnASelect(BoardVO bvo);
	public int QnAInsert(BoardVO bvo);
	public int QnAUpdate(BoardVO bvo);
	public int QnADelete(BoardVO bvo);
	
	public boolean QnAVIEWS(BoardVO bvo);
	public boolean QnAHITS(BoardVO bvo);
}
