package com.jns.recipe.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jns.common.Paging;
import com.jns.flask.controller.FlaskController;
import com.jns.recipe.service.RecipeService;
import com.jns.recipe.vo.RecipeVO;

@Controller
public class RecipeController 
{
	private RecipeService recipeService;
	private FlaskController flaskController;
	private Logger logger = Logger.getLogger(RecipeController.class);
	
	public RecipeController() 
	{
	
	}//Default Constructor
	
	@Autowired(required = false)
	public RecipeController(RecipeService recipeServce,
							FlaskController flaskController) 
	{
		this.recipeService = recipeServce;
		this.flaskController = flaskController;
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "recipelist")
	public String recipelist(RecipeVO rvo, HttpServletRequest request, Model model)
	{
		logger.info("[RecipeController] recipeList() 호출");
		logger.info("origin rvo >>> : " + rvo.toString());
		
		int totalCnt = 0;
		String curPage = request.getParameter("curPage");
		String sizeCtrl = request.getParameter("sizeCtrl");
		
		Paging.setPage(rvo, curPage, sizeCtrl);
		logger.info("rvo >>> : " + rvo.toString());
		
		List<RecipeVO> pageList = recipeService.recipeSelectAllPage(rvo);
		if(pageList.size() > 0)
		{
			totalCnt = pageList.get(0).getTotalCount();
			rvo.setTotalCount(totalCnt);
		}
		
		logger.info("pageList.get(0).toString()" + pageList.get(0).toString());
		logger.info("pageList.size >>> : " + pageList.size());
		
		model.addAttribute("rvo", rvo);
		model.addAttribute("pageList", pageList);
				
		return "recipe/recipelist";
	}
	
//	//레시피 검색
//	//jsp에서 keyword 받아서 검색
//	@RequestMapping(value="searchRecipe.do", method=RequestMethod.GET)
//	public String searchRecipe(RecipeVO rvo, HttpServletRequest request, Model model) {
//		int totalCnt = 0;
//		String curPage = request.getParameter("curPage");
//		String sizeCtrl = request.getParameter("sizeCtrl");
//		
//		Paging.setPage(rvo, curPage, sizeCtrl);
//		logger.info("rvo >>> : " + rvo.toString());
//		
//		List<RecipeVO> pageList = recipeService.recipeSelectAllPage(rvo);
//		if(pageList.size() > 0)
//		{
//			totalCnt = pageList.get(0).getTotalCount();
//			rvo.setTotalCount(totalCnt);
//		}
//		
//		logger.info("pageList.get(0).toString()" + pageList.get(0).toString());
//		logger.info("pageList.size >>> : " + pageList.size());
//		
//		model.addAttribute("rvo", rvo);
//		model.addAttribute("pageList", pageList);
//				
//		return "recipe/recipelist";
//	}
	
	@RequestMapping(method = RequestMethod.GET, value = "recipedetail")
	public String recipedetail(RecipeVO rvo, Model model, RedirectAttributes redirectAttributes )
	{
		logger.info("[RecipeController] recipeDetail() 호출");
	
		// 해당 레피시 영양소를 flask에 보낸다
		//flaskController.sendNutrient(rvo, redirectAttributes);
		
		logger.info("rcp_seq >>> : " + rvo.getRcp_seq());
		logger.info("recipeService.recipeSelect(rvo) >>> : " + recipeService.recipeSelect(rvo));
		model.addAttribute("data", recipeService.recipeSelect(rvo));
		
		return "recipe/recipedetail";
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "recipeSelectAll")
	@ResponseBody
	public List<RecipeVO> recipeSelectAll()
	{
		System.out.println("[RecipeController] recipeSelectAll() >>> : 진입");
		logger.info("[RecipeController] recipeSelectAll() >>> : 진입");
		return recipeService.recipeSelectAll();
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "recipeSelect")
	@ResponseBody
	public RecipeVO recipeSelect(RecipeVO rvo)
	{
		logger.info("[RecipeController] recipeSelect() rvo >>> : " + rvo.toString());
		return recipeService.recipeSelect(rvo);
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "recipeJsonInsert")
	@ResponseBody
	public HashMap<String, Integer> recipeJsonInsert()
	{
		HashMap<String, Integer> result = new HashMap<String, Integer>();
		result.put("cnt", recipeService.recipeJsonInsert());
		return result;
	}
	
	//랜덤하게 3개의 레시피를 가져와서 jsp로 넘겨주기
	@RequestMapping(method = RequestMethod.GET, value = "randomRecipe.do")
	public @ResponseBody List<Map<String,String>> randomRecipeSelect(RecipeVO rvo)
	{
		List<Map<String,String>> result = new ArrayList<Map<String,String>>();
		List<RecipeVO> list = recipeService.randomRecipeSelect(rvo);
		for(int i = 0; i<list.size(); i++) {
			Map<String, String> map = new HashMap<String,String>();
			map.put("rptitle", list.get(i).getRcp_nm());//레시피 이름
			map.put("rpimage", list.get(i).getAtt_file_no_main()); //레시피 이미지
			map.put("rpno", list.get(i).getRcp_seq()); //레시피 번호
			logger.info("map >> "  + map);
			result.add(map);
		}
		return result;
	}
}
