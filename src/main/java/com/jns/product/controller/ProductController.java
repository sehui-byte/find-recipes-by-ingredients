package com.jns.product.controller;

import java.util.List;

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
import com.jns.member.controller.MemberController;
import com.jns.member.vo.MemberVO;
import com.jns.product.service.ProductService;
import com.jns.product.vo.ProductVO;

@Controller
public class ProductController {

	private ProductService service;
	private ChabunService chabun;
	HttpSession session;
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

	//네이버 open api 이용해서 json데이터 받아서 @responsebody로 jsp페이지에 데이터 보내준다
	@RequestMapping(value="search.do",method=RequestMethod.GET, produces="application/json; charset=UTF-8")
	@ResponseBody
	public String getApi(@RequestParam(defaultValue="") String keyword) {
		return service.naverSearchApi(keyword);
	}

	//관심상품 정보 조회
	@RequestMapping(value="likeProduct.do", method=RequestMethod.GET)
	public String likeList(Model model) {
		ProductVO pvo = new ProductVO();
		List<ProductVO> list = service.likeProductSelectAll(pvo);
		model.addAttribute("list",list);
		model.addAttribute("size", list.size());
		return "product/likeProduct";
	}

	//관심상품 정보 db저장하기
	@ResponseBody
	@RequestMapping(value="likeProductInsert.do", method=RequestMethod.POST)
	public int likeProductInsert(@RequestBody ProductVO pvo) {	
		//채번
		String lpno = ChabunUtil.getLikeProductChabun("D", chabun.getLikeProductChabun().getLpno());
		System.out.println("생성된채번 >> " + lpno);
		pvo.setLpno(lpno);
		service.likeProductInsert(pvo);
		return service.likeProductInsert(pvo);
	}

	//관심상품 정보 삭제
	@ResponseBody
	@RequestMapping(value="likeProductDelete.do", method=RequestMethod.POST)
	public int likeProductInsertDelete(@RequestBody ProductVO pvo) {
		service.likeProductDelete(pvo);
		return service.likeProductDelete(pvo);
	}
	
	//(Test)소켓 테스트 페이지로 이동
	@RequestMapping("socketTest.do")
	public String socketTest() {
		return "product/webSocketTest";
	}
}
