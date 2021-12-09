package com.care.root.find.controller;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.care.root.find.dto.IdDTO;
import com.care.root.find.service.IdService;
import com.care.root.join.service.MailService;

@Controller
public class IdController {
	
	@Autowired
	IdService ls;
	@Autowired
	MailService ms;
	
	String email="";
	String name="";
	
	@GetMapping("member/id_find")
	public String id_find() {
		return "member/id_find";
	}
	@PostMapping(value="member/id_name", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String id_name(@RequestParam("user_name")String name) {	
		System.out.println(name);
		int result=ls.id_name(name);
		if(result==1)
			return "{\"result\":\"success\"}";
		else
			return "{\"result\":\"fail\"}";
	}
	@PostMapping(value="member/id_find",produces = "application/json; charset=utf-8")
	@ResponseBody
	public String id_find(@RequestBody Map dto) {
		System.out.println(dto.get("user_name"));
		//System.out.println(dto.get("user_email1"));
		//System.out.println(dto.get("user_email2"));
		email=dto.get("user_email1")+"@"+dto.get("user_email2");
		name=(String)dto.get("user_name");
		System.out.println(email);
		
		return "{\"result\":\"success\"}";
	}
	
	@RequestMapping("member/id_popup")
	public String id_popup(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		System.out.println("id_popup");
		//아이디 찾기
		ls.id_name(name);
		//이메일 전송
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		//MailService mail=new MailService();
		String code=ms.rand();
		PrintWriter out=response.getWriter();
		
		String str="";
		//System.out.println("str:"+str);
		str+="<html><body>";
		str+="<h1>id인증 코드입니다</h1>";
		str+=code;
		str+="</body></html>";
		System.out.println(code);
		ms.sendMail(email, "id찾기 메일입니다", str);
		session.setAttribute("id_find", code);
		return "member/id_popup";
	}
	@GetMapping("member/id_found")
	@ResponseBody
	public IdDTO id_found(Model model, HttpSession session) {
		IdDTO dto=ls.id_found(name);
		System.out.println("id:"+dto.getId());
		return dto;
	}
	}
