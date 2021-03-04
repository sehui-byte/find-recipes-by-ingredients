package com.jns.product.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jns.chabun.service.ChabunService;
import com.jns.common.ChabunUtil;
import com.jns.common.Paging;
import com.jns.member.controller.MemberController;
import com.jns.member.vo.MemberVO;
import com.jns.product.service.ProductService;
import com.jns.product.vo.ProductVO;

@Controller
public class ProductController {

	private ProductService service;
	private ChabunService chabun;
	Logger logger = Logger.getLogger(ProductController.class);

	@Autowired(required=false)
	public ProductController(ProductService service, ChabunService chabun) {
		this.service = service;
		this.chabun = chabun;
	}

	//상품 검색 페이지로 이동
	@RequestMapping("searchPage.do")
	public String search() {
		return "product/searchProduct";
	}

	//유저의 기존 관심상품 목록 productId 가져와서 search.jsp 페이지에 넘기는 부분
	@RequestMapping("chkLikeProductId.do")
	public @ResponseBody List<ProductVO> getProductId(){
		ProductVO pvo = new ProductVO();
		List<ProductVO> list = service.likpProductIdSelectAll(pvo);
		return list;
	}
	
	//유저의 기존 관심상품 목록 productId, title, lprice 가져와서 lpriceProduct.jsp 페이지에 넘기는 부분
	@RequestMapping("getlikeProInfo.do")
	public @ResponseBody List<ProductVO> getlikeProInfoSelectAll(){
		ProductVO pvo = new ProductVO();
		List<ProductVO> list = service.getlikeProInfoSelectAll(pvo);
		return list;
	}

	//네이버 open api 이용해서 json데이터 받아서 @responsebody로 jsp페이지에 데이터 보내준다
	@RequestMapping(value="search.do",method=RequestMethod.GET, produces="application/json; charset=UTF-8")
	@ResponseBody
	public String getApi(@RequestParam(defaultValue="") String keyword) {
		return service.naverSearchApi(keyword);
	}

	//관심상품 정보 조회
	@RequestMapping(value="likeProduct.do", method=RequestMethod.GET)
	public String likeList(ProductVO pvo,Model model,HttpServletRequest request) {
		
		//페이징 세팅	
		int totalCnt = 0;
		String curPage = request.getParameter("curPage");
		String pageCtrl = request.getParameter("pageCtrl");
				
		Paging.setPage(pvo, curPage, pageCtrl);
			
		List<ProductVO> listPage = service.likeProductpaging(pvo);
		logger.info("product page >>> likeProductpaging listPage.size() "+listPage.size());
				
		if( listPage.size() > 0) {
				totalCnt = listPage.get(0).getTotalCount(); // 쿼리 조회한 리스트의 0번 인덱스에 담긴 totalCount값
				pvo.setTotalCount(totalCnt);				// vo에 담기
			}

		model.addAttribute("listPage", listPage);
		model.addAttribute("p_pvo", pvo);

		
		return "product/likeProduct";
	}

	//관심상품 정보 db저장하기
	@RequestMapping(value="likeProductInsert.do", method=RequestMethod.POST)
	public String likeProductInsert(@RequestBody ProductVO pvo) {	
		//채번
		String lpno = ChabunUtil.getLikeProductChabun("D", chabun.getLikeProductChabun().getLpno());
		logger.info("생성된채번 >> " + lpno);
		pvo.setLpno(lpno);

		//최고가가 0이면 최저가와 같게 설정
		if(pvo.getHprice().equals("0"))
			pvo.setHprice(pvo.getLprice());

		service.likeProductInsert(pvo);
		return "redirect:searchPage.do";
	}

	//관심상품 정보 삭제
	@RequestMapping(value="likeProductDelete.do", method=RequestMethod.POST)
	public String likeProductInsertDelete(@RequestBody ProductVO pvo) {
		service.likeProductDelete(pvo);
		return "redircet:searchPage.do";
	}


	//(Test)소켓 테스트 페이지로 이동
	@RequestMapping("socketTest2")
	public String socketTest2() {
		//service.lpriceChk(pvo,mid);
		return "product/webSocketTest2";
	}
/*
	// 관심상품 조회 페이징 
	@RequestMapping(value="likeProduct.do", method=RequestMethod.GET)
	public String likeProductpaging(ProductVO pvo,Model model,HttpServletRequest request) {
	
		
		logger.info("페이징 시작 >>> :: ");		
		logger.info("회원 번호 >>> : " + pvo.getMno());
		
		//페이징 세팅	
		int totalCnt = 0;
		String pPage = request.getParameter("curPage");
		String pageCtrl = request.getParameter("pageCtrl");
		
		Paging.setPage(pvo, pPage, pageCtrl);
		
		List<ProductVO> listPage = service.likeProductpaging(pvo);
		logger.info("product page >>> likeProductpaging listPage.size() "+listPage.size());
		
		if( listPage.size() != 0) {
			totalCnt = listPage.get(0).getTotalCount(); // 쿼리 조회한 리스트의 0번 인덱스에 담긴 totalCount값
			pvo.setTotalCount(totalCnt);				// vo에 담기
		}

		model.addAttribute("listPage", listPage);
		model.addAttribute("p_pvo", pvo);

		return "product/likeProduct";	
		
		}
*/
	
	// 최저가 변동 팝업창 띄우기
	@RequestMapping("popup.do")
	public String lpricepopup() {
		return "product/lpricepopup";
	}
}
