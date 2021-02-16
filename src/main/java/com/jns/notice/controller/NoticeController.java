package com.jns.notice.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jns.notice.vo.NoticeVO;
import com.jns.common.ChabunUtil;
import com.jns.notice.service.NoticeService;

public class NoticeController {

	Logger logger = Logger.getLogger(NoticeController.class);
	
	private NoticeService noticeService;
	// private ChabunService chabunService; 
	
	// 생성자 Autowired 
		@Autowired(required=false)	
		public NoticeController( NoticeService noticeService
					          //ChabunService chabunService
					           ) {
			this.noticeService = noticeService;
			//this.chabunService = chabunService;
			
		}
	
	//게시판 글 입력 폼 
	@RequestMapping(value="noticeForm", method=RequestMethod.GET)
	public String boardForm() {
		return "notice/NoticeForm";
	}	
		
	@RequestMapping(value="", method=RequestMethod.POST)
	public String NoticeSelectPaging(NoticeVO nvo, Model model) {
		logger.info("NoticeController NoticeSelectPaging 시작 ::");	
		logger.info("NoticeController NoticeSelectPaging nvo.getSbnum() " + nvo.getPage());
		
		List<NoticeVO> listS = noticeService.NoticeSelectPaging(nvo);
		logger.info("NoticeController NoticeSelectPaging listS.size >>>:: " + listS.size());
		
		if(listS.size() == 1) {
			model.addAttribute("listS", listS);
			return "notice/NoticeList.do";
		}
		
		return "Notice/NoticeList.do";
	}
	
	@RequestMapping(value="NoticeInsert", method=RequestMethod.POST)
	public String NoticeInsert(NoticeVO nvo, Model model) {
		logger.info("NoticeController NoticeInsert  시작 ::");
		
		// 채번
		
		// vo 세팅
		NoticeVO _nvo = null;
		_nvo = new NoticeVO();
		
		_nvo.setNno(nvo.getNno());
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
			 url = "notice/NoticeList.do";
		 }
		 
		return "redirect:"+url;
	}
	
	@RequestMapping(value="NoticeSelectAll",method=RequestMethod.GET)
	public String boardSelectAll(NoticeVO nvo, Model model) {
		logger.info("NoticeController NoticeSelectAll 함수 시작 >>>: ");
		
		
		logger.info("NoticeController NoticeSelectAll nvo.getNno() >>> : " + nvo.getNno());
		logger.info("NoticeController NoticeSelectAll  nvo.getNtitle() >>> : " + nvo.getNtitle());
		logger.info("NoticeController NoticeSelectAll nvo.getNcontent() >>> : " + nvo.getNcontent());
		logger.info("NoticeController NoticeSelectAll  nvo.getNwriter() >>> : " + nvo.getNwriter());
		logger.info("NoticeController NoticeSelectAll  nvo.getNinsertdate() >>> : " + nvo.getNinsertdate());
		
		List<NoticeVO> listAll = noticeService.NoticeSelectAll(nvo);
		logger.info("NoticeController NoticeSelectAll listAll.size() >>> : " + listAll.size());
		
		try {
		// 전체 목록의 크기가 0 보다 크다면 목록을 불러온다.
	
		if(listAll.size() > 0) {

			model.addAttribute("listAll",listAll);

			return "notice/NoticeSelectAll";}
		}catch(Exception e) {System.out.println("test"+e.getMessage());}
		
		return "notice/NoticeForm";
	}
	
	@RequestMapping(value="NoticeSelect",method=RequestMethod.POST)
	public String NoticeSelect(NoticeVO nvo, Model model) {
		
		logger.info("NoticeController NoticeSelect 함수 시작 :::: ");
		logger.info("NoticeController NoticeSelect nvo.getNno() " + nvo.getNno());
		
		List<NoticeVO> listS = noticeService.NoticeSelect(nvo);
		logger.info("NoticeController NoticeSelect listS.size >>>:: " + listS.size());
		
		// 선택한 게시물이 있다면 게시물을 불러온다.
		if(listS.size() == 1) {
			model.addAttribute("listS", listS);
			return "notice/NoticeSelect";
		}
		
		return "notice/NoticeSelectAll";
		
	}
	
	@RequestMapping(value="NoticeUpdate",method=RequestMethod.POST)
	public String NoticeUpdate(NoticeVO nvo ,Model model) {
		logger.info("NoticeController NoticeUpdate 함수 시작 >> ");
		
		logger.info("NoticeController NoticeUpdate nvo.getNtitle() " + nvo.getNtitle());
		logger.info("NoticeController NoticeUpdate nvo.getNcontent() " + nvo.getNcontent());
		int nCnt = noticeService.NoticeUpdate(nvo);
		
		logger.info("NoticeController NoticeUpdate nCnt" + nCnt);
		
		//선택한 게시물이 1보다 크다면 수정  창으로 이동 
		if(nCnt > 0) {return "notice/NoticeUpdate";}
		
		
		return "notice/NoticeSelectAll";
				
	}	
	
	///글 삭제하기 
	@RequestMapping(value="NoticeDelete", method=RequestMethod.POST)
	public String NoticeDelete(NoticeVO nvo, Model model) {
		logger.info("NoticeController NoticeDelete 함수 진입 >>> :");
		
		logger.info("NoticeController NoticeDelete nvo.getNno() >>> : " + nvo.getNno());		
		int nCnt = noticeService.NoticeDelete(nvo);
		logger.info("NoticeController NoticeDelete nCnt >>> : " + nCnt);
		
		if (nCnt > 0) { return "notice/NoticeDelete";}
		
		return "notice/NoticeSelectAll";
	}
}
