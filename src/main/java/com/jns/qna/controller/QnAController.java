package com.jns.qna.controller;


import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.jns.board.vo.BoardVO;
import com.jns.chabun.service.ChabunService;
import com.jns.chefboard.vo.ChefBoardVO;
import com.jns.common.ChabunUtil;
import com.jns.common.FileUploadUtil;
import com.jns.common.Paging;
import com.jns.qna.service.QnAService;

@Controller
public class QnAController {

	Logger logger = Logger.getLogger(QnAController.class);
	
	private QnAService qnaService;
	private ChabunService chabunService; 
	
	// Autowired 
	@Autowired(required=false)	
	public QnAController( QnAService qnaService,
				          ChabunService chabunService
				           ) {
		this.qnaService = qnaService;
		this.chabunService = chabunService;
		
	}	
	

	@RequestMapping(value="qnaForm", method=RequestMethod.GET)
	public String boardForm() {
		
		logger.info("QnA form >>>");

		return "QnA/qnaForm";
	}
	
	
	@RequestMapping(value="qnaSelectAllPage", method=RequestMethod.GET)
	public String QnASelectPaging(BoardVO bvo, Model model, HttpServletRequest request) {
		logger.info("QnAController QnASelectPaging  :: ");	

		// 페이징		
		int totalCnt = 0;
		String cPage = request.getParameter("curPage");
		String pageCtrl = request.getParameter("pageCtrl");
		
		Paging.setPage(bvo, cPage, pageCtrl);
		
		List<BoardVO> listPage = qnaService.QnASelectPaging(bvo);
		logger.info("QnAController QnASelectPaging listS.size >>> " + listPage.size());
		
		
		if(listPage.size() != 0) {
			
			totalCnt = listPage.get(0).getTotalCount();
			bvo.setTotalCount(totalCnt);
		}
		
		model.addAttribute("listPage", listPage);
		model.addAttribute("p_bvo", bvo);
		
		return "QnA/qnaSelectAllPage";
	}
	
	
	@RequestMapping(value="imgtest", method=RequestMethod.GET)
	public String qnAInsert(BoardVO bvo, Model model) {
		logger.info("QnAController QnAInsert  start ::");
		
		//채번
		String bno = ChabunUtil.getQnaBoardChabun("D", chabunService.getQnABoardChabun().getBno());
		bvo.setBviews("0");
		bvo.setBhits("0");
		
		 bvo.setBno(bno);
		 
		 logger.info("QnAController QnAInsert bvo.getBno() >>> : "
			 		+ bvo.getBno());
		 logger.info("QnAController QnAInsert bvo.getBcontent() >>> : "
				 	+ bvo.getBcontent());
		 logger.info("QnAController QnAInsert bvo.getMnick() >>> : "
				 	+ bvo.getMnick());
		 
		//imgtest(bvo, null).
		 
		 int nCnt = qnaService.QnAInsert(bvo);
		 logger.info("QnAController QnAInsert nCnt >>> : " + nCnt);
		 
		 if(nCnt > 0) {
			 return "QnA/qnaInsert";
		 }
		 
		return "QnA/qnaForm";
	}
	
	
	@RequestMapping(value = "qnaInsert", method = RequestMethod.POST)
	public String QnAInsert(BoardVO bvo, MultipartHttpServletRequest request){
		logger.info("qnaInsert >>> : 시작 ");
		
		//단일파일 업로드
		String key = new FileUploadUtil().uploadFile(request, "qnaboard"); // 업로드 할 폴더 이름 
		logger.info("key >>> : " + key);
		bvo.setBfile(key);
		
		String bno = ChabunUtil.getQnaBoardChabun("D", chabunService.getQnABoardChabun().getBno());
		logger.info("bno >>> : " + bno);
		bvo.setBviews("0");
		bvo.setBhits("0");
		
		bvo.setBno(bno);
		
		 int nCnt = qnaService.QnAInsert(bvo);
		 
		 logger.info("QnAController QnAInsert nCnt >>> : " + nCnt);
		 
		 if(nCnt > 0) {
			 return "QnA/qnaInsert";
		 }
		
		return "QnA/qnaSelectAll";
	}
	
