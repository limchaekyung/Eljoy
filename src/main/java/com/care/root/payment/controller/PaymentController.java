package com.care.root.payment.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.care.root.admin.product.service.productService;
import com.care.root.payment.dto.paymentDTO;
import com.care.root.payment.service.paymentService;
import com.care.root.product.service.userProductService;



@Controller
public class PaymentController {
	@Autowired userProductService ups;
	@Autowired paymentService ps;
	
	@RequestMapping("payment/paymentForm")   //결제 폼
	   public String paymentForm(@RequestParam String productNum,Model model) {
		
		
		ups.productPaymentList(productNum,model);
		
	      return "payment/paymentForm";
	   }
	@PostMapping("payment/payment")   //결제 api 빼고 alert창으로 바꿈
	   public void payment(HttpServletRequest request,HttpServletResponse response, paymentDTO dto) throws IOException {
		//System.out.println("to.payment_name() 컨트롤러 : "+request.getParameter("product_name"));
		String message = ps.payment(request, dto);
		//세션 넘겨주기
		PrintWriter out = response.getWriter();
		response.setContentType("text/html; chartset=utf-8");
		out.print(message);
	   }
	@RequestMapping("payment/paymentFinish")   //결제완료
	   public String paymentFinish() {
	      return "payment/paymentFinish";
	 }
	
}
