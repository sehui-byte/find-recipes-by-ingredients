package com.jns.myinfo.controller;

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
import com.jns.chabun.service.ChabunService;
import com.jns.common.ChabunUtil;
import com.jns.member.vo.MemberVO;
import com.jns.myinfo.service.MyinfoService;
import com.jns.myinfo.vo.FavoritesVO;
import com.jns.recipe.vo.RecipeVO;
import com.jns.recipeboard.vo.RecipeBoardVO;

@Controller
public class MyinfoController {

	Logger logger = Logger.getLogger(MyinfoController.class);

	private MyinfoService myinfoService;
	private ChabunService chabunService;

	@Autowired(required = false)
	public MyinfoController(MyinfoService myinfoService, ChabunService chabunService) {
		this.myinfoService = myinfoService;
		this.chabunService = chabunService;

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
	public String myRankUpdate(BoardVO bvo) {

		logger.info("myRankUpdate() 진입 >>> ");
		// 등급 올리는 것에 대한 기준이 필요

		return "";
	}

	@RequestMapping(value = "myinfo/myFavRecipeList", method = RequestMethod.GET)
	public String myFavRecipeList(MemberVO mvo, Model model) {
		logger.info("myFavRecipeList() 진입 >>> ");
		// 내가 추천한 레시피 가져오기 - api
		List<RecipeVO> recipeList = myinfoService.myFavRecipeList1(mvo);
		List<RecipeBoardVO> recipeBoardList = myinfoService.myFavRecipeList2(mvo);

		model.addAttribute("recipeList", recipeList);
		model.addAttribute("recipeBoardList", recipeBoardList);

		return "myinfo/myFavRecipeList";
	}

	@RequestMapping(value = "myinfo/subRecipeAPI", method = RequestMethod.GET)
	public String mySubRecipe(FavoritesVO fvo) {

		logger.info(fvo.getMno());
		logger.info(fvo.getRcp_seq());
		logger.info(fvo.getRbno());
		logger.info(fvo.getRecipeType());

		String fno = ChabunUtil.getFavoriteChabun("D", chabunService.getFavoritesChabun().getFno());

		fvo.setFno(fno);

		int check = myinfoService.mySubRecipeCheck(fvo);

		// 0 >> 해당 레시피가 추천되지 않았을 때
		if (check == 0) {
			int result = myinfoService.mySubRecipeInsert(fvo);
			if (result == 1) {
				return "OK";
			} else {
				return "ERROR";
			}
		}else {
			// 1 >> 해당 레시피가 추천되어 있을 때 >> 추천 삭제
			myinfoService.mySubRecipeDelete(fvo);
			return "DeleteOK";
		}
	}

}
