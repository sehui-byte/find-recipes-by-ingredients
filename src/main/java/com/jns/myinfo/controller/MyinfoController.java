package com.jns.myinfo.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jns.board.vo.BoardVO;
import com.jns.chef.controller.ChefController;
import com.jns.chef.vo.ChefVO;
import com.jns.common.Paging;
import com.jns.favorites.vo.FavoritesVO;
import com.jns.member.vo.MemberVO;
import com.jns.myinfo.service.MyinfoService;
import com.jns.recipe.vo.RecipeVO;
import com.jns.recipeboard.vo.RecipeBoardVO;
import com.jns.subscribe.service.SubscribeService;
import com.jns.subscribe.vo.SubscribeVO;

@Controller
public class MyinfoController {

	Logger logger = Logger.getLogger(MyinfoController.class);

	private MyinfoService myinfoService;
	private SubscribeService subscribeService;
	private ChefController chefController;

	@Autowired(required = false)
	public MyinfoController(MyinfoService myinfoService, SubscribeService subscribeService,
			ChefController chefController) {
		this.myinfoService = myinfoService;
		this.subscribeService = subscribeService;
		this.chefController = chefController;

	}

	@RequestMapping(value = "myinfo", method = RequestMethod.GET)
	public String myinfoPage(MemberVO mvo, Model model) {
		logger.info("myinfoPage() 진입 >>> ");

		logger.info(mvo.getMno());

		List<MemberVO> myinfo = myinfoService.myinfoSelect(mvo);
		if (myinfo.size() > 0) {
			MemberVO _mvo = null;
			_mvo = new MemberVO();
			_mvo = myinfo.get(0);
			model.addAttribute("myLevel", _mvo.getMlevel());
		}

		return "myinfo/myinfo_main";
	}

