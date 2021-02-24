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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.jns.chabun.service.ChabunService;
import com.jns.chefboard.service.ChefBoardService;
import com.jns.chefboard.vo.ChefBoardVO;
import com.jns.common.ChabunUtil;
import com.jns.common.CommonUtil;
import com.jns.common.Paging;
import com.jns.recipeboard.service.RecipeBoardService;
import com.jns.recipeboard.vo.RecipeBoardVO;
import com.jns.subscribe.service.SubscribeService;
import com.jns.subscribe.vo.SubscribeVO;

@Controller
public class ChefBoardController {
	Logger logger = Logger.getLogger(ChefBoardController.class);
	
	private ChefBoardService chefBoardService;
	private ChabunService chabunService;
	private SubscribeService subscribeService;
	
	// 기본 생성자 주입
	@Autowired(required=false)
	public ChefBoardController(ChefBoardService chefBoardService
							  ,ChabunService chabunService
							  ,SubscribeService subscribeService) {
		this.chefBoardService = chefBoardService;
		this.chabunService = chabunService;
		this.subscribeService = subscribeService;
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
		
		return "chefboard/writeForm";
	}
	
	
	/********************************************************************************************
	* 글쓰기
	********************************************************************************************/
	@RequestMapping(value="chefboard/boardInsert", method=RequestMethod.POST)
	public ModelAndView boardInsert(ChefBoardVO cbvo, HttpServletRequest request) {
		logger.info("[chefC] >> boardInsert 호출 성공");
		logger.info("[chefC] >> boardInsert >> cbvo.getMno >>> : " + cbvo.getMno());
		
		int result = 0;
		String resultStr = "";
		
		//조회수 setting
		cbvo.setViews(0);
		cbvo.setHits(0);
		
		//채번 setting
		String rbno = ChabunUtil.getChiefBoardChabun("D", chabunService.getRecipeBoardChabun().getRbno());
		logger.info("[chefC] >> boardInsert >> rbno >>> : " + rbno);
		cbvo.setRbno(rbno);
		
		
		//이미지 업로드
		
		
		result = chefBoardService.boardInsert(cbvo);
		logger.info("result>>>"+result);
		
		if(result > 0) resultStr = "글 등록이 완료되었습니다.";
		else resultStr="죄송합니다, 글 등록에 문제가 발생하였습니다.";
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("result",resultStr);
		mav.setViewName("chefboard/insertresult");
		
		return mav;
	}
	
	
	/********************************************************************************************
	* 글 전체 조회 페이징
	********************************************************************************************/
	@RequestMapping(value="/chefboard/boardselectallpage", method=RequestMethod.GET)
	public String boardSelectAllPage(ChefBoardVO cbvo, Model model, SubscribeVO svo
									,HttpServletRequest request) {
		logger.info("[chefC] >> boardSelectAllPage 호출 성공");
		
		// 페이징		
		int totalCnt = 0;
		String cPage = request.getParameter("curPage");
		String pageCtrl = request.getParameter("pageCtrl");
		
		Paging.setPage(cbvo, cPage, pageCtrl); //페이징할 정보를 Paging클래스에 보내줍니다
		
		List<ChefBoardVO> listPage = chefBoardService.chefBoardSelectAllPage(cbvo);
		logger.info("[chefC] >> boardSelectAll listPage.size() >>> : " + listPage.size());
		
		if( listPage.size() != 0) {
			totalCnt = listPage.get(0).getTotalCount(); // 쿼리 조회한 리스트의 0번 인덱스에 담긴 totalCount값
			cbvo.setTotalCount(totalCnt);				// vo에 담기
		}
		
		model.addAttribute("listPage", listPage);
		model.addAttribute("p_cbvo", cbvo);
		
		// 랭킹
		List<SubscribeVO> subRank = subscribeService.subRank(svo);
		model.addAttribute("subRank", subRank);
		logger.info("[chefC] >> boardSelectAll subRank.size() >>> : " + subRank.size());
		
		return "chefboard/boardselectallpage";
	}
	
	
	
