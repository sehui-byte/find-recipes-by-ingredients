package com.jns.reply.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jns.chabun.service.ChabunService;
import com.jns.common.ChabunUtil;
import com.jns.reply.service.ReplyService;
import com.jns.reply.vo.ReplyVO;

@Controller
public class ReplyController {
	Logger logger = Logger.getLogger(ReplyController.class);
	
	private ReplyService replyService;
	private ChabunService chabunService;
	
	@Autowired(required=false)
	public ReplyController(ReplyService replyService, ChabunService chabunService) {
		this.replyService = replyService;
		this.chabunService = chabunService;
	}
	
	@RequestMapping(value="reply/reply")
	public String replyReady() {
		logger.info("ReplyC >> replyReady 호출 성공 ");
		
		return "reply/reply";
	}
	
	/********************************************************************************************
	* 댓글 목록 
	********************************************************************************************/
	@ResponseBody
	@RequestMapping(value="/reply/listAll", method=RequestMethod.POST, produces="application/text; charset=UTF-8")
	public String list(ReplyVO rvo){
		logger.info("ReplyC >> list 호출 성공");
		logger.info("ReplyC >> list >> bno >>> : " + rvo.getBno());
		
		rvo.setBno(rvo.getBno());
		
		List<ReplyVO> listR = replyService.replyList(rvo);
		System.out.println("ReplyC >> list >> listR.size() >>> : " + listR.size());
		
		String ss = "";
		String listStr = "";
		for(int i=0; i < listR.size(); i++) {
			ReplyVO _rvo = listR.get(i);
			String s0 = _rvo.getRno();
			String s1 = _rvo.getMnick();
			String s2 = _rvo.getRcontent();
			String s3 = _rvo.getRinsertdate();
			String s4 = _rvo.getRupdatedate();
			ss = s0 + "," + s1 + "," + s2 + "," + s3 + "," + s4;
			listStr += ss + "&";
		}
		//System.out.println("ReplyC >> listStr >>> : " + listStr);
		return listStr;
	}
	
	
	/********************************************************************************************
	* 댓글 글쓰기
	********************************************************************************************/
	@ResponseBody
	@RequestMapping(value="reply/replyInsert", method=RequestMethod.POST)
	public String replyInsert(ReplyVO rvo){
		logger.info("ReplyC >> replyInsert 호출 성공");
		logger.info("ReplyC >> list >> mnick >>> : " + rvo.getMnick());
		
		// 채번 setting
		String rno = ChabunUtil.getReplyChabun("D", chabunService.getReplyChabun().getRno());
		logger.info("ReplyC >> replyInsert >> rno >>> : " + rno);
		rvo.setRno(rno);
		
		int result = replyService.replyInsert(rvo);
		logger.info("ReplyC >> replyInsert >> result >>> : " + result);
		
		if (1 == result) { return "GOOD"; }
		else{ return "BAD"; }
	}
	
	
	/********************************************************************************************
	* 댓글 수정
	********************************************************************************************/
	@RequestMapping(value="/reply/{rno}.do", method= {RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> replyUpdate(@PathVariable("rno") String rno
											 ,@RequestBody ReplyVO rvo){
		logger.info("ReplyC >> replyUpdate 호출 성공");
		logger.info("ReplyC >> replyUpdate rcontent >>> : " + rvo.getRcontent());
		logger.info("ReplyC >> replyUpdate rno >>> : " + rno);
		
		ResponseEntity<String> entity = null;
		
		try {
			rvo.setRno(rno);
			replyService.replyUpdate(rvo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	/********************************************************************************************
	* 댓글 삭제 
	********************************************************************************************/
	@ResponseBody
	@RequestMapping(value="/reply/rboardDelete", method=RequestMethod.POST)
	public String rboardDelete(ReplyVO rvo) {
		logger.info("ReplyC >> replyDelete 호출 성공");
		logger.info("ReplyC >> replyDelete result >>> : " + rvo.getRno());
		
		int result = replyService.replyDelete(rvo);
		logger.info("RboardController rboardDelete result >>> : " + result);
		
		if (1 == result) { return "GOOD"; }
		else{ return "BAD"; }
	}
	
	/*
	@RequestMapping(value = "/reply/replyDelete/{rno}.do", method=RequestMethod.DELETE)
	 public ResponseEntity<String> replyDelete(@PathVariable("rno") String rno) {
		 logger.info("ReplyC >> replyDelete 호출 성공");
		 logger.info("ReplyC >> replyDelete rno >>> : " + rno);
		 
		 ResponseEntity<String> entity = null;
		 
		 try {
			replyService.replyDelete(rno);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		 } catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		 }
		 return entity;
	}	
	*/
}
