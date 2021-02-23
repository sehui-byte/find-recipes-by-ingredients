package com.jns.myinfo.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jns.board.vo.BoardVO;
import com.jns.favorites.vo.FavoritesVO;
import com.jns.member.vo.MemberVO;
import com.jns.myinfo.service.MyinfoService;
import com.jns.recipe.vo.RecipeVO;
import com.jns.recipeboard.vo.RecipeBoardVO;

@Controller
public class MyinfoController {

	Logger logger = Logger.getLogger(MyinfoController.class);

	private MyinfoService myinfoService;

	@Autowired(required = false)
	public MyinfoController(MyinfoService myinfoService) {
		this.myinfoService = myinfoService;

	}

	@RequestMapping(value = "myinfo", method = RequestMethod.GET)
	public String myinfoPage() {
		logger.info("myinfoPage() 진입 >>> ");

		return "myinfo/myinfo_main";
	}

	@RequestMapping(value = "myinfo/myRecipeList", method = RequestMethod.GET)
	public String myRecipeList(MemberVO mvo, Model model) {
		logger.info("myRecipeList() 진입 >>> ");

		logger.info("mno >>> " + mvo.getMno());
		logger.info("name >>> " + mvo.getKeyword());
		logger.info("keyfilter >>> " + mvo.getKeyfilter());
		logger.info("startdate >>> " + mvo.getStartdate());
		logger.info("enddate >>> " + mvo.getEnddate());

		List<RecipeBoardVO> list = myinfoService.myRecipeList(mvo);
		int result = list.size();

		logger.info("result >>> " + result);

		if (result > 0) {

			model.addAttribute("myRecipeList", list);

		} else {

		}

		return "myinfo/myRecipeList";

	}

	@RequestMapping(value = "myinfo/myRecipeDelete", method = RequestMethod.POST)
	@ResponseBody
	public String myRecipeDelete(RecipeBoardVO rbvo, @RequestParam("chkVal[]") List<String> chkVals) {

		logger.info("myRecipeDelete() 진입 >>> ");

		int nCnt = 0;

		for (String chkVal : chkVals) {
			rbvo.setRbno(chkVal);
			myinfoService.myRecipeDelete(rbvo);
			nCnt++;

		}
		logger.info(nCnt);

		String result = String.valueOf(nCnt);

		return result;

	}

	@RequestMapping(value = "myinfo/myQnAList", method = RequestMethod.GET)
	public String myQnAList(MemberVO mvo, Model model) {

		logger.info("myQnAList() 진입 >>> ");

		logger.info("mno >>> " + mvo.getMno());

		List<BoardVO> list = myinfoService.myQnAList(mvo);

		int result = list.size();

		logger.info(result);

		if (result > 0) {
			model.addAttribute("myQnAList", list);
		}

		return "myinfo/myQnAList";

	}

	@RequestMapping(value = "myinfo/myQnADelete", method = RequestMethod.POST)
	@ResponseBody
	public String myQnADelete(BoardVO bvo, @RequestParam("chkVal[]") List<String> chkVals) {

		logger.info("myQnADelete() 진입 >>> ");
		int nCnt = 0;
		for (String chkVal : chkVals) {
			bvo.setBno(chkVal);
			myinfoService.myQnADelete(bvo);
			nCnt++;
		}
		logger.info(nCnt);

		String result = String.valueOf(nCnt);

		return result;

	}

	@RequestMapping(value = "myinfo/myRankUpdate", method = RequestMethod.GET)
	@ResponseBody
	public String myRankUpdate(BoardVO bvo) {

		logger.info("myRankUpdate() 진입 >>> ");
		int result = myinfoService.myRankUpdate(bvo);
		
		if (result == 1) {
			return "OK";
		}else {
			return "ERROR";
		}
	}

	// 내가 추천한 레시피 가져오기
	@RequestMapping(value = "myinfo/myFavRecipeList", method = RequestMethod.GET)
	public String myFavRecipeList(MemberVO mvo, Model model) {
		logger.info("myFavRecipeList() 진입 >>> ");
		List<RecipeVO> recipeList = myinfoService.myFavRecipeList1(mvo);
		List<RecipeBoardVO> recipeBoardList = myinfoService.myFavRecipeList2(mvo);

		model.addAttribute("recipeList", recipeList);
		model.addAttribute("recipeBoardList", recipeBoardList);

		return "myinfo/myFavRecipeList";
	}
	
	// 내가 추천한 레시피 검색하기
	@RequestMapping(value = "myinfo/myFavRecipeList/SelectRecipe", method = RequestMethod.GET)
	public String myFavRecipeListSelect(MemberVO mvo, FavoritesVO fvo, Model model) {
		logger.info("myFavRecipeList() 진입 >>> ");
		List<RecipeVO> recipeList = new ArrayList<RecipeVO>();
		List<RecipeBoardVO> recipeBoardList = new ArrayList<RecipeBoardVO>();
		// api 검색 >>
		logger.info("name >>> " + mvo.getKeyword());
		logger.info("keyfilter >>> " + mvo.getKeyfilter());
		logger.info("startdate >>> " + mvo.getStartdate());
		logger.info("enddate >>> " + mvo.getEnddate());
		logger.info("recepiType >>> : "+fvo.getRecipeType());

		if(fvo.getRecipeType().equals("API")) {
			recipeList = myinfoService.myFavRecipeList1(mvo);
			mvo.setKeyfilter("");
			mvo.setKeyword("");
			mvo.setEnddate("");
			mvo.setStartdate("");
			recipeBoardList = myinfoService.myFavRecipeList2(mvo);
		}else {
		// api 아닌 경우 >> user 레시피
			recipeBoardList = myinfoService.myFavRecipeList2(mvo);
			mvo.setKeyfilter("");
			mvo.setKeyword("");
			mvo.setEnddate("");
			mvo.setStartdate("");
			recipeList = myinfoService.myFavRecipeList1(mvo);
		}


		model.addAttribute("recipeList", recipeList);
		model.addAttribute("recipeBoardList", recipeBoardList);

		return "myinfo/myFavRecipeList";
	}
	

}
