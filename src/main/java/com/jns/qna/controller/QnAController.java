package com.jns.qna.controller;


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

import com.jns.qna.service.QnAService;
import com.jns.qna.vo.QnAVO;
import com.jns.common.ChabunUtil;

import oracle.net.aso.e;

@Controller
public class QnAController {

	Logger logger = Logger.getLogger(QnAController.class);
	
	private QnAService qnaService;
	// private ChabunService chabunService; 
	
	// 생성자 Autowired 
	@Autowired(required=false)	
	public QnAController( QnAService qnaService
				          //ChabunService chabunService
				           ) {
		this.qnaService = qnaService;
		//this.chabunService = chabunService;
		
	}	
	
	//글 입력 폼 
	@RequestMapping(value="QnAForm", method=RequestMethod.GET)
	public String boardForm() {
		return "QnA/QnAForm";
	}
	
	@RequestMapping(value="", method=RequestMethod.POST)
	public String QnASelectPaging(QnAVO qvo, Model model) {
		logger.info("QnAController QnASelectPaging 시작 ::");	
		logger.info("QnAController boardSelect bvo.getSbnum() " + qvo.getPage());
		
		List<QnAVO> listS = qnaService.QnASelectPaging(qvo);
		logger.info("QnAController QnASelectPaging listS.size >>>:: " + listS.size());
		
		
		if(listS.size() == 1) {
			model.addAttribute("listS", listS);
			return "QnA/QnAList.do";
		}
		
		return "QnA/QnAList.do";
	}
	
	@RequestMapping(value="QnAInsert", method=RequestMethod.POST)
	public String QnAInsert(HttpServletRequest req) {
		logger.info("QnAController QnAInsert  시작 ::");
		
		// 채번
		
		// 파일업로드 추가시 해제
		//FileUploadUtil fu = new FileUploadUtil();
		
		QnAVO _qvo = null;
		_qvo = new QnAVO();
		
		// 파일 업로드 들어오면 주석해제
		/*
		_qvo.setSno(fu.getParameter("sno"));
		_qvo.setStitle(fu.getParameter("stitle"));
		_qvo.setScontent(fu.getParameter("scontent"));
		_qvo.setSwriter(fu.getParameter("swriter"));
		_qvo.setSfile(fu.getParameter("sfile"));
		_qvo.setSview(fu.getParameter("sview"));
		*/ 
		
		 logger.info("QnAController QnAInsert _qvo.getSno() >>> : "
			 		+ _qvo.getSno());
		 logger.info("QnAController QnAInsert _qvo.sbcontent() >>> : "
				 	+ _qvo.getScontent());
		 logger.info("QnAController QnAInsert _qvo.sbfile() >>> : "
				 	+ _qvo.getSfile());
		 
		 int nCnt = qnaService.QnAInsert(_qvo);
		 logger.info("QnAController QnAInsert nCnt >>> : " + nCnt);
		 
		 String url = "";
		 
		 if(nCnt > 0) {
			 url = "QnA/QnAList.do";
		 }
		 
		return "redirect:"+url;
	}
	
	@RequestMapping(value="QnASelectAll",method=RequestMethod.GET)
	public String QnASelectAll(QnAVO qvo, Model model) {
		logger.info("QnAController QnASelectAll 함수 시작 >>>: ");
		
		
		logger.info("QnAController QnASelectAll qvo.getSno() >>> : " + qvo.getSno());
		logger.info("QnAController QnASelectAll qvo.getStitle() >>> : " + qvo.getStitle());
		logger.info("QnAController QnASelectAll qvo.getScontent() >>> : " + qvo.getScontent());
		logger.info("QnAController QnASelectAll qvo.getSwriter() >>> : " + qvo.getSwriter());
		logger.info("QnAController QnASelectAll qvo.getSinsertdate() >>> : " + qvo.getSinsertdate());
		
		List<QnAVO> listAll = qnaService.QnASelectAll(qvo);
		logger.info("QnAController QnASelectAll listAll.size() >>> : " + listAll.size());
		
		try {
		// 전체 목록의 크기가 0 보다 크다면 목록을 불러온다.
	
		if(listAll.size() > 0) {

			model.addAttribute("listAll",listAll);

				return "QnA/QnAList.do";
			}
		}catch(Exception e) {
			System.out.println("test"+e.getMessage());
			}
		return "QnA/QnAInsert.do";
	}
	
	@RequestMapping(value="QnASelect",method=RequestMethod.POST)
	public String QnASelect(QnAVO qvo,Model model) {
		
		logger.info("QnAController QnASelect 함수 시작 :::: ");
		logger.info("QnAController QnASelect qvo.getSno() " + qvo.getSno());
		
		List<QnAVO> listS = qnaService.QnASelect(qvo);
		logger.info("QnAController boardSelect listS.size >>>:: " + listS.size());
		
		// 선택한 게시물이 있다면 게시물을 불러온다.
		if(listS.size() == 1) {
			model.addAttribute("listS", listS);
			return "QnA/QnASelect.do";
		}
		
		return "QnA/QnASelectAll.do";
		
	}
	
	@RequestMapping(value="QnAUpdate",method=RequestMethod.POST)
	public String BoardUpdate(QnAVO qvo ,Model model) {
		logger.info("QnAController boardUpdate 함수 시작 >> ");
		
		logger.info("QnAController boardUpdate qvo.getStitle() " + qvo.getStitle());
		logger.info("QnAController boardUpdate qvo.getScontent() " + qvo.getScontent());
		int nCnt = qnaService.QnAUpdate(qvo);
		
		logger.info("QnAController QnAUpdate nCnt" + nCnt);
		
		//선택한 게시물이 1보다 크다면 수정  창으로 이동 
		if(nCnt > 0) {
			return "QnA/QnAUpdate";
		}
		
		return "QnA/QnAInsert";
				
	}	
	
	///글 삭제하기 
	@RequestMapping(value="QnADelete", method=RequestMethod.POST)
	public String QnADelete(QnAVO qvo, Model model) {
		logger.info("QnAController QnADelete 함수 진입 >>> :");
		
		logger.info("QnAController QnADelete qvo.getSno() >>> : " + qvo.getSno());		
		int nCnt = qnaService.QnADelete(qvo);
		logger.info("QnAController QnADelete nCnt >>> : " + nCnt);
		
		if (nCnt > 0) {
			return "QnA/QnADelete";
		}
		
		return "QnA/QnAInsert";
	}
	
}
