package com.jns.chefboard.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.jns.chabun.service.ChabunService;
import com.jns.chefboard.service.ChefBoardService;
import com.jns.chefboard.vo.ChefBoardVO;
import com.jns.common.ChabunUtil;
import com.jns.common.CommonUtil;
import com.jns.recipeboard.service.RecipeBoardService;
import com.jns.recipeboard.vo.RecipeBoardVO;

@Controller
public class ChefBoardController {
	Logger logger = Logger.getLogger(ChefBoardController.class);
	
	private ChefBoardService chefBoardService;
	private ChabunService chabunService;
	
	// 기본 생성자 주입
	@Autowired(required=false)
	public ChefBoardController(ChefBoardService chefBoardService, ChabunService chabunService) {
		this.chefBoardService = chefBoardService;
		this.chabunService = chabunService;
	}
	
	// 테스트
	@RequestMapping(value="cheftest", method=RequestMethod.GET)
	public String test() {
		return "test";
	}
	
	
	/********************************************************************************************
	* 글쓰기 Form
	********************************************************************************************/
	@RequestMapping(value="chefboard/writeForm", method=RequestMethod.GET)
	public String writeForm(ChefBoardVO cbvo, Model model, HttpServletRequest request) {
		logger.info("[chefC] >> writeForm 호출 성공");
		
		// 세션에서 닉네임 가져오기
		//HttpSession hs = request.getSession();
		//String mnick = (String)hs.getAttribute("mnick");
		//model.addAttribute("mnick", mnick);
		
		return "chefboard/writeForm";
	}
	
	
	/********************************************************************************************
	* 글쓰기
	********************************************************************************************/
	@RequestMapping(value="chefboard/boardInsert", method=RequestMethod.POST)
	public ModelAndView boardInsert(ChefBoardVO cbvo, HttpServletRequest request) {
		logger.info("[chefC] >> boardInsert 호출 성공");
		
		int result = 0;
		String resultStr = "";
		
		// 테스트용 MNO
		cbvo.setMno("cboardTest");
		
		//채번 구하기
		
		
		//이미지 업로드
		
		
		result = chefBoardService.boardInsert(cbvo);
		logger.info("result>>>"+result);
		
		if(result > 0) resultStr = "글 등록이 완료되었습니다.";
		else resultStr="죄송합니다, 글 등록에 문제가 발생하였습니다.";
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("result",resultStr);
		mav.setViewName("chefboard/boardList");
		
		return mav;
	}
	
	
	/********************************************************************************************
	* 글 전체 조회
	********************************************************************************************/
	@RequestMapping(value="/chefboard/boardselectall", method=RequestMethod.GET)
	public String boardSelectAll(ChefBoardVO cbvo, Model model) {
		logger.info("[chefC] >> boardSelectAll 호출 성공");
		
		// 페이징
		
		
		List<ChefBoardVO> listAll = chefBoardService.chefBoardSelectAll(cbvo);
		
		model.addAttribute("listAll", listAll);
		
		return "board/boardselectall";
	}
	
	
	/********************************************************************************************
	* 글 상세 조회
	********************************************************************************************/
	@RequestMapping(value="/chefboard/boardselect", method=RequestMethod.GET)
	public String boardSelect(RecipeBoardVO rbvo, Model model) {
		return null;
	}
	
	/********************************************************************************************
	* 글 수정 Form
	********************************************************************************************/
	public String updateForm(ChefBoardVO cbvo, Model model) {
		logger.info("chefC >> updateform 호출 성공");
		
		return null;
	}
	
	
	/********************************************************************************************
	* 글 수정
	********************************************************************************************/
	public String boardUpdate(@ModelAttribute ChefBoardVO cbvo, HttpServletRequest request)
							throws IllegalStateException, IOException{
		logger.info("chefC >> boardUpdate 호출 성공");
		
		return null;
	}
	

	/********************************************************************************************
	* 글 삭제
	********************************************************************************************/
	public String boardDelete(@ModelAttribute ChefBoardVO cbvo, HttpServletRequest request)
								throws IOException{
		logger.info("chefC >> boardDelete 호출 성공");
		
		// 파일 삭제
		
		return null;
	}
}
