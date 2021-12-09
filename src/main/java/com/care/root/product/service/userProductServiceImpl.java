package com.care.root.product.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.root.adminProduct.mtbatis.productMapper;
import com.care.root.product.dto.userProductDTO;
import com.care.root.product.mybatis.userProductMapper;
@Service
public class userProductServiceImpl implements userProductService{
	@Autowired userProductMapper mapper;
	//@Autowired productMapper promapper;
	@Override
	public void productList(Model model) {
		model.addAttribute("productList",mapper.productList());
		
		
	}
	//상품상세보기
	@Override
	public void productView(String productNum, Model model) {
		model.addAttribute("productView",mapper.adminProductView(productNum));
		
	}
	//상품상세보기 이미지
	@Override
	public void selectImg(String productNum, Model model) {
		model.addAttribute("productImg",mapper.attachmentList(productNum));
		
	}
	@Override
	public void thumselectImg(Model model) {
		model.addAttribute("attachmentThumList"+mapper.attachmentThumList());
		
	}
	@Override
	public void categorySearch(HttpServletRequest request, String productCompany, Model model) {
		
		model.addAttribute("categorySearch",mapper.categorySearch(productCompany));
		
	}
	@Override
	public void category(HttpServletRequest request, String productcategory, Model model) {
		model.addAttribute("category",mapper.category(productcategory));
		
	}
	@Override
	public void applecategory(HttpServletRequest request, String productcategory, Model model, String productCompany) {
		userProductDTO dto = new userProductDTO();
		dto.setProductCompany(productCompany);
		dto.setProductCategory(productcategory);
		model.addAttribute("applecategory",mapper.applecategory(dto));
		
	}
	@Override
	public void ProductSearch(Model model, String productSearch_option, String keyword) {
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("productSearch_option", productSearch_option);
		map.put("keyword", keyword);
		
		model.addAttribute("productSearch", mapper.ProductSearch(map));
		
	};
	
	@Override
	public void productPaymentList(String productNum, Model model) {
		model.addAttribute("PaymentList",mapper.productPaymentList(productNum));
		
	};
	
	
	

}
