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
import com.jns.notice.vo.NoticeVO;
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
	public String NoticeSelectPaging(NoticeVO nvo, Model model) {
		logger.info("NoticeController NoticeSelectPaging ���� ::");	
		logger.info("NoticeController NoticeSelectPaging nvo.getPage() " + nvo.getPage());
		
		List<NoticeVO> listS = noticeService.NoticeSelectPaging(nvo);
		logger.info("NoticeController NoticeSelectPaging listS.size >>>:: " + listS.size());
		
		if(listS.size() == 1) {
			model.addAttribute("listS", listS);
			return "notice/noticeInsert";
		}
		
		return "notice/noticeForm";
	}
	
	@RequestMapping(value="noticeInsert", method=RequestMethod.POST)
	public String NoticeInsert(NoticeVO nvo, Model model) {
		logger.info("NoticeController NoticeInsert  ���� ::");
		
		// vo instance
		NoticeVO _nvo = null;
		_nvo = new NoticeVO();
		
		// chabun setting
		String nno = ChabunUtil.getNoticeChabun("N", chabunService.getNoticeChabun().getNno());
		
		_nvo.setNno(nno);
		_nvo.setNtitle(nvo.getNtitle());
		_nvo.setNcontent(nvo.getNcontent());
		_nvo.setNwriter(nvo.getNwriter());
		_nvo.setNfile(nvo.getNfile());
		
		 logger.info("NoticeController NoticeInsert nvo.getNno() >>> : "
			 		+ nvo.getNno());
		 logger.info("NoticeController NoticeInsert nvo.ncontent() >>> : "
				 	+ nvo.getNcontent());
		 logger.info("NoticeController NoticeInsert nvo.nfile() >>> : "
				 	+ nvo.getNfile());
		
		 int nCnt = noticeService.NoticeInsert(nvo);
		 logger.info("NoticeController NoticeInsert nCnt >>> : " + nCnt);
		 
		 String url = "";
		 
		 if(nCnt > 0) {
			 return  "notice/noticeInsert";
		 }
		 
		return "notice/noticeForm";
	}
	
	@RequestMapping(value="NoticeSelectAll",method=RequestMethod.POST)
	public String boardSelectAll(NoticeVO nvo, Model model) {
		logger.info("NoticeController NoticeSelectAll �Լ� ���� >>>: ");
		
		
		logger.info("NoticeController NoticeSelectAll nvo.getNno() >>> : " + nvo.getNno());
		logger.info("NoticeController NoticeSelectAll  nvo.getNtitle() >>> : " + nvo.getNtitle());
		logger.info("NoticeController NoticeSelectAll nvo.getNcontent() >>> : " + nvo.getNcontent());
		logger.info("NoticeController NoticeSelectAll  nvo.getNwriter() >>> : " + nvo.getNwriter());
		logger.info("NoticeController NoticeSelectAll  nvo.getNinsertdate() >>> : " + nvo.getNinsertdate());
		
		List<NoticeVO> listAll = noticeService.NoticeSelectAll(nvo);
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
	public String NoticeSelect(NoticeVO nvo, Model model) {
		
		logger.info("NoticeController NoticeSelect �Լ� ���� :::: ");
		logger.info("NoticeController NoticeSelect nvo.getNno() " + nvo.getNno());
		
		List<NoticeVO> listS = noticeService.NoticeSelect(nvo);
		logger.info("NoticeController NoticeSelect listS.size >>>:: " + listS.size());
		
		// ������ �Խù��� �ִٸ� �Խù��� �ҷ��´�.
		if(listS.size() == 1) {
			model.addAttribute("listS", listS);
			return "notice/noticeSelect";
		}
		
		return "notice/noticeSelectAll";
		
	}
	
	@RequestMapping(value="noticeUpdate",method=RequestMethod.POST)
	public String NoticeUpdate(NoticeVO nvo ,Model model) {
		logger.info("NoticeController NoticeUpdate �Լ� ���� >> ");
		
		logger.info("NoticeController NoticeUpdate nvo.getNtitle() " + nvo.getNtitle());
		logger.info("NoticeController NoticeUpdate nvo.getNcontent() " + nvo.getNcontent());
		int nCnt = noticeService.NoticeUpdate(nvo);
		
		logger.info("NoticeController NoticeUpdate nCnt" + nCnt);
		
		//������ �Խù��� 1���� ũ�ٸ� ����  â���� �̵� 
		if(nCnt > 0) {return "notice/noticeUpdate";}
		
		
		return "notice/noticeSelectAll";
				
	}	
	
	///�� �����ϱ� 
	@RequestMapping(value="noticeDelete", method=RequestMethod.POST)
	public String NoticeDelete(NoticeVO nvo, Model model) {
		logger.info("NoticeController NoticeDelete �Լ� ���� >>> :");
		
		logger.info("NoticeController NoticeDelete nvo.getNno() >>> : " + nvo.getNno());		
		int nCnt = noticeService.NoticeDelete(nvo);
		logger.info("NoticeController NoticeDelete nCnt >>> : " + nCnt);
		
		if (nCnt > 0) { return "notice/noticeDelete";}
		
		return "notice/noticeSelectAll";
	}
}
