package com.jns.reply.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	
	// 기본 생성자 주입
	@Autowired(required=false)
	public ReplyController(ReplyService replyService, ChabunService chabunService) {
		this.replyService = replyService;
		this.chabunService = chabunService;
	}
	
	/********************************************************************************************
	* 공지, Q&A 댓글 호출 
	********************************************************************************************/
	@RequestMapping(value="reply/reply")
	public String replyReady() {
		logger.info("ReplyC >> replyReady 호출 성공 ");
		
		return "reply/reply";
	}
	
	/********************************************************************************************
	* 일반, 세프 댓글 호출
	********************************************************************************************/
	@RequestMapping(value="reply/rbreply")
	public String rbreplyReady() {
		logger.info("ReplyC >> rbreplyReady 호출 성공 ");
		
		return "reply/rbreply";
	}
	
	/********************************************************************************************
	* 공지, Q&A 댓글 목록 
	********************************************************************************************/
	@ResponseBody
	@RequestMapping(value="/reply/blistAll", method=RequestMethod.POST)
	public Map<String, Object> breplylist(ReplyVO rvo){
		logger.info("ReplyC >> breplylist 호출 성공");
		logger.info("bno >>> : " + rvo.getBno());
		
		rvo.setBno(rvo.getBno());
		
		List<ReplyVO> breplyList = replyService.breplyList(rvo);
		System.out.println("ReplyC >> list >> breplyList.size() >>> : " + breplyList.size());
		
		Map<String, Object> m = new HashMap<String, Object>();
		
		m.put("breplyList", breplyList);
		
		return m;
		
		/*
		String ss = "";
		String listStr = "";
		for(int i=0; i < listR.size(); i++) {
			ReplyVO _rvo = listR.get(i);
			String s0 = _rvo.getRno();
			String s1 = _rvo.getRwriter();
			String s2 = _rvo.getRcontent();
			String s3 = _rvo.getRinsertdate();
			String s4 = _rvo.getRupdatedate();
			ss = s0 + "," + s1 + "," + s2 + "," + s3 + "," + s4;
			listStr += ss + "&";
		}
		//System.out.println("ReplyC >> listStr >>> : " + listStr);
		return listStr;
		*/
	}
	
	/********************************************************************************************
	* 일반, 세프 게시판 댓글 목록 
	********************************************************************************************/
	@ResponseBody
	@RequestMapping(value="/reply/rblistAll")
	public Map<String, Object> rbreplylist(ReplyVO rvo){
		logger.info("ReplyC >> rbreplylist 호출 성공");
		logger.info("bno >>> : " + rvo.getRbno());
		
		rvo.setRbno(rvo.getRbno());
		
		List<ReplyVO> rbreplyList = replyService.rbreplyList(rvo);
		System.out.println("ReplyC >> list >> rbreplyList.size() >>> : " + rbreplyList.size());
		
		Map<String, Object> m = new HashMap<String, Object>();
		
		m.put("rbreplyList", rbreplyList);
		
		return m;
	}
	
	/********************************************************************************************
	* 댓글 글쓰기
	********************************************************************************************/
	@ResponseBody
	@RequestMapping(value="reply/replyInsert", method=RequestMethod.POST)
	public String replyInsert(ReplyVO rvo){
		logger.info("ReplyC >> replyInsert 호출 성공");
		logger.info("ReplyC >> list >> mnick >>> : " + rvo.getRwriter());
		
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
	@RequestMapping(value="/reply/replyDelete", method=RequestMethod.POST)
	public String rboardDelete(ReplyVO rvo) {
		logger.info("ReplyC >> replyDelete 호출 성공");
		logger.info("ReplyC >> replyDelete result >>> : " + rvo.getRno());
		
		//세션 확인
		/*
		MemberVO mvo = null;
		if(session != null){
			mvo = (MemberVO)session.getAttribute("user");
			mno = mvo.getMno();
			
		}
		log.info("mno  >>>>>>>>  " + mno);
		rvo.setMno(mno);
		*/
		
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
