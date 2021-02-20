package com.jns.product.controller;

import java.util.List;

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

import com.jns.member.vo.MemberVO;
import com.jns.product.service.ProductService;
import com.jns.product.vo.ProductVO;

@Controller
public class ProductController {

	private ProductService service;

	@Autowired(required=false)
	public ProductController(ProductService service) {
		this.service = service;
	}

	//상품 검색 페이지로 이동
	@RequestMapping("searchPage.do")
	public String search() {
		return "product/searchProduct";
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
		//로그인 사용자 mno 가져오기
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Object principal = auth.getPrincipal();
		String mno = ((MemberVO)principal).getMno();
		System.out.println("현재 로그인한 사용자 mno >> " + mno);
		pvo.setMno(mno);
		List<ProductVO> list = service.likeProductSelectAll(pvo);
		model.addAttribute("list",list);
		model.addAttribute("size", list.size());
		return "product/likeProduct";
	}

	//관심상품 정보 db저장하기
	@RequestMapping(value="likeProductInsert.do", method=RequestMethod.POST)
	public int likeProductInsert(@RequestBody ProductVO pvo) {
		//로그인 사용자 mno 가져오기
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Object principal = auth.getPrincipal();
		String mno = ((MemberVO)principal).getMno();
		System.out.println("현재 로그인한 사용자 mno >> " + mno);
		pvo.setMno(mno);

		return service.likeProductInsert(pvo);
	}

	//관심상품 정보 삭제
	@RequestMapping(value="likeProductDelete.do", method=RequestMethod.POST)
	public int likeProductInsertDelete(@RequestBody ProductVO pvo) {
		//로그인 사용자 mno 가져오기
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Object principal = auth.getPrincipal();
		String mno = ((MemberVO)principal).getMno();
		System.out.println("현재 로그인한 사용자 mno >> " + mno);
		pvo.setMno(mno);

		return service.likeProductDelete(pvo);
	}
}
