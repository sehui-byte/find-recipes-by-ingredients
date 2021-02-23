package com.jns.recipeboard.controller;

import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jns.chabun.service.ChabunService;
import com.jns.common.DateFormatUtil;
import com.jns.common.FileLoadUtil;
import com.jns.common.FileUploadUtil;
import com.jns.recipe.service.RecipeService;
import com.jns.recipeboard.service.RecipeBoardService;
import com.jns.recipeboard.vo.RecipeBoardVO;

@Controller
public class RecipeBoardController 
{
	private RecipeBoardService recipeBoardService;
	private ChabunService chabunService;
	private Logger logger = Logger.getLogger(RecipeBoardController.class);
	
	public RecipeBoardController() 
	{

	}//Default Constructor
	
	@Autowired(required = false)
	public RecipeBoardController(RecipeBoardService recipeBoardService, ChabunService chabunService) 
	{
		this.recipeBoardService = recipeBoardService;
		this.chabunService = chabunService;
	}//생성자
	
	//================================= move =================================//
	@RequestMapping(value = "recipeboard", method = RequestMethod.GET)
	public String recipeboard(Model model)
	{
		logger.info("[RecipeBoardController] recipeboard.do 호출됨");
		model.addAttribute("list", recipeBoardService.recipeBoardSelectAll());
		return "recipeboard/recipeboard";
	}//레시피 게시판으로 이동
	
	@RequestMapping(value = "rbdetail", method = RequestMethod.GET)
	public String rbdetail(RecipeBoardVO rbvo, Model model)
	{
		model.addAttribute("rbvo", recipeBoardService.recipeBoardSelect(rbvo));
		return "recipeboard/recipeboard_detail";
	}//레시피 게시판 상세보기로 이동
	
	@RequestMapping(value = "rbwriteform", method = RequestMethod.GET)
	public String rbwriteform()
	{
		logger.info("[RecipeBoardController] rbwriteform.do 호출됨");
		return "recipeboard/recipeboard_writeform";
	}//레시피 게시판 글쓰기 폼으로 이동
	
	@RequestMapping(value = "rbupdateform", method = RequestMethod.GET)
	public String rbupdateform(RecipeBoardVO rbvo, Model model)
	{
		logger.info("[RecipeBoardController] rbupdateform.do 호출");
		logger.info("[rbvo.toString >>> : ]" + rbvo.toString());
		model.addAttribute("rbvo", recipeBoardService.recipeBoardSelect(rbvo));
		return "recipeboard/recipeboard_updateform";
	}//레시피 게시판 수정 폼으로 이동
	
	//================================= ISUD =================================//
	@RequestMapping(value = "rbwrite", method = RequestMethod.POST)
	public String rbwrite(RecipeBoardVO rbvo, MultipartHttpServletRequest request, Model model)
	{
		logger.info("[RecipeBoardController] rbwrite.do 호출됨");
		
		//============================= 채번 =============================//
		String no = chabunService.getRecipeBoardChabun().getRbno();
		String rbno = "RB" + DateFormatUtil.ymdFormat() + no;
		logger.info("rbno >>> : " + rbno);
		rbvo.setRbno(rbno);
		logger.info("rbvo >>> : " + rbvo.toString());
	
		//=========================== 파일 업로드 ===========================//
		List<String> keyList = new FileUploadUtil().uploadFiles(request, "recipeboard");
		
		//======================== VO에 이미지 key 매핑 ======================//
		rbvo.setMain_img(keyList.get(0));
		rbvo.setManual_img01(keyList.get(1));
		rbvo.setManual_img02(keyList.get(2));
		rbvo.setManual_img03(keyList.get(3));
		rbvo.setManual_img04(keyList.get(4));
		rbvo.setManual_img05(keyList.get(5));
		rbvo.setManual_img06(keyList.get(6));
		rbvo.setManual_img07(keyList.get(7));
		rbvo.setManual_img08(keyList.get(8));
		rbvo.setManual_img09(keyList.get(9));
		rbvo.setManual_img10(keyList.get(10));
		rbvo.setManual_img11(keyList.get(11));
		rbvo.setManual_img12(keyList.get(12));
		rbvo.setManual_img13(keyList.get(13));
		rbvo.setManual_img14(keyList.get(14));
		rbvo.setManual_img15(keyList.get(15));
		rbvo.setManual_img16(keyList.get(16));
		rbvo.setManual_img17(keyList.get(17));
		rbvo.setManual_img18(keyList.get(18));
		rbvo.setManual_img19(keyList.get(19));
		rbvo.setManual_img20(keyList.get(20));
		
		logger.info("rbvo >>> : " + rbvo.toString());
		
		logger.info("insert >>> : " + recipeBoardService.recipeBoardInsert(rbvo));		
		
		model.addAttribute("list", recipeBoardService.recipeBoardSelectAll());
		return "recipeboard/recipeboard";
	}
	
