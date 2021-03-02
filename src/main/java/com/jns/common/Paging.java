package com.jns.common;

import com.jns.alarm.vo.AlarmVO;
import com.jns.board.vo.BoardVO;
import com.jns.chefboard.vo.ChefBoardVO;
import com.jns.member.vo.MemberVO;
import com.jns.product.vo.ProductVO;
import com.jns.qna.vo.QnAVO;
import com.jns.recipe.vo.RecipeVO;
import com.jns.recipeboard.vo.RecipeBoardVO;
import com.jns.reply.vo.ReplyVO;

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
	
	public static void setPage(RecipeVO rvo, String curpage, String sizeCtrl)
	{
		if(curpage==null) rvo.setCurPage(1);

		if(curpage!=null){
			int curnum=Integer.parseInt(curpage);
			rvo.setCurPage(curnum);
		}
		
		rvo.setGroupSize(10);
		
		if(sizeCtrl==null) rvo.setPageSize(10);
		if(sizeCtrl!=null){
			int ctrl=Integer.parseInt(sizeCtrl);
			rvo.setPageSize(ctrl);
		}
	}
	
	public static void setPage(RecipeBoardVO rbvo, String curpage, String sizeCtrl) {
		
		if(curpage==null) rbvo.setCurPage(1);

		if(curpage!=null){
			int curnum=Integer.parseInt(curpage);
			rbvo.setCurPage(curnum);
		}
		
		rbvo.setGroupSize(10);
		
		if(sizeCtrl==null) rbvo.setPageSize(10);
		if(sizeCtrl!=null){
			int ctrl=Integer.parseInt(sizeCtrl);
			rbvo.setPageSize(ctrl);
		}
		
	}
	public static void setPage(BoardVO bvo, String curpage, String sizeCtrl) {
		
		if(curpage == null) bvo.setCurPage(1);
		
		if(curpage!=null){
			int curnum=Integer.parseInt(curpage);
			bvo.setCurPage(curnum);
		}
		
		bvo.setGroupSize(10);
		
		if(sizeCtrl==null) bvo.setPageSize(10);
		if(sizeCtrl!=null){
			int ctrl=Integer.parseInt(sizeCtrl);
			bvo.setPageSize(ctrl);
		}
	}
	
	public static void setPage1(BoardVO nvo, String curpage, String sizeCtrl) {
		
		if(curpage == null) nvo.setCurPage(1);
		
		if(curpage!=null){
			int curnum=Integer.parseInt(curpage);
			nvo.setCurPage(curnum);
		}
		
		nvo.setGroupSize(10);
		
		if(sizeCtrl==null) nvo.setPageSize(10);
		if(sizeCtrl!=null){
			int ctrl=Integer.parseInt(sizeCtrl);
			nvo.setPageSize(ctrl);
		}
	}
	

	public static void setPage(MemberVO mvo, String curpage, String sizeCtrl) {
		
		if(curpage==null) mvo.setCurPage(1);

		if(curpage!=null){
			int curnum=Integer.parseInt(curpage);
			mvo.setCurPage(curnum);
		}
		
		mvo.setGroupSize(10);
		
		if(sizeCtrl==null) mvo.setPageSize(10);
		if(sizeCtrl!=null){
			int ctrl=Integer.parseInt(sizeCtrl);
			mvo.setPageSize(ctrl);
		}
		
	}
	
	public static void setPage(ProductVO pvo, String curpage, String sizeCtrl) {
		
		if(curpage==null) pvo.setCurPage(1);

		if(curpage!=null){
			int curnum=Integer.parseInt(curpage);
			pvo.setCurPage(curnum);
		}
		
		pvo.setGroupSize(10);
		
		if(sizeCtrl==null) pvo.setPageSize(10);
		if(sizeCtrl!=null){
			int ctrl=Integer.parseInt(sizeCtrl);
			pvo.setPageSize(ctrl);
		}
		
	}
	
	public static void setPage(AlarmVO avo, String curpage, String sizeCtrl) {
		
		if(curpage == null) avo.setCurPage(1);
		
		if(curpage !=null) {
			int curnum=Integer.parseInt(curpage);
			avo.setCurPage(curnum);
		}
		
		avo.setGroupSize(10);
		
		if(sizeCtrl==null) avo.setPageSize(10);
		if(sizeCtrl!=null) {
			int ctrl = Integer.parseInt(sizeCtrl);
			avo.setCurPage(ctrl);
		}
		
	}
	
	public static void setPage(ReplyVO rvo, String curpage, String sizeCtrl) {
		
		if(curpage==null) rvo.setCurPage(1);

		if(curpage!=null){
			int curnum=Integer.parseInt(curpage);
			rvo.setCurPage(curnum);
		}
		
		rvo.setGroupSize(10);
		
		if(sizeCtrl==null) rvo.setPageSize(10);
		if(sizeCtrl!=null){
			int ctrl=Integer.parseInt(sizeCtrl);
			rvo.setPageSize(ctrl);
		}
		
	}
	
}

