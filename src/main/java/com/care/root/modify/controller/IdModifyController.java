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
import com.care.root.modify.dto.IdDTO;
import com.care.root.modify.service.IdModifyService;


@Controller
public class IdModifyController {
	@Autowired
	IdModifyService is;
	@GetMapping("member/id_modify")
	public String modify(Model model,HttpSession session) {
		is.Id_Service(model,(String)session.getAttribute(MemberSessionName.LOGIN));
		
		return "member/id_modify";
	}
	@PostMapping("member/id_modify")
	public String modify(@RequestParam("user_id") String id,@RequestParam("user_pw") String pw,
			@RequestParam("user_name") String name,	@RequestParam("user_tel") String tel,
			@RequestParam("user_email") String email) {
		IdDTO dto=new IdDTO();
		dto.setUser_id(id);dto.setUser_phone(tel); dto.setUser_email(email);dto.setUser_pw(pw);dto.setUser_name(name);
		
		System.out.println(dto.getUser_email()); System.out.println(dto.getUser_phone());
		System.out.println(dto.getUser_id());System.out.println(dto.getUser_name());
		System.out.println(dto.getUser_pw());
		is.id_modify(dto);
		
		return "redirect:/main";
	}
	@PostMapping(value="member/id_email_check", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String id_email_check(@RequestParam("user_email") String email,HttpSession session) {
		int result=is.id_email_check(email, session);
		System.out.println(email);
		System.out.println(result);
		if(result==1)
			return "{\"result\":\"success\"}";
		else
			return "{\"result\":\"fail\"}";
	}
	@PostMapping(value="member/id_phone_check", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String id_phone_check(@RequestParam("user_tel") String phone, HttpSession session) {
		int result=is.id_phone_check(phone, session);
		System.out.println(phone);
		System.out.println(result);
		if(result==1)
			return "{\"result\":\"success\"}";
		else 
			return "{\"result\":\"fail\"}";
	}
}
