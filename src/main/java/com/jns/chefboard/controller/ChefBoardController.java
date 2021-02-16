package com.jns.chefboard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jns.chefboard.service.ChefBoardService;
import com.jns.chefboard.vo.ChefBoardVO;

@Controller
public class ChefBoardController {
	Logger logger = Logger.getLogger(ChefBoardController.class);
	
	private ChefBoardService chefBoardService;
	
	// 기본 생성자 주입
	@Autowired(required=false)
	public ChefBoardController(ChefBoardService chefBoardService) {
		this.chefBoardService = chefBoardService;
	}
	
	// 테스트
	@RequestMapping(value="cheftest", method=RequestMethod.GET)
	public String test() {
		return "test";
	}
	
	// 글쓰기 Form 출력하기
	@RequestMapping(value="chefboard/writeForm", method=RequestMethod.GET)
	public String writeForm() {
		logger.info("chefC >> writeForm 호출 성공");
		
		return "chefboard/writeForm";
	}
	
	// 글쓰기
	@RequestMapping(value="chefboard/boardInsert", method=RequestMethod.POST)
	public String boardInsert(@ModelAttribute ChefBoardVO cbvo, HttpServletRequest request)
							throws IllegalStateException, IOException{
		logger.info("chefC >> boardInsert 호출 성공");
		
		int result = 0;
		String url = "";
		
		// 채번 세팅
		String bno = "B202102160001";  // 테스트용 Default
		cbvo.setBno(bno);		   // 테스트용 Default
		
		// 파일 업로드 세팅
		
		result = chefBoardService.boardInsert(cbvo);
		
		if (result == 1) {
			url = "chefboard/boardList.do";
		}
		
		return "redirect:"+url;
	}
	
	// 글 전체 목록
	@RequestMapping(value="/chefboard/boardList", method=RequestMethod.GET)
	public String boardList(ChefBoardVO cbvo, Model model) {
		logger.info("chefC >> boardList 호출 성공");
		
		// 페이지 세팅
		
		
		List<ChefBoardVO> listAll = chefBoardService.boardList(cbvo);
		logger.info("chefC >> boardList >> listAll.size() >>> : " + listAll.size());	
		
		model.addAttribute("listAll", listAll);
		
		return "chefboard/boardList";
	}
	
	// 수정 폼 출력하기
	public String updateForm(ChefBoardVO cbvo, Model model) {
		logger.info("chefC >> updateForm 호출 성공");
		
		return null;
	}
	
	// 수정
	public String boardUpdate(@ModelAttribute ChefBoardVO cbvo, HttpServletRequest request)
							throws IllegalStateException, IOException{
		logger.info("chefC >> boardUpdate 호출 성공");
		
		return null;
	}
	
	// 삭제
	public String boardDelete(@ModelAttribute ChefBoardVO cbvo, HttpServletRequest request)
								throws IOException{
		logger.info("chefC >> boardDelete 호출 성공");
		
		// 파일 삭제
		
		return null;
	}
}
