package com.jns.product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jns.product.service.ProductService;

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
	
	//관심상품 페이지로 이동
	@RequestMapping("likeProduct.do")
	public String likePage() {
		return "product/likeProduct";
	}
	
	@RequestMapping(value="search.do",method=RequestMethod.GET, produces="application/json; charset=UTF-8")
	@ResponseBody
	public String getApi(@RequestParam(defaultValue="") String keyword) {
		return service.naverSearchApi(keyword);
	}
}
