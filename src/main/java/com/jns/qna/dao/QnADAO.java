package com.jns.qna.dao;

import com.jns.qna.vo.QnAVO;
import java.util.List;

public interface QnADAO {

	public List<QnAVO> QnASelectPaging(QnAVO qvo);
	public List<QnAVO> QnAselectAll(QnAVO qvo);
	public List<QnAVO> QnASelect(QnAVO qvo);
	public int QnAInsert(QnAVO qvo);
	public int QnAUpdate(QnAVO qvo);
	public int QnADelete(QnAVO qvo);
}
