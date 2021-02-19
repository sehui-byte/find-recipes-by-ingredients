package com.jns.qna.dao;

import com.jns.board.vo.BoardVO;
import java.util.List;

public interface QnADAO {

	public List<BoardVO> QnASelectPaging(BoardVO bvo);
	public List<BoardVO> QnASelectAll(BoardVO bvo);
	public List<BoardVO> QnASelect(BoardVO bvo);
	public int QnAInsert(BoardVO bvo);
	public int QnAUpdate(BoardVO bvo);
	public int QnADelete(BoardVO bvo);
}
