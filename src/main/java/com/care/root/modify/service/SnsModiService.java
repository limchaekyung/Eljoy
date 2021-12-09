package com.care.root.modify.service;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.care.root.modify.dto.SnsDTO;

public interface SnsModiService {
	public void snsInfo(Model model,String id);
	public int email_check(String email, HttpSession session);
	public int phone_check(String phone, HttpSession session);
	public void sns_modify(SnsDTO dto);
}
