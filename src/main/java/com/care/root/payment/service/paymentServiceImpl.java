package com.care.root.payment.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.care.root.admin.product.service.productFileService;
import com.care.root.admin.product.service.productFileServiceImpl;
import com.care.root.payment.dto.paymentDTO;
import com.care.root.product.mybatis.userProductMapper;

@Service
public class paymentServiceImpl implements paymentService{
	@Autowired userProductMapper mapper;
	@Override
	public String payment(HttpServletRequest request, paymentDTO dto) {
		//System.out.println("product_name) 서비스 : "+product_name);
		// 세션 받아서 
		//dto.setMember_id(받아온 세션 넣기);
		dto.setPayment_addr1(request.getParameter("payment_addr1")); //주소
		dto.setPayment_addr2(request.getParameter("payment_addr2")); //주소
		dto.setPayment_addr3(request.getParameter("payment_addr3")); //주소
		dto.setPayment_deliveryMemo(request.getParameter("payment_memo")); //배송 메시지
		dto.setPayment_phone(request.getParameter("payment_phone")); //주문자 핸드폰 번호
		dto.setProduct_name(request.getParameter("product_name"));
		dto.setPayment_name(request.getParameter("payment_name")); //주문자 이름
		dto.setProduct_num(request.getParameter("product_num")); // 상품번호
		
		productFileService pfs = new productFileServiceImpl();
		
		return pfs.paymentGetMessage(mapper.pamentSave(dto), request); 
		
	}

}
