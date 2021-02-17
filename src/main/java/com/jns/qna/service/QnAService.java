package com.jns.qna.service;

import com.jns.qna.vo.QnAVO;
import java.util.List;

public interface QnAService {

	public List<QnAVO> QnASelectPaging(QnAVO qvo);
	public List<QnAVO> QnASelectAll(QnAVO qvo);
	public List<QnAVO> QnASelect(QnAVO qvo);
	public int QnAInsert(QnAVO qvo);
	public int QnAUpdate(QnAVO qvo);
	public int QnADelete(QnAVO qvo);
}
