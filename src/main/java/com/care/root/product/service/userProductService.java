package com.care.root.product.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface userProductService {

	public void productList(Model model);

	public void selectImg(String productNum, Model model);

	public void productView(String productNum, Model model);

	public void thumselectImg( Model model);

	public void categorySearch(HttpServletRequest request, String productCompany, Model model);

	public void category(HttpServletRequest request, String productcategory, Model model);

	public void applecategory(HttpServletRequest request, String productcategory, Model model, String productCompany);

	public void ProductSearch(Model model, String productSearch_option, String keyword);
	
	public void productPaymentList(String productNum, Model model);

}
