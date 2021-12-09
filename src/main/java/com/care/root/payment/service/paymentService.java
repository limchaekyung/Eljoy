package com.care.root.payment.service;

import javax.servlet.http.HttpServletRequest;

import com.care.root.payment.dto.paymentDTO;

public interface paymentService {

public String payment(HttpServletRequest request, paymentDTO dto);

}
