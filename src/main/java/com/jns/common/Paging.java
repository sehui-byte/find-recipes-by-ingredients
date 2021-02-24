package com.jns.common;

import com.jns.chefboard.vo.ChefBoardVO;
import com.jns.common.CommonUtil;
import com.jns.qna.vo.QnAVO;
import java.util.*;
import com.jns.common.Util;

public class Paging {

	/*
	 * ����¡�� ���� ���� �۾�
	 * @param cvo
	 */
	public static void setPage(QnAVO cvo) {
		
		int page = Util.nvl(cvo.getPage());
		int pageSize = Util.nvl(cvo.getPagesize());
		
		if (cvo.getPage() == null) cvo.setPage(page+"");
		if (cvo.getPagesize() == null) cvo.setPagesize(pageSize+"");
		
		int start_row = (page-1)*pageSize +1;
		int end_row = (page-1)*pageSize+pageSize;
		
		cvo.setStart_row(start_row+"");
		cvo.setEnd_row(end_row+"");
		
	}
	
	public static void setPage(ChefBoardVO cbvo, String curpage, String sizeCtrl) {
		
		if(curpage==null) cbvo.setCurPage(1);

		if(curpage!=null){
			int curnum=Integer.parseInt(curpage);
			cbvo.setCurPage(curnum);
		}
		
		cbvo.setGroupSize(10);
		
		if(sizeCtrl==null) cbvo.setPageSize(10);
		if(sizeCtrl!=null){
			int ctrl=Integer.parseInt(sizeCtrl);
			cbvo.setPageSize(ctrl);
		}
		
	}
}
