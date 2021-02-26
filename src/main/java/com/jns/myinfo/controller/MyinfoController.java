package com.jns.myinfo.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
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
import org.springframework.web.servlet.ModelAndView;

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

	@RequestMapping(value="myinfo/myRecipeListPage", method = RequestMethod.GET)
	public String myRecipeListPage(RecipeBoardVO rbvo, HttpServletRequest request,
									Model model) {
		
		List<RecipeBoardVO> myRecipeList = myinfoService.myRecipeListPage(rbvo);
		
		int totalCnt = 0;
		String cPage = request.getParameter("curPage");
		String pageCtrl = request.getParameter("pageCtrl");

		logger.info(cPage);
		logger.info(pageCtrl);
		
		Paging.setPage(rbvo, cPage, pageCtrl); //페이징할 정보를 Paging클래스에 보내줍니다
		
		List<RecipeBoardVO> listPage = myinfoService.myRecipeListPage(rbvo);
		
		if( listPage.size() != 0) {
			totalCnt = listPage.get(0).getTotalCount(); // 쿼리 조회한 리스트의 0번 인덱스에 담긴 totalCount값
			rbvo.setTotalCount(totalCnt);				// vo에 담기
		}
		
		
		model.addAttribute("myRecipeList", myRecipeList);
		model.addAttribute("p_rbvo", rbvo);
		
		return "myinfo/myRecipeList";
	}
	
	
	
	
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
		logger.info(nMpw);

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
		logger.info("recepiType >>> : " + fvo.getRecipeType());

		if (fvo.getRecipeType().equals("API")) {
			recipeList = myinfoService.myFavRecipeList1(mvo);
			mvo.setKeyfilter("");
			mvo.setKeyword("");
			mvo.setEnddate("");
			mvo.setStartdate("");
			recipeBoardList = myinfoService.myFavRecipeList2(mvo);
		} else {
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

	@RequestMapping(value = "myinfo/mySubList", method = RequestMethod.GET)
	public String mySubList(SubscribeVO svo, Model model) {

		List<SubscribeVO> mySubList = subscribeService.mySubList(svo);

		model.addAttribute("mySubList", mySubList);

		return "myinfo/mySubList";
	}

//=======================test=========================

	@RequestMapping(value = "myinfo/test.do", method = RequestMethod.GET)
	public String Test(Model model) {
		ModelAndView mav = new ModelAndView();
		/*
		 * ================================================flask 웹 페이지 내부 string을 읽어온다.
		 * String sb = ""; try { HttpURLConnection conn = (HttpURLConnection) new
		 * URL(url).openConnection();
		 * 
		 * BufferedReader br = new BufferedReader(new
		 * InputStreamReader(conn.getInputStream(), "utf-8"));
		 * 
		 * String line = null;
		 * 
		 * while ((line = br.readLine()) != null) { sb = sb + line + "\n"; }
		 * System.out.println("========br======" + sb.toString()); if
		 * (sb.toString().contains("ok")) { System.out.println("test");
		 * 
		 * } br.close();
		 * 
		 * System.out.println("" + sb.toString()); } catch (MalformedURLException e) {
		 * e.printStackTrace(); } catch (IOException e) { // TODO Auto-generated catch
		 * block e.printStackTrace(); } mav.addObject("test1", sb.toString()); //
		 * "test1"는 jsp파일에서 받을때 이름, // sb.toString은 value값(여기에선 test)
		 * mav.addObject("fail", false); mav.setViewName("test"); // jsp파일 이름 return
		 * mav;
		 */
		//=============================================웹 페이지를 그대로 가져옴 사진도
		/*
		URL url = null;
		HttpURLConnection conn = null;
		String jsonData = "";
		BufferedReader br = null;
		StringBuffer sb = null;
		String returnText = "";

		try {
			url = new URL("http://localhost:5000/tospring");

			conn = (HttpURLConnection) url.openConnection();
			conn.setRequestProperty("Accept", "application/json");
			conn.setRequestMethod("GET");
			conn.connect();

			br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));

			sb = new StringBuffer();

			while ((jsonData = br.readLine()) != null) {
				sb.append(jsonData);
			}

			returnText = sb.toString();

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (br != null)
					br.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		model.addAttribute("returnText", returnText);
		*/
			String spec = "http://localhost:5000/static/image/test.png";
	        String outputDir = "D:/sample/output/download";
	        InputStream is = null;
	        FileOutputStream os = null;
	        try{
	            URL url = new URL(spec);
	            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	            int responseCode = conn.getResponseCode();

	            System.out.println("responseCode " + responseCode);

	            // Status 가 200 일 때
	            if (responseCode == HttpURLConnection.HTTP_OK) {
	                String fileName = "";
	                String disposition = conn.getHeaderField("Content-Disposition");
	                String contentType = conn.getContentType();
	                
	                // 일반적으로 Content-Disposition 헤더에 있지만 
	                // 없을 경우 url 에서 추출해 내면 된다.
	                if (disposition != null) {
	                    String target = "filename=";
	                    int index = disposition.indexOf(target);
	                    if (index != -1) {
	                        fileName = disposition.substring(index + target.length() + 1);
	                    }
	                } else {
	                    fileName = spec.substring(spec.lastIndexOf("/") + 1);
	                }

	                System.out.println("Content-Type = " + contentType);
	                System.out.println("Content-Disposition = " + disposition);
	                System.out.println("fileName = " + fileName);

	                is = conn.getInputStream();
	                os = new FileOutputStream(new File(outputDir, fileName));

	                final int BUFFER_SIZE = 4096;
	                int bytesRead;
	                byte[] buffer = new byte[BUFFER_SIZE];
	                while ((bytesRead = is.read(buffer)) != -1) {
	                    os.write(buffer, 0, bytesRead);
	                }
	                os.close();
	                is.close();
	                System.out.println("File downloaded");
	            } else {
	                System.out.println("No file to download. Server replied HTTP code: " + responseCode);
	            }
	            conn.disconnect();
	        } catch (Exception e){
	            System.out.println("An error occurred while trying to download a file.");
	            e.printStackTrace();
	            try {
	                if (is != null){
	                    is.close();
	                }
	                if (os != null){
	                    os.close();
	                }
	            } catch (IOException e1){
	                e1.printStackTrace();
	            }
	        }	
		
		
		
		return "test";
	}

}
