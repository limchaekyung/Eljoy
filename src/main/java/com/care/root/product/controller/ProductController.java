package com.care.root.product.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.care.root.admin.product.service.productService;
import com.care.root.product.service.userProductService;


@Controller
public class ProductController {
	@Autowired userProductService ps;
	//상품 리스트
	@GetMapping("Product/ProductList")
	public String adminProductList(Model model/*,@RequestParam String productNum*/){
		ps.productList(model);
		
		ps.thumselectImg(model);//불러오기 
		return "Product/ProductList";
	}
		
	//상품 내용 확인 
	@RequestMapping("Product/ProductView")
	public String adminProductView(@RequestParam String productNum, Model model) {
		ps.productView(productNum,model);
		ps.selectImg(productNum,model);//썸네일 불러오기 
		return "Product/ProductView";
	}
		
	//상품 검색
	@RequestMapping("Product/ProductSearch")
	public String adminProductSearch(Model model,@RequestParam(defaultValue="product_num") String ProductSearch_option,@RequestParam(defaultValue="") String keyword){
		ps.ProductSearch(model,ProductSearch_option,keyword);
		model.addAttribute("productSearch_option", ProductSearch_option);
		model.addAttribute("keyword", keyword);
		return "Product/ProductSearch";
	}
	@RequestMapping("Product/categorySearch")
	public String categorySearch(HttpServletRequest request,@RequestParam String productCompany, Model model) {
		ps.categorySearch(request,productCompany,model);
		System.out.println("productcategory 컨트롤 : "+productCompany);
		return "Product/companySearch";
	}
	
	@RequestMapping("Product/category")
	public String category(HttpServletRequest request,String productcategory, Model model) {
		ps.category(request,productcategory,model);
		System.out.println("productcategory 컨트롤 : "+productcategory);
		return "Product/categorySearch";
	}
	
	@RequestMapping("Product/applecategory")
	public String applecategory(HttpServletRequest request,@RequestParam String productcategory,@RequestParam String productCompany, Model model) {
		ps.applecategory(request,productcategory,model,productCompany);
		
		return "Product/applecategory";
	}
}
