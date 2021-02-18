package com.jns.qna.service;

import com.jns.common.vo.BoardVO;
import java.util.List;

public interface QnAService {

	public List<BoardVO> QnASelectPaging(BoardVO bvo);
	public List<BoardVO> QnASelectAll(BoardVO bvo);
	public List<BoardVO> QnASelect(BoardVO bvo);
	public int QnAInsert(BoardVO bvo);
	public int QnAUpdate(BoardVO bvo);
	public int QnADelete(BoardVO bvo);
}
