package com.jns.favorites.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jns.chabun.service.ChabunService;
import com.jns.common.ChabunUtil;
import com.jns.favorites.service.FavoritesService;
import com.jns.favorites.vo.FavoritesVO;
import com.jns.myinfo.controller.MyinfoController;

@Controller
public class FavoritesController {

	Logger logger = Logger.getLogger(MyinfoController.class);

	private ChabunService chabunService;
	private FavoritesService favoritesService;

	@Autowired(required = false)
	public FavoritesController(FavoritesService favoritesService, ChabunService chabunService) {
		this.favoritesService = favoritesService;
		this.chabunService = chabunService;
	}
	
	@RequestMapping(value = "favorites/favRecipeCheck", method = RequestMethod.GET)
	@ResponseBody
	public String myFavRecipeCheck(FavoritesVO fvo) {
		logger.info("mySubRecipeCheck() 진입 >>> ");

		logger.info(fvo.getMno());
		logger.info(fvo.getRcp_seq());
		logger.info(fvo.getRbno());
		logger.info(fvo.getRecipeType());

		int check = favoritesService.myFavRecipeCheck(fvo);
		logger.info(check);

		if (check == 1) {
			return "CHECK";
		} else {
			return "NULL";
		}

	}

	@RequestMapping(value = "favorites/favRecipe", method = RequestMethod.GET)
	@ResponseBody
	public String myFavRecipeUpdate(FavoritesVO fvo) {

		logger.info(fvo.getMno());
		logger.info(fvo.getRcp_seq());
		logger.info(fvo.getRbno());
		logger.info(fvo.getRecipeType());

		String fno = ChabunUtil.getFavoriteChabun("D", chabunService.getFavoritesChabun().getFno());

		fvo.setFno(fno);

		int check = favoritesService.myFavRecipeCheck(fvo);
		
		// 0 >> 해당 레시피가 추천되지 않았을 때
		if (check == 0) {
			int result = favoritesService.myFavRecipeInsert(fvo);
			if (result == 1) {
				return "OK";
			} else {
				return "ERROR";
			}
		} else {
			// 1 >> 해당 레시피가 추천되어 있을 때 >> 추천 삭제
			favoritesService.myFavRecipeDelete(fvo);
			return "DeleteOK";
		}
	}

	@RequestMapping(value = "favorites/myFavRecipeDelete", method = RequestMethod.POST)
	@ResponseBody
	public String myFavRecipeDelete(@RequestParam("chkVal[]") String[] chkVals,
									@RequestParam("recipeType") String recipeType,
									@RequestParam("mno") String mno) {

		logger.info("myFavRecipeDelete >>> 진입");

		int nCnt = 0;

		for (String chkVal : chkVals) {
			FavoritesVO fvo = null;
			fvo = new FavoritesVO();

			if (chkVal.length() > 5 && chkVal.substring(0, 2).equals("RB")) {
				fvo.setRbno(chkVal);

			} else {
				fvo.setRcp_seq(chkVal);
			}
			fvo.setRecipeType(recipeType);
			fvo.setMno(mno);
			
			logger.info("chkVal >>> : "+fvo.getRbno());
			logger.info("chkVal >>> : "+fvo.getRcp_seq());
			logger.info("recipeType >>> : "+fvo.getRecipeType());
			logger.info("mno >>> : " + fvo.getMno());

			int dCount = favoritesService.myFavRecipeDelete(fvo);
			
			nCnt = nCnt + dCount;
		}

		String result = String.valueOf(nCnt);
		
		logger.info(result);

		return result;
	}
}
