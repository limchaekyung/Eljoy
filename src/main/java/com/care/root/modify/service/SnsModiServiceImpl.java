package com.care.root.modify.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.root.common.session.MemberSessionName;
import com.care.root.modify.dto.SnsDTO;
import com.care.root.modify.mybatis.SnsModiMapper;

@Service
public class SnsModiServiceImpl implements SnsModiService{
	@Autowired
	SnsModiMapper smm;
	@Override
	public void snsInfo(Model model, String id) {
		SnsDTO dto=smm.snsInfo(id);
		System.out.println(id);
		//System.out.println(dto.getId());
		model.addAttribute("model", smm.snsInfo(id));
	}
	@Override
	public int email_check(String email, HttpSession session) {
		SnsDTO dto=smm.email_check(email);
		if(dto==null)
			return 1;
		else {
			if(dto.getId().equals(session.getAttribute(MemberSessionName.LOGIN)))
				return 1;
			else 
				return 0;
		}
	}
	@Override
	public int phone_check(String phone, HttpSession session) {
		SnsDTO dto=smm.phone_check(phone);
		if(dto==null)
			return 1;
		else {
			if(dto.getId().equals(session.getAttribute(MemberSessionName.LOGIN)))
				return 1;
			else 
				return 0;
		}
	}
	@Override
	public void sns_modify(SnsDTO dto) {
		smm.sns_modify(dto);
	}
	
}
