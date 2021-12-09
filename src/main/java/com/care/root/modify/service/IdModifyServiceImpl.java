package com.care.root.modify.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.root.common.session.MemberSessionName;
import com.care.root.modify.dto.IdDTO;
import com.care.root.modify.mybatis.IdModifyMapper;

@Service
public class IdModifyServiceImpl implements IdModifyService{
	@Autowired
	IdModifyMapper im;
	
	@Override
	public void Id_Service(Model model, String id) {
		IdDTO dto=im.modify(id);
		dto.getUser_phone();
		model.addAttribute("model",im.modify(id));
	}
	@Override
	public int id_email_check(String email, HttpSession session) {
		IdDTO dto=im.Id_email(email);
		if(dto==null)
			return 1;
		else {
		if(dto.getUser_id().equals(session.getAttribute(MemberSessionName.LOGIN))) 
			return 1;
		else 
			return 0;
		}	
	}
	@Override
	public int id_phone_check(String phone, HttpSession session) {
		IdDTO dto=im.Id_phone(phone);
		if(dto==null)
			return 1;
		else {
			if(dto.getUser_id().equals(session.getAttribute(MemberSessionName.LOGIN)))
				return 1;
			else
				return 0;
		}
	}
	@Override
	public void id_modify(IdDTO dto) {
		BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();
		
		String securPw=encoder.encode(dto.getUser_pw());
		dto.setUser_pw(securPw);
		im.id_modify(dto);
	}
	
}
