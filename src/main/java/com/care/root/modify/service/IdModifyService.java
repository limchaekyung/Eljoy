package com.care.root.modify.service;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.care.root.modify.dto.IdDTO;

public interface IdModifyService {
	public void Id_Service(Model model,String id);
	public void id_modify(IdDTO dto);
	public int id_email_check(String email, HttpSession session);
	public int id_phone_check(String phone, HttpSession session);
}
