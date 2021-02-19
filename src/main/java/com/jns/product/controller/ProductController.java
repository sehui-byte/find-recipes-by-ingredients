package com.jns.product.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

	@RequestMapping(value="search.do",method=RequestMethod.GET, produces="application/json; charset=UTF-8")
	@ResponseBody
	public String getApi(@RequestParam(defaultValue="") String keyword) {
		return service.naverSearchApi(keyword);
	}

	//관심상품 정보 조회
	@RequestMapping(value="likeProduct.do", method=RequestMethod.GET)
	public String likeList(Model model) {
		List<ProductVO> list = service.likeProductSelectAll();
		model.addAttribute("list",list);
		model.addAttribute("size", list.size());
		return "product/likeProduct";
	}

	//관심상품 정보 db저장하기
	@RequestMapping(value="likeProductInsert.do", method=RequestMethod.POST)
	public int likeProductInsert(@RequestBody ProductVO pvo) {
		return service.likeProductInsert(pvo);
	}

	//관심상품 정보 삭제
	@RequestMapping(value="likeProductDelete.do", method=RequestMethod.POST)
	public int likeProductInsertDelete(@RequestBody ProductVO pvo) {
		return service.likeProductDelete(pvo);
	}
}
