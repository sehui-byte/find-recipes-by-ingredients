package com.jns.notice.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jns.chabun.service.*;
import com.jns.common.vo.BoardVO;
import com.jns.common.ChabunUtil;
import com.jns.notice.service.NoticeService;

@Controller
public class NoticeController {

	Logger logger = Logger.getLogger(NoticeController.class);
	
	private NoticeService noticeService;
	private ChabunService chabunService; 
	
	// ������ Autowired 
		@Autowired(required=false)	
		public NoticeController( NoticeService noticeService,
					          	 ChabunService chabunService
					           ) {
			this.noticeService = noticeService;
			this.chabunService = chabunService;
			
		}
	
	//�Խ��� �� �Է� �� 
	@RequestMapping(value="noticeForm", method=RequestMethod.GET)
	public String boardForm() {
		return "notice/noticeForm";
	}	
		
	@RequestMapping(value="noticeSelectAll", method=RequestMethod.POST)
	public String NoticeSelectPaging(BoardVO bvo, Model model) {
		logger.info("NoticeController NoticeSelectPaging ���� ::");	
		logger.info("NoticeController NoticeSelectPaging bvo.getPage() " + bvo.getPage());
		
		List<BoardVO> listS = noticeService.NoticeSelectPaging(bvo);
		logger.info("NoticeController NoticeSelectPaging listS.size >>>:: " + listS.size());
		
		if(listS.size() == 1) {
			model.addAttribute("listS", listS);
			return "notice/noticeInsert";
		}
		
		return "notice/noticeForm";
	}
	
	@RequestMapping(value="noticeInsert", method=RequestMethod.POST)
	public String NoticeInsert(BoardVO bvo, Model model) {
		logger.info("NoticeController NoticeInsert  ���� ::");
		
		// vo instance
		BoardVO _bvo = null;
		_bvo = new BoardVO();
		
		// chabun setting
		String bno = ChabunUtil.getNoticeChabun("N", chabunService.getNoticeChabun().getBno());
		
		_bvo.setBno(bno);
		_bvo.setBtitle(bvo.getBtitle());
		_bvo.setBcontent(bvo.getBcontent());
		_bvo.setMnick(bvo.getMnick());
		_bvo.setBfile(bvo.getBfile());
		
		 logger.info("NoticeController NoticeInsert bvo.getBno() >>> : "
			 		+ bvo.getBno());
		 logger.info("NoticeController NoticeInsert bvo.bcontent() >>> : "
				 	+ bvo.getBcontent());
		 logger.info("NoticeController NoticeInsert bvo.bfile() >>> : "
				 	+ bvo.getBfile());
		
		 int nCnt = noticeService.NoticeInsert(bvo);
		 logger.info("NoticeController NoticeInsert nCnt >>> : " + nCnt);
			 
		 if(nCnt > 0) {
			 return  "notice/noticeInsert";
		 }
		 
		return "notice/noticeForm";
	}
	
	@RequestMapping(value="NoticeSelectAll",method=RequestMethod.POST)
	public String boardSelectAll(BoardVO bvo, Model model) {
		logger.info("NoticeController NoticeSelectAll �Լ� ���� >>>: ");
		
		
		logger.info("NoticeController NoticeSelectAll bvo.getBno() >>> : " + bvo.getBno());
		logger.info("NoticeController NoticeSelectAll  bvo.getBtitle() >>> : " + bvo.getBtitle());
		logger.info("NoticeController NoticeSelectAll bvo.getBcontent() >>> : " + bvo.getBcontent());
		logger.info("NoticeController NoticeSelectAll  bvo.getMnick() >>> : " + bvo.getMnick());
		logger.info("NoticeController NoticeSelectAll  bvo.getBinsertdate() >>> : " + bvo.getBinsertdate());
		
		List<BoardVO> listAll = noticeService.NoticeSelectAll(bvo);
		logger.info("NoticeController NoticeSelectAll listAll.size() >>> : " + listAll.size());
		
		try {
	
		if(listAll.size() > 0) {

			model.addAttribute("listAll",listAll);

			return "notice/noticeSelectAll";}
		}catch(Exception e) {System.out.println("test"+e.getMessage());}
		
		return "notice/noticeForm";
	}
	
	// NoticeList : list selection
	@RequestMapping(value="noticeSelect",method=RequestMethod.POST)
	public String NoticeSelect(BoardVO bvo, Model model) {
		
		logger.info("NoticeController NoticeSelect �Լ� ���� :::: ");
		logger.info("NoticeController NoticeSelect bvo.getBno() " + bvo.getBno());
		
		List<BoardVO> listS = noticeService.NoticeSelect(bvo);
		logger.info("NoticeController NoticeSelect listS.size >>>:: " + listS.size());
		
		// ������ �Խù��� �ִٸ� �Խù��� �ҷ��´�.
		if(listS.size() == 1) {
			model.addAttribute("listS", listS);
			return "notice/noticeSelect";
		}
		
		return "notice/noticeSelectAll";
		
	}
	
	@RequestMapping(value="noticeUpdate",method=RequestMethod.POST)
	public String NoticeUpdate(BoardVO bvo ,Model model) {
		logger.info("NoticeController NoticeUpdate �Լ� ���� >> ");
		
		logger.info("NoticeController NoticeUpdate bvo.getBtitle() " + bvo.getBtitle());
		logger.info("NoticeController NoticeUpdate bvo.getBcontent() " + bvo.getBcontent());
		int nCnt = noticeService.NoticeUpdate(bvo);
		
		logger.info("NoticeController NoticeUpdate nCnt" + nCnt);
		
		//������ �Խù��� 1���� ũ�ٸ� ����  â���� �̵� 
		if(nCnt > 0) {return "notice/noticeUpdate";}
		
		
		return "notice/noticeSelectAll";
				
	}	
	
	///�� �����ϱ� 
	@RequestMapping(value="noticeDelete", method=RequestMethod.POST)
	public String NoticeDelete(BoardVO bvo, Model model) {
		logger.info("NoticeController NoticeDelete �Լ� ���� >>> :");
		
		logger.info("NoticeController NoticeDelete bvo.getBno() >>> : " + bvo.getBno());		
		int nCnt = noticeService.NoticeDelete(bvo);
		logger.info("NoticeController NoticeDelete nCnt >>> : " + nCnt);
		
		if (nCnt > 0) { return "notice/noticeDelete";}
		
		return "notice/noticeSelectAll";
	}
}
