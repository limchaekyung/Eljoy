package com.care.root.join.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.care.root.join.dto.JoinDTO;
import com.care.root.join.service.JoinService;

@Controller
public class JoinController {
	@Autowired
	JoinService js;
	
	@GetMapping("member/join")
	public String join() {
		return "redirect:terms";
	}
	@GetMapping("member/joinForm")
	public String joinForm() {
		
		return "member/join";
	}
	@PostMapping("member/join")
	public String join(@RequestParam("user_id") String id,
			@RequestParam("user_pw") String pw,
			@RequestParam("user_name") String name,
			@RequestParam("user_email1") String email1,
			@RequestParam("user_email2") String email2,
			@RequestParam("user_tel1") String tel1,
			@RequestParam("user_tel2") String tel2,
			@RequestParam("user_tel3") String tel3,
			@RequestParam("user_gender") String gender,
			JoinDTO dto,HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		System.out.println("id:"+id);
		System.out.println("pw:"+pw);
		System.out.println("name:"+name);
		System.out.println("email:"+email1+"@"+email2);
		System.out.println("tel:"+tel1+tel2+tel3);
		System.out.println("gender:"+gender);
		
		String email=email1+"@"+email2; String phone=tel1+tel2+tel3;
		dto.setUser_id(id); dto.setUser_pw(pw);
		dto.setUser_email(email);
		dto.setUser_phone(phone); dto.setUser_name(name); dto.setUser_gender(gender);
		js.join(dto);
		return "main";
	}
	@GetMapping("member/terms")
	public String terms() {
		return "member/TermsService";
	}
	@PostMapping(value="member/id_check", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String id_check(@RequestParam("user_id") String id) {
		System.out.println(id);
		System.out.println(js.id_check(id));
		if(js.id_check(id)==1){//"{\"result\":\"success\"}"
		
		return "{\"result\":\"success\"}";
		}
		else {
			return "{\"result\":\"fail\"}";
		}
	}
	@PostMapping(value="member/email_check", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String email_check(@RequestParam("user_email") String email) {
		System.out.println(email);
		System.out.println("emailcheck"+js.email_check(email));
		if(js.email_check(email)==1){//"{\"result\":\"success\"}"
		
		return "{\"result\":\"success\"}";
		}
		else {
			return "{\"result\":\"fail\"}";
		}
	}
	@PostMapping(value="member/phone_check", produces="application/json; charset=utf-8")
	@ResponseBody
	public String phone_check(@RequestParam("user_phone") String phone) {
		System.out.println(phone);
		System.out.println("phonecheck"+js.phone_check(phone));
		if(js.phone_check(phone)==1) {
			return "{\"result\":\"success\"}";
		}else {
			return "{\"result\":\"fail\"}";
		}
	}
}
