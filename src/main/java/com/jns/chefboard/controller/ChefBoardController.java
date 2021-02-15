package com.jns.chefboard.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jns.chefboard.service.ChefBoardService;
import com.jns.chefboard.vo.ChefBoardVO;

@Controller
public class ChefBoardController {
	
	private ChefBoardService chefboardService;
	
	// 기본 생성자 주입
	@Autowired(required=false)
	public ChefBoardController(ChefBoardService chefboardService) {
		this.chefboardService = chefboardService;
	}
	
	// 테스트
	@RequestMapping(value="cheftest", method=RequestMethod.GET)
	public String test() {
		return "test";
	}
	
	// 글쓰기
	@RequestMapping(value="/chefboard/boardInsert", method=RequestMethod.POST)
	public String boardInsert(@ModelAttribute ChefBoardVO cbvo, HttpServletRequest request)
							throws IllegalStateException, IOException{
		System.out.println("ChefBoardController boardInsert >>> : ");
		
		int result = 0;
		String url = "";
		
		// 채번 세팅
		
		// 파일 업로드 세팅
		
		result = chefboardService.boardInsert(cbvo);
		
		if (result == 1) {
			url = "chefboard/boardList.do";
		}
		
		return "redirect:"+url;
	}
}