	@RequestMapping(value = "myinfo/myRecipeListPage", method = RequestMethod.GET)
	public String myRecipeListPage(RecipeBoardVO rbvo, HttpServletRequest request, Model model) {

		// 페이징 처리 조건 검색
		logger.info("mno >>> " + rbvo.getMno());
		logger.info("name >>> " + rbvo.getKeyword());
		logger.info("keyfilter >>> " + rbvo.getKeyfilter());
		logger.info("startdate >>> " + rbvo.getStartdate());
		logger.info("enddate >>> " + rbvo.getEnddate());

		int totalCnt = 0;
		String cPage = request.getParameter("curPage");
		String pageCtrl = request.getParameter("pageCtrl");

		Paging.setPage(rbvo, cPage, pageCtrl); // 페이징할 정보를 Paging클래스에 보내줍니다

		List<RecipeBoardVO> myRecipeList = myinfoService.myRecipeListPage(rbvo);

		if (myRecipeList.size() != 0) {
			totalCnt = myRecipeList.get(0).getTotalCount(); // 쿼리 조회한 리스트의 0번 인덱스에 담긴 totalCount값
			rbvo.setTotalCount(totalCnt); // vo에 담기
		}

		logger.info(rbvo.getMno());
		logger.info(myRecipeList.size());

		model.addAttribute("myRecipeList", myRecipeList);
		model.addAttribute("p_rbvo", rbvo);

		return "myinfo/myRecipeList";
	}

// 삭제 예정	
	@RequestMapping(value = "myinfo/myRecipeList", method = RequestMethod.GET)
	public String myRecipeList(MemberVO mvo, Model model, HttpServletRequest request) {
		logger.info("myRecipeList() 진입 >>> ");

		logger.info("mno >>> " + mvo.getMno());
		logger.info("name >>> " + mvo.getKeyword());
		logger.info("keyfilter >>> " + mvo.getKeyfilter());
		logger.info("startdate >>> " + mvo.getStartdate());
		logger.info("enddate >>> " + mvo.getEnddate());

		List<RecipeBoardVO> list = myinfoService.myRecipeList(mvo);
		int result = list.size();

		int totalCnt = 0;
		String cPage = request.getParameter("curPage");
		String pageCtrl = request.getParameter("pageCtrl");

		Paging.setPage(mvo, cPage, pageCtrl); // 페이징할 정보를 Paging클래스에 보내줍니다

		logger.info("result >>> " + result);

		if (result != 0) {
			totalCnt = list.get(0).getTotalCount(); // 쿼리 조회한 리스트의 0번 인덱스에 담긴 totalCount값
			mvo.setTotalCount(totalCnt); // vo에 담기
		}

		model.addAttribute("myRecipeList", list);
		model.addAttribute("p_bvo", mvo);

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
	public String myQnAList(BoardVO bvo, Model model, HttpServletRequest request) {

		logger.info("myQnAList() 진입 >>> ");

		logger.info("mno >>> " + bvo.getMno());
		logger.info("name >>> " + bvo.getKeyword());
		logger.info("keyfilter >>> " + bvo.getKeyfilter());
		logger.info("startdate >>> " + bvo.getStartdate());
		logger.info("enddate >>> " + bvo.getEnddate());

		int totalCnt = 0;
		String cPage = request.getParameter("curPage");
		String pageCtrl = request.getParameter("pageCtrl");

		Paging.setPage(bvo, cPage, pageCtrl); // 페이징할 정보를 Paging클래스에 보내줍니다

		List<BoardVO> myQnAList = myinfoService.myQnAList(bvo);

		if (myQnAList.size() != 0) {
			totalCnt = myQnAList.get(0).getTotalCount(); // 쿼리 조회한 리스트의 0번 인덱스에 담긴 totalCount값
			bvo.setTotalCount(totalCnt); // vo에 담기
		}

		logger.info(bvo.getMno());
		logger.info(myQnAList.size());

		model.addAttribute("myQnAList", myQnAList);
		model.addAttribute("p_bvo", bvo);

		// -----------------------------------------------------------

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

	@RequestMapping(value = "myinfo/updateMyPW", method = RequestMethod.GET)
	public String updatePW() {
		logger.info("updatePW() 진입 >>> : ");

		return "myinfo/updateMyPW";
	}

	@RequestMapping(value = "myinfo/myPWUpdate", method = RequestMethod.POST)
	@ResponseBody
	public String myPWUpdate(MemberVO mvo, @RequestParam("nMpw") String nMpw) {
		logger.info("myPWUpdate() 진입 >>> : ");

		// 변경할 비밀번호
		logger.info("mid >>> :" + mvo.getMid());
		logger.info("mpw >>> :" + mvo.getMpw());
		logger.info("변경할 비밀번호"+nMpw);

		MemberVO _mvo = null;
		_mvo = new MemberVO();

		_mvo.setMpw(nMpw);

		int result = myinfoService.myPWUpdate(mvo, _mvo);

		logger.info("result >>> : " + result);

		if (result == 1) {
			return "OK";
		} else {
			return "ERROR";
		}
	}

	@RequestMapping(value = "myinfo/myLevelUpdate", method = RequestMethod.GET)
	@ResponseBody
	public String myLevelUpdate(BoardVO bvo) {

		logger.info("myRankUpdate() 진입 >>> ");
		int result = myinfoService.myLevelUpdate(bvo);
		// 조건 OK >> 셰프로 등급 올리기
		String sResult = "";
		if (result == 1) {
			ChefVO cvo = null;
			cvo = new ChefVO();
			cvo.setMno(bvo.getMno());

			String chefTableInsertResult = chefController.chefInsert(cvo);

			if (chefTableInsertResult.equals("OK")) {
				logger.info("셰프 등급이 정상적으로 셰프 테이블에 입력되었습니다.");
				sResult = "OK";
				return sResult;
			} else {
				logger.info("셰프 조건에 맞아서 회원 등급을 올렸지만 셰프 테이블에 정상적으로 반영되지 않았습니다.");
				sResult = "ERROR_INSERT_CHEF_DB";
				return sResult;
			}
		} else {
			return "ERROR";
		}
	}

	// 내가 추천한 레시피 가져오기 >> API 레시피
	@RequestMapping(value = "myinfo/myFavRecipeList", method = RequestMethod.GET)
	public String myFavRecipeList(MemberVO mvo, Model model, HttpServletRequest request) {
		logger.info("myFavRecipeList() 진입 >>> ");

		logger.info("mno >>> " + mvo.getMno());
		logger.info("name >>> " + mvo.getKeyword());
		logger.info("keyfilter >>> " + mvo.getKeyfilter());
		logger.info("startdate >>> " + mvo.getStartdate());
		logger.info("enddate >>> " + mvo.getEnddate());

		int totalCnt = 0;
		String cPage = request.getParameter("curPage");
		String pageCtrl = request.getParameter("pageCtrl");

		Paging.setPage(mvo, cPage, pageCtrl); // 페이징할 정보를 Paging클래스에 보내줍니다

		List<RecipeVO> recipeList = myinfoService.myFavRecipeList(mvo);

		logger.info("API 레시피 사이즈 >>> : " + recipeList.size());

		if (recipeList.size() != 0) {
			totalCnt = recipeList.get(0).getTotalCount(); // 쿼리 조회한 리스트의 0번 인덱스에 담긴
			mvo.setTotalCount(totalCnt); // vo에 담기

		}
		model.addAttribute("recipeList", recipeList);
		model.addAttribute("p_rbvo", mvo);

		return "myinfo/myFavRecipeList";
	}

	// 내가 추천한 레시피 가져오기 >> 유저 레시피
	@RequestMapping(value = "myinfo/myFavReciepBoardList", method = RequestMethod.GET)
	public String myFavRecipeBoardList(MemberVO mvo, Model model, HttpServletRequest request) {

		logger.info("mno >>> " + mvo.getMno());
		logger.info("name >>> " + mvo.getKeyword());
		logger.info("keyfilter >>> " + mvo.getKeyfilter());
		logger.info("startdate >>> " + mvo.getStartdate());
		logger.info("enddate >>> " + mvo.getEnddate());

		int totalCnt = 0;
		String cPage = request.getParameter("curPage");
		String pageCtrl = request.getParameter("pageCtrl");

		Paging.setPage(mvo, cPage, pageCtrl); // 페이징할 정보를 Paging클래스에 보내줍니다

		List<RecipeBoardVO> recipeBoardList = myinfoService.myFavRecipeBoardList(mvo);

		if (recipeBoardList.size() != 0) {
			totalCnt = recipeBoardList.get(0).getTotalCount(); // 쿼리 조회한 리스트의 0번 인덱스에 담긴 totalCount값
			mvo.setTotalCount(totalCnt); // vo에 담기

		}
		model.addAttribute("recipeBoardList", recipeBoardList);
		model.addAttribute("p_rbvo", mvo);

		return "myinfo/myFavRecipeBoardList";
	}

	// 내가 추천한 레시피 검색하기
	@RequestMapping(value = "myinfo/myFavRecipeList/SelectRecipe", method = RequestMethod.GET)
	public String myFavRecipeListSelect(MemberVO mvo, FavoritesVO fvo, Model model, HttpServletRequest request) {
		logger.info("myFavRecipeList() 진입 >>> ");
		List<RecipeVO> recipeList = new ArrayList<RecipeVO>();
		List<RecipeBoardVO> recipeBoardList = new ArrayList<RecipeBoardVO>();

		// api 검색 >>
		logger.info("mno >>> " + mvo.getMno());
		logger.info("name >>> " + mvo.getKeyword());
		logger.info("keyfilter >>> " + mvo.getKeyfilter());
		logger.info("startdate >>> " + mvo.getStartdate());
		logger.info("enddate >>> " + mvo.getEnddate());
		logger.info("recepiType >>> : " + fvo.getRecipeType());

		int totalCnt = 0;
		String cPage = request.getParameter("curPage");
		String pageCtrl = request.getParameter("pageCtrl");

		Paging.setPage(mvo, cPage, pageCtrl); // 페이징할 정보를 Paging클래스에 보내줍니다

		if (fvo.getRecipeType().equals("API")) {
			recipeList = myinfoService.myFavRecipeList(mvo);
			logger.info("조회된 레시피 개수 >>> : " + recipeList.size());
			if (recipeList.size() != 0) {
				totalCnt = recipeList.get(0).getTotalCount(); // 쿼리 조회한 리스트의 0번 인덱스에 담긴 totalCount값
				mvo.setTotalCount(totalCnt); // vo에 담기
			}
			model.addAttribute("recipeList", recipeList);
			model.addAttribute("p_rbvo", mvo);
			return "myinfo/myFavRecipeList";
		} else {
			// api 아닌 경우 >> user 레시피
			recipeBoardList = myinfoService.myFavRecipeBoardList(mvo);
			logger.info("조회된 레시피 개수 >>> : " + recipeBoardList.size());
			if (recipeBoardList.size() != 0) {
				totalCnt = recipeBoardList.get(0).getTotalCount(); // 쿼리 조회한 리스트의 0번 인덱스에 담긴 totalCount값
				mvo.setTotalCount(totalCnt); // vo에 담기

			}
			model.addAttribute("recipeBoardList", recipeBoardList);
			model.addAttribute("p_rbvo", mvo);
			return "myinfo/myFavRecipeBoardList";
		}
	}

	@RequestMapping(value = "myinfo/mySubList", method = RequestMethod.GET)
	public String mySubList(SubscribeVO svo, Model model) {

		List<SubscribeVO> mySubList = subscribeService.mySubList(svo);

		model.addAttribute("mySubList", mySubList);

		return "myinfo/mySubList";
	}

}
