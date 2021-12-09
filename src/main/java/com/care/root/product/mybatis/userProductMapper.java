package com.care.root.product.mybatis;

import java.awt.List;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Map;

import com.care.root.admin.product.dto.productDTO;
import com.care.root.admin.product.dto.productImageDTO;
import com.care.root.payment.dto.paymentDTO;
import com.care.root.product.dto.userProductDTO;

public interface userProductMapper {

	public ArrayList<productDTO> productList();

	public productImageDTO attachmentList(String productNum);

	public productDTO adminProductView(String productNum);

	public ArrayList<userProductDTO> attachmentThumList();

	public ArrayList<productDTO> categorySearch(String productCompany);

	public ArrayList<productDTO> category(String productcategory);

	public ArrayList<productDTO> applecategory(userProductDTO dto);

	public ArrayList<userProductDTO> ProductSearch(Map<String, String> map);

	public userProductDTO productPaymentList(String productNum);
	
	public int pamentSave(paymentDTO dto);

	

	

}