	/********************************************************************************************
	* 글 전체 조회
	********************************************************************************************/
	@RequestMapping(value="/chefboard/boardselectall", method=RequestMethod.GET)
	public String boardSelectAll(ChefBoardVO cbvo, Model model, SubscribeVO svo) {
		logger.info("[chefC] >> boardSelectAll 호출 성공");
		
		// 페이징
		
		
		List<ChefBoardVO> listAll = chefBoardService.chefBoardSelectAll(cbvo);
		
		model.addAttribute("listAll", listAll);
		logger.info("[chefC] >> boardSelectAll listAll.size() >>> : " + listAll.size());
		
		// 랭킹
		List<SubscribeVO> subRank = subscribeService.subRank(svo);
		model.addAttribute("subRank", subRank);
		logger.info("[chefC] >> boardSelectAll subRank.size() >>> : " + subRank.size());
		
		return "chefboard/boardselectall";
	}
	
	
	/********************************************************************************************
	* 글 상세 조회
	********************************************************************************************/
	@RequestMapping(value="/chefboard/boardselect", method=RequestMethod.GET)
	public String boardSelect(ChefBoardVO cbvo, Model model) {
		logger.info("[chefC] >> boardSelect 호출 성공");
		
		//
		cbvo.setRbno(cbvo.getRbno());
		
		List<ChefBoardVO> listS = chefBoardService.chefBoardSelect(cbvo);
		logger.info("[chefC] >> boardSelect listS.size() >>> : " + listS.size());
		
		if(listS.size() == 1) {
			model.addAttribute("listS", listS);
			return "chefboard/boardselect";
		}
		
		return "chefboard/boardselectall";
	}
	
	/********************************************************************************************
	* 글 수정 Form
	********************************************************************************************/
	@RequestMapping(value="/chefboard/updateform", method=RequestMethod.POST)
	public String updateForm(ChefBoardVO cbvo, Model model) {
		logger.info("[chefC] >> updateform 호출 성공");
		logger.info("[chefC] >> updateform >> cbvo.getRbno() >>> : " + cbvo.getRbno());
		
		List<ChefBoardVO> listS = chefBoardService.chefBoardSelect(cbvo);
		logger.info("[chefC] >> boardSelect listS.size() >>> : " + listS.size());
		
		model.addAttribute("listS", listS);
		
		return "chefboard/updateform";
	}
	
	
	/********************************************************************************************
	* 글 수정
	********************************************************************************************/
	@RequestMapping(value="/chefboard/boardupdate", method=RequestMethod.POST)
	public String boardUpdate(@ModelAttribute ChefBoardVO cbvo, HttpServletRequest request)
							throws IllegalStateException, IOException{		
		logger.info("[chefC] >> boardUpdate 호출 성공");
		logger.info("[chefC] >> boardUpdate >> cbvo.getRbno() >>> : " + cbvo.getRbno());
		
		int nCnt = 0;
		String url = "";
		
		// 이미지 업로드
		
		nCnt = chefBoardService.boardUpdate(cbvo);
		logger.info("[chefC] >> boardUpdate >> nCnt >>> : " + nCnt);
		
		if(nCnt == 1) {
			url = "/chefboard/boardselect.do?rbno=" + cbvo.getRbno();
		}
		
		return "redirect:" + url;
	}
	

	/********************************************************************************************
	* 글 삭제
	********************************************************************************************/
	@RequestMapping(value="/chefboard/boarddelete", method=RequestMethod.POST)
	public String boardDelete(@ModelAttribute ChefBoardVO cbvo, HttpServletRequest request)
								throws IOException{
		logger.info("[chefC] >> boardDelete 호출 성공");
		logger.info("[chefC] >> boardDelete >> cbvo.getRbno() >>> : " + cbvo.getRbno());
		
		int nCnt = 0;
		String url = "";
		
		// 이미지 삭제
		
		
		nCnt = chefBoardService.boardDelete(cbvo);
		logger.info("[chefC] >> boardDelete >> nCnt >>> : " + nCnt);
		
		if (nCnt ==1 ) {
			url = "/chefboard/boardselectall.do";
		}
		
		return "redirect:" + url;
	}
	
	
	/********************************************************************************************
	* 조회수 증가
	********************************************************************************************/
	@ResponseBody
	@RequestMapping(value="/chefboard/chefBoardViewsPP", method=RequestMethod.GET)
	public String chefBoardViewsPP(ChefBoardVO cbvo) {
		logger.info("[chefC] >> chefBoardViewsPP 호출 성공");
		logger.info("[chefC] >> chefBoardViewsPP >> cbvo.getRbno() >>> : " + cbvo.getRbno());
		
		int result = chefBoardService.chefBoardViewsPP(cbvo);
		logger.info("[chefC] >> chefBoardViewsPP >> result >>> : " + result);
		
		if (1 == result) { return "GOOD"; }
		else{ return "BAD"; }
	}
	
	
	/********************************************************************************************
	* 추천 증가
	********************************************************************************************/
	@ResponseBody
	@RequestMapping(value="/chefboard/chefBoardHitsPP", method=RequestMethod.GET)
	public String chefBoardHitsPP(ChefBoardVO cbvo) {
		logger.info("[chefC] >> chefBoardHitsPP 호출 성공");
		logger.info("[chefC] >> chefBoardHitsPP >> cbvo.getRbno() >>> : " + cbvo.getRbno());
		
		int result = chefBoardService.chefBoardHitsPP(cbvo);
		logger.info("[chefC] >> chefBoardHitsPP >> result >>> : " + result);
		
		if (1 == result) { return "GOOD"; }
		else{ return "BAD"; }
	}
}