	@RequestMapping(value = "rbupdate", method = RequestMethod.POST)
	public String rbupdate(RecipeBoardVO rbvo, Model model)
	{
		//update code
		
		model.addAttribute("list", recipeBoardService.recipeBoardSelectAll());
		return "recipeboard/recipeboard";
	}
	
//	@RequestMapping(value = "filetest", method = RequestMethod.POST)
//	public String filetest(RecipeBoardVO rbvo, MultipartHttpServletRequest request)
//	{
//		//단일파일 업로드
//		String key = new FileUploadUtil().uploadFile(request, "recipeboard"); // 업로드 할 폴더 이름 (\WEB-INF\files\recipeboard)
//		logger.info("key >>> : " + key);
//		
//		//다중 파일 업로드
//		List<String> keyList = new FileUploadUtil().uploadFiles(request, "recipeboard");
//		logger.info("keyList >>> : " + keyList.toString());
//		
//		rbvo.setManual_img01(keyList.get(0));
//		rbvo.setManual_img02(keyList.get(1));
//		
//		return "";
//	}
	
	//================================= Ajax =================================//
	@RequestMapping(value = "recipeBoardSelectAll", method = RequestMethod.GET)
	@ResponseBody
	public List<RecipeBoardVO> recipeBoardSelectAll()
	{
		return recipeBoardService.recipeBoardSelectAll();
	}
	
	@RequestMapping(value = "recipeBoardSelect", method = RequestMethod.GET)
	@ResponseBody
	public RecipeBoardVO recipeBoardSelect(RecipeBoardVO rbvo)
	{
		return recipeBoardService.recipeBoardSelect(rbvo);
	}
	
	@RequestMapping(value = "recipeBoardInsert", method = RequestMethod.GET)
	@ResponseBody
	public boolean recipeBoardInsert(RecipeBoardVO rbvo)
	{
		return recipeBoardService.recipeBoardInsert(rbvo);
	}
	
	@RequestMapping(value = "recipeBoardUpdate", method = RequestMethod.GET)
	@ResponseBody
	public boolean recipeBoardUpdate(RecipeBoardVO rbvo)
	{
		return recipeBoardService.recipeBoardUpdate(rbvo);
	}
		
	@RequestMapping(value = "recipeBoardDelete", method = RequestMethod.GET)
	@ResponseBody
	public boolean recipeBoardDelete(RecipeBoardVO rbvo)
	{
		return recipeBoardService.recipeBoardDelete(rbvo);
	}
	
	@RequestMapping(value = "recipeBoardViewsPP", method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Boolean> recipeBoardViewsPP(RecipeBoardVO rbvo)
	{
		logger.info("recipeBoardViewsPP.do 호출됨");
		
		HashMap<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("ok", recipeBoardService.recipeBoardViewsPP(rbvo));
		return map;
	}
	
	@RequestMapping(value = "recipeBoardHitsPP", method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Boolean> recipeBoardHitsPP(RecipeBoardVO rbvo)
	{
		logger.info("recipeBoardHitsPP.do 호출됨");
		
		HashMap<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("ok", recipeBoardService.recipeBoardHitsPP(rbvo));
		return map;
	}
	
}
