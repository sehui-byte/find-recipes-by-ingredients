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
import com.jns.board.vo.BoardVO;
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
		
	@RequestMapping(value="noticeSelectPaging", method=RequestMethod.GET)
	public String NoticeSelectPaging(BoardVO nvo, Model model) {
		logger.info("NoticeController NoticeSelectPaging ���� ::");	
		//logger.info("NoticeController NoticeSelectPaging nvo.getPage() " + nvo.getPage());
		
		List<BoardVO> listS = noticeService.NoticeSelectPaging(nvo);
		logger.info("NoticeController NoticeSelectPaging listS.size >>>:: " + listS.size());
		
		if(listS.size() == 1) {
			model.addAttribute("listS", listS);
			return "notice/noticeInsert";
		}
		
		return "notice/noticeForm";
	}
	
	@RequestMapping(value="noticeInsert", method=RequestMethod.GET)
	public String NoticeInsert(BoardVO nvo, Model model) {
		logger.info("NoticeController NoticeInsert  ���� ::");
		
		
		String bno = ChabunUtil.getNoticeChabun("D", chabunService.getNoticeChabun().getBno());
		
		nvo.setBno(bno);
		
		logger.info("NoticeController NoticeInsert nvo.getBno() >>> : "
		 		+ nvo.getBno());
		logger.info("NoticeController NoticeInsert nvo.getBcontent() >>> : "
			 	+ nvo.getBcontent());
		logger.info("NoticeController NoticeInsert nvo.getMnick() >>> : "
			 	+ nvo.getMnick());
		
		 int nCnt = noticeService.NoticeInsert(nvo);
		 logger.info("NoticeController NoticeInsert nCnt >>> : " + nCnt);
			 
		 if(nCnt > 0) {
			 return  "notice/noticeInsert";
		 }
		 
		return "notice/noticeForm";
	}
	
	@RequestMapping(value="noticeSelectAll",method=RequestMethod.GET)
	public String boardSelectAll(BoardVO nvo, Model model) {
		logger.info("NoticeController NoticeSelectAll �Լ� ���� >>>: ");
		
		
		logger.info("NoticeController NoticeSelectAll nvo.getBno() >>> : " + nvo.getBno());
		logger.info("NoticeController NoticeSelectAll  nvo.getBtitle() >>> : " + nvo.getBtitle());
		logger.info("NoticeController NoticeSelectAll nvo.getBcontent() >>> : " + nvo.getBcontent());
		logger.info("NoticeController NoticeSelectAll  nvo.getMnick() >>> : " + nvo.getMnick());
		logger.info("NoticeController NoticeSelectAll  nvo.getBinsertdate() >>> : " + nvo.getBinsertdate());
		
		List<BoardVO> listAll = noticeService.NoticeSelectAll(nvo);
		logger.info("NoticeController NoticeSelectAll listAll.size() >>> : " + listAll.size());
		
		try {
	
		if(listAll.size() > 0) {

			model.addAttribute("listAll",listAll);

			return "notice/noticeSelectAll";
			}
		}catch(Exception e) {
			System.out.println("test"+e.getMessage());
			}
		
		return "notice/noticeForm";
	}
	
	// NoticeList : list selection
	@RequestMapping(value="noticeSelect",method=RequestMethod.GET)
	public String NoticeSelect(BoardVO nvo, Model model) {
		
		logger.info("NoticeController NoticeSelect �Լ� ���� :::: ");
		logger.info("NoticeController NoticeSelect nvo.getBno() " + nvo.getBno());
		
		List<BoardVO> listS = noticeService.NoticeSelect(nvo);
		logger.info("NoticeController NoticeSelect listS.size >>>:: " + listS.size());
		
		// ������ �Խù��� �ִٸ� �Խù��� �ҷ��´�.
		if(listS.size() == 1) {
			model.addAttribute("listS", listS);
			return "notice/noticeSelect";
		}
		
		return "notice/noticeSelectAll";
		
	}
	
	@RequestMapping(value="noticeUpdate",method=RequestMethod.GET)
	public String NoticeUpdate(BoardVO nvo ,Model model) {
		logger.info("NoticeController NoticeUpdate �Լ� ���� >> ");
		
		int nCnt = noticeService.NoticeUpdate(nvo);
		logger.info("NoticeController NoticeUpdate nvo.getBno() >>> : " + nvo.getBno());
		logger.info("NoticeController NoticeUpdate nvo.getBtitle() >>> : " + nvo.getBtitle());
		logger.info("NoticeController NoticeUpdate nvo.getBcontent() >>> : " + nvo.getBcontent());
		logger.info("NoticeController NoticeUpdate nvo.getMnick() >>> : " + nvo.getMnick());
		
		logger.info("NoticeController NoticeUpdate nCnt >>> " + nCnt);
		
		//������ �Խù��� 1���� ũ�ٸ� ����  â���� �̵� 
		if(nCnt > 0) {
			return "notice/noticeUpdate";
			}
		
		return "notice/noticeSelectAll";
				
	}	
	
	///�� �����ϱ� 
	@RequestMapping(value="noticeDelete", method=RequestMethod.GET)
	public String NoticeDelete(BoardVO nvo, Model model) {
		logger.info("NoticeController NoticeDelete �Լ� ���� >>> :");
		
		logger.info("NoticeController NoticeDelete nvo.getBno() >>> : " + nvo.getBno());		
		int nCnt = noticeService.NoticeDelete(nvo);
		logger.info("NoticeController NoticeDelete nCnt >>> : " + nCnt);
		
		if (nCnt > 0) {
			return "notice/noticeDelete";
			}
		
		return "notice/noticeSelectAll";
	}
}
