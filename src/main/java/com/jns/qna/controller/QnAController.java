package com.jns.qna.controller;


import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jns.board.vo.BoardVO;
import com.jns.chabun.service.ChabunService;
import com.jns.common.ChabunUtil;
import com.jns.qna.service.QnAService;

@Controller
public class QnAController {

	Logger logger = Logger.getLogger(QnAController.class);
	
	private QnAService qnaService;
	private ChabunService chabunService; 
	
	// ������ Autowired 
	@Autowired(required=false)	
	public QnAController( QnAService qnaService,
				          ChabunService chabunService
				           ) {
		this.qnaService = qnaService;
		this.chabunService = chabunService;
		
	}	
	
	//�� �Է� �� 
	@RequestMapping(value="qnaForm", method=RequestMethod.GET)
	public String boardForm() {
		
		logger.info("QnA form >>>");

		return "QnA/qnaForm";
	}
	
	@RequestMapping(value="", method=RequestMethod.GET)
	public String QnASelectPaging(BoardVO bvo, Model model) {
		logger.info("QnAController QnASelectPaging ���� ::");	
		logger.info("QnAController boardSelect bvo.getSbnum() " + bvo.getPage());
		
		List<BoardVO> listS = qnaService.QnASelectPaging(bvo);
		logger.info("QnAController QnASelectPaging listS.size >>>:: " + listS.size());
		
		
		if(listS.size() == 1) {
			model.addAttribute("listS", listS);
			return "QnA/qnaSelectAll";
		}
		
		return "QnA/qnaForm";
	}
	
	@RequestMapping(value="qnaInsert", method=RequestMethod.GET)
	public String QnAInsert(BoardVO bvo, Model model) {
		logger.info("QnAController QnAInsert  ���� ::");
		
		//채번
		String bno = ChabunUtil.getQnaBoardChabun("D", chabunService.getQnABoardChabun().getBno());
		
		
		 bvo.setBno(bno);
		
		 logger.info("QnAController QnAInsert bvo.getBno() >>> : "
			 		+ bvo.getBno());
		 logger.info("QnAController QnAInsert bvo.getBcontent() >>> : "
				 	+ bvo.getBcontent());
		 logger.info("QnAController QnAInsert bvo.getMnick() >>> : "
				 	+ bvo.getMnick());
		 
		 int nCnt = qnaService.QnAInsert(bvo);
		 logger.info("QnAController QnAInsert nCnt >>> : " + nCnt);
		 
		 if(nCnt > 0) {
			 return "QnA/qnaInsert";
		 }
		 
		return "QnA/qnaForm";
	}
	
	@RequestMapping(value="qnaSelectAll",method=RequestMethod.GET)
	public String QnASelectAll(BoardVO bvo, Model model) {
		logger.info("QnAController QnASelectAll �Լ� ���� >>>: ");
		
		
		logger.info("QnAController QnASelectAll bvo.getBno() >>> : " + bvo.getBno());
		logger.info("QnAController QnASelectAll bvo.getBtitle() >>> : " + bvo.getBtitle());
		logger.info("QnAController QnASelectAll bvo.getBcontent() >>> : " + bvo.getBcontent());
		logger.info("QnAController QnASelectAll bvo.getMnick() >>> : " + bvo.getMnick());
		logger.info("QnAController QnASelectAll bvo.getBinsertdate() >>> : " + bvo.getBinsertdate());
		
		List<BoardVO> listAll = qnaService.QnASelectAll(bvo);
		logger.info("QnAController QnASelectAll listAll.size() >>> : " + listAll.size());
		
		try {
		// ��ü ����� ũ�Ⱑ 0 ���� ũ�ٸ� ����� �ҷ��´�.
	
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
		
		logger.info("QnAController QnASelect �Լ� ���� :::: ");
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
		
		logger.info("QnAController QnAUpdate bvo.getBtitle() " + bvo.getBtitle());
		logger.info("QnAController QnAUpdate bvo.getBcontent() " + bvo.getBcontent());
		int nCnt = qnaService.QnAUpdate(bvo);
		
		logger.info("QnAController QnAUpdate nCnt" + nCnt);
		
		//������ �Խù��� 1���� ũ�ٸ� ����  â���� �̵� 
		if(nCnt > 0) {
			return "QnA/qnaUpdate";
		}
		
		return "QnA/qnaInsert";
				
	}	
	
	///�� �����ϱ� 
	@RequestMapping(value="qnaDelete", method=RequestMethod.GET)
	public String QnADelete(BoardVO bvo, Model model) {
		logger.info("QnAController QnADelete �Լ� ���� >>> :");
		
		logger.info("QnAController QnADelete bvo.getSno() >>> : " + bvo.getBno());		
		int nCnt = qnaService.QnADelete(bvo);
		logger.info("QnAController QnADelete nCnt >>> : " + nCnt);
		
		if (nCnt > 0) {
			return "QnA/qnaDelete";
		}
		
		return "QnA/qnaInsert";
	}
	
}
