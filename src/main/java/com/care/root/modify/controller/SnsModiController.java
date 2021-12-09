package com.care.root.modify.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.care.root.common.session.MemberSessionName;
import com.care.root.modify.dto.SnsDTO;
import com.care.root.modify.service.SnsModiService;

@Controller
public class SnsModiController {
	
	@Autowired
	SnsModiService sm;
	@GetMapping("member/sns_modify")
	public String sns_modify(Model model,HttpSession session) {
		sm.snsInfo(model,(String)session.getAttribute(MemberSessionName.LOGIN)); 
		return "member/sns_modify";
	}
	@PostMapping(value="member/sns_email_check", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String id_email_check(@RequestParam("sns_email") String email,HttpSession session) {
		int result=sm.email_check(email, session);
		System.out.println(email);
		System.out.println(result);
		if(result==1)
			return "{\"result\":\"success\"}";
		else
			return "{\"result\":\"fail\"}";
	}
	@PostMapping(value="member/sns_phone_check", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String id_phone_check(@RequestParam("sns_tel") String phone, HttpSession session) {
		int result=sm.phone_check(phone, session);
		System.out.println(phone);
		System.out.println(result);
		if(result==1)
			return "{\"result\":\"success\"}";
		else 
			return "{\"result\":\"fail\"}";
	}
	@PostMapping("member/sns_modify")
	public String modify(@RequestParam("sns_id") String id,
			@RequestParam("sns_name") String name,	@RequestParam("sns_tel") String tel,
			@RequestParam("sns_email") String email) {
		SnsDTO dto=new SnsDTO();
		dto.setEmail(email);dto.setId(id);dto.setName(name);dto.setPhone(tel);
		sm.sns_modify(dto);
		
		return "redirect:/main";
	}
}