	@RequestMapping(value="qnaSelectAll",method=RequestMethod.GET)
	public String QnASelectAll(BoardVO bvo, Model model) {
		logger.info("QnAController QnASelectAll start >>>: ");
		
		
		List<BoardVO> listAll = qnaService.QnASelectAll(bvo);
		logger.info("QnAController QnASelectAll listAll.size() >>> : " + listAll.size());
		
		
		try {
		
	
		if(listAll.size() > 0) {

			model.addAttribute("listAll",listAll);

				return "QnA/qnaSelectAll";
			}
		}catch(Exception e) {
			System.out.println("test"+e.getMessage());
			}
		return "QnA/qnaForm";
	}
	
	@RequestMapping(value="qnaSelect",method=RequestMethod.GET)
	public String QnASelect(BoardVO bvo,Model model) {
		
		logger.info("QnAController QnASelect start :::: ");
		logger.info("QnAController QnASelect bvo.getBno() " + bvo.getBno());
		
		List<BoardVO> listS = qnaService.QnASelect(bvo);
		logger.info("QnAController boardSelect listS.size >>>:: " + listS.size());
		
		// ������ �Խù��� �ִٸ� �Խù��� �ҷ��´�.
		if(listS.size() == 1) {
			model.addAttribute("listS", listS);
			return "QnA/qnaSelect";
		}
		
		return "QnA/qnaSelectAll";
		
	}
	
	@RequestMapping(value="qnaUpdate",method=RequestMethod.GET)
	public String BoardUpdate(BoardVO bvo ,Model model) {
		logger.info("QnAController QnAUpdate 함수 시작 >> ");
		
		int nCnt = qnaService.QnAUpdate(bvo);
		
		logger.info("QnAController QnAUpdate bvo.getBtitle() >>> : " + bvo.getBtitle());
		logger.info("QnAController QnAUpdate bvo.getBcontent() >>> : " + bvo.getBcontent());
		logger.info("QnAController QnAUpdate bvo.getMnick() >>> : " + bvo.getMnick());
		
		logger.info("QnAController QnAUpdate nCnt >>> " + nCnt);
		
		
		if(nCnt > 0) {
			return "QnA/qnaUpdate";
		}
		
		return "QnA/qnaSelectAll";
				
	}	
	
	@ResponseBody
	@RequestMapping(value="qnaViews", method=RequestMethod.GET)
	public String QnAVIEWS(BoardVO bvo) {
		logger.info("qnaViews >>> ");
		logger.info("qnaViews bvo.getBno() >>> : " + bvo.getBno());
		
		int result = qnaService.QnAVIEWS(bvo);
		logger.info("qnaViews result >>> : " + result);
		
		if (1 == result) {
			return "GOOD";
		}
		else{
			return "BAD";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="qnaHits", method=RequestMethod.GET)
	public String QnAHITS(BoardVO bvo) {
		logger.info("qnaHits >>> ");
		logger.info("qnaHits bvo.getBno() >>> : " + bvo.getBno());
		
		int result = qnaService.QnAHITS(bvo);
		logger.info("qnaHits result >>> : " + result);
		
		if (1 == result) {
			return "GOOD";
		}
		else{
			return "BAD";
		}
	}
	
	@RequestMapping(value="qnaDelete", method=RequestMethod.GET)
	public String QnADelete(BoardVO bvo, Model model) {
		logger.info("QnAController QnADelete start >>> :");
		
		logger.info("QnAController QnADelete bvo.getSno() >>> : " + bvo.getBno());		
		int nCnt = qnaService.QnADelete(bvo);
		logger.info("QnAController QnADelete nCnt >>> : " + nCnt);
		
		if (nCnt > 0) {
			return "QnA/qnaDelete";
		}
		
		return "QnA/qnaSelectAll";
	}

}