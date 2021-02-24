package com.jns.notice.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jns.board.vo.BoardVO;
import com.jns.chabun.service.ChabunService;
import com.jns.common.ChabunUtil;
import com.jns.common.FileUploadUtil;
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
	
	
	@RequestMapping(value="noticeForm", method=RequestMethod.GET)
	public String boardForm() {
		return "notice/noticeForm";
	}	
		
	@RequestMapping(value="noticeSelectPaging", method=RequestMethod.GET)
	public String NoticeSelectPaging(BoardVO nvo, Model model) {
		logger.info("NoticeController NoticeSelectPaging start ::");	
		//logger.info("NoticeController NoticeSelectPaging nvo.getPage() " + nvo.getPage());
		
		List<BoardVO> listS = noticeService.NoticeSelectPaging(nvo);
		logger.info("NoticeController NoticeSelectPaging listS.size >>>:: " + listS.size());
		
		if(listS.size() == 1) {
			model.addAttribute("listS", listS);
			return "notice/noticeInsert";
		}
		
		return "notice/noticeForm";
	}
	
	
	@RequestMapping(value="imgtry", method=RequestMethod.GET)
	public String noticeInsert(BoardVO nvo, Model model) {
		logger.info("NoticeController NoticeInsert  start ::");
		
		
		String bno = ChabunUtil.getNoticeChabun("D", chabunService.getNoticeChabun().getBno());
		nvo.setBviews("0");
		nvo.setBhits("0");
		
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
	
	
	@RequestMapping(value = "noticeInsert", method = RequestMethod.POST)
	public String NoticeInsert(BoardVO nvo, MultipartHttpServletRequest request){
		logger.info("noticeInsert >>> : 시작 ");
		
		//단일파일 업로드
		String key = new FileUploadUtil().uploadFile(request, "noticeboard"); // 업로드 할 폴더 이름 
		logger.info("key >>> : " + key);
		nvo.setBfile(key);
		
		String bno = ChabunUtil.getNoticeChabun("D", chabunService.getNoticeChabun().getBno());
		nvo.setBviews("0");
		nvo.setBhits("0");
		
		nvo.setBno(bno);
		
		 int nCnt = noticeService.NoticeInsert(nvo);
		 logger.info("NoticeController NoticeInsert nCnt >>> : " + nCnt);
		 
		 if(nCnt > 0) {
			 return "notice/noticeInsert";
		 }
		
		return "notice/noticeSelectAll";
	}
	
	@RequestMapping(value="noticeSelectAll",method=RequestMethod.GET)
	public String boardSelectAll(BoardVO nvo, Model model) {
		logger.info("NoticeController NoticeSelectAll start >>>: ");
		
		
		
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
		
		logger.info("NoticeController NoticeSelect start :::: ");
		logger.info("NoticeController NoticeSelect nvo.getBno() " + nvo.getBno());
		
		List<BoardVO> listS = noticeService.NoticeSelect(nvo);
		logger.info("NoticeController NoticeSelect listS.size >>>:: " + listS.size());
		
		
		if(listS.size() == 1) {
			model.addAttribute("listS", listS);
			return "notice/noticeSelect";
		}
		
		return "notice/noticeSelectAll";
		
	}
	
	@RequestMapping(value="noticeUpdate",method=RequestMethod.GET)
	public String NoticeUpdate(BoardVO nvo ,Model model) {
		logger.info("NoticeController NoticeUpdate start >> ");
		
		int nCnt = noticeService.NoticeUpdate(nvo);
		logger.info("NoticeController NoticeUpdate nvo.getBno() >>> : " + nvo.getBno());
		logger.info("NoticeController NoticeUpdate nvo.getBtitle() >>> : " + nvo.getBtitle());
		logger.info("NoticeController NoticeUpdate nvo.getBcontent() >>> : " + nvo.getBcontent());
		logger.info("NoticeController NoticeUpdate nvo.getMnick() >>> : " + nvo.getMnick());
		
		logger.info("NoticeController NoticeUpdate nCnt >>> " + nCnt);
		
	
		if(nCnt > 0) {
			return "notice/noticeUpdate";
			}
		
		return "notice/noticeSelectAll";
				
	}	
	
	@ResponseBody
	@RequestMapping(value="noticeViews", method=RequestMethod.GET)
	public String NoticeVIEWS(BoardVO nvo) {
		logger.info("noticeViews >>> ");
		logger.info("noticeViews nvo.getBno() >>> : " + nvo.getBno());
		
		int result = noticeService.NoticeVIEWS(nvo);
		logger.info("noticeViews result >>> : " + result);
		
		if (1 == result) {
			return "GOOD";
		}
		else{
			return "BAD"; 
		}
	}
	
	@ResponseBody
	@RequestMapping(value="noticeHits", method=RequestMethod.GET)
	public String NoticeHITS(BoardVO nvo) {
		logger.info("noticeHits >>> ");
		logger.info("noticeHits bvo.getBno() >>> : " + nvo.getBno());
		
		int result = noticeService.NoticeHITS(nvo);
		logger.info("noticeHits result >>> : " + result);
		
		if (1 == result) {
			return "GOOD"; 
		}
		else{
			return "BAD";
		}
	}
	
	
	@RequestMapping(value="noticeDelete", method=RequestMethod.GET)
	public String NoticeDelete(BoardVO nvo, Model model) {
		logger.info("NoticeController NoticeDelete start >>> :");
		
		logger.info("NoticeController NoticeDelete nvo.getBno() >>> : " + nvo.getBno());		
		int nCnt = noticeService.NoticeDelete(nvo);
		logger.info("NoticeController NoticeDelete nCnt >>> : " + nCnt);
		
		if (nCnt > 0) {
			return "notice/noticeDelete";
			}
		
		return "notice/noticeSelectAll";
	}
}
