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
	@RequestMapping(value="/reply/all/{bno}.do", method=RequestMethod.GET)
	public ResponseEntity<List<ReplyVO>> list(@PathVariable("bno") String bno){
		logger.info("ReplyC >> list 호출 성공");
		ResponseEntity<List<ReplyVO>> entity = null;
		try {
			entity = new ResponseEntity<>(replyService.replyList(bno), HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
	/********************************************************************************************
	* 댓글 글쓰기
	********************************************************************************************/
	@RequestMapping(value="reply/replyInsert")
	public ResponseEntity<String> replyInsert(@RequestBody ReplyVO rvo){
		logger.info("ReplyC >> replyInsert 호출 성공");
		
		// 채번 setting
		String rno = ChabunUtil.getReplyChabun("D", chabunService.getReplyChabun().getRno());
		logger.info("ReplyC >> rno >>> : " + rno);
		rvo.setRno(rno);
		
		ResponseEntity<String> entity = null;
		int result;
		try {
			result = replyService.replyInsert(rvo);
			if(result==1) {
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			}
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;	
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
	@RequestMapping(value = "/reply/replyDelete/{rno}.kjm", method=RequestMethod.DELETE)
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
	
}
