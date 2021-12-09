package com.care.root.login.controller;

import java.io.IOException;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.care.root.common.session.MemberSessionName;
import com.care.root.login.dto.SnsLogDTO;
import com.care.root.login.service.SnsLogService;

@Controller
public class SnsController {
	
	@Autowired
	SnsLogService sl;
	
	String id="";
	String gender="";
	@PostMapping(value="member/snsLogin", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String sns(//@RequestParam("email")String email, 
					//@RequestParam("gender")String gender,@RequestParam("profile")String profile 
					@RequestBody Map dto,HttpSession session,Model model) {
		System.out.println(dto.get("email"));
		System.out.println(dto.get("gender"));System.out.println(dto.get("profile"));
		String id=(String)dto.get("email");
		this.id=id;
		this.gender=(String)dto.get("gender");
		
		if(sl.check(id)==1) {//새로운 id
			System.out.println("새로운 id");		
			//session.setAttribute(MemberSessionName.LOGIN,id ); 
			return "{\"result\":\"success\"}";//새로운
		}else {			
			session.setAttribute(MemberSessionName.LOGIN, id); 
			return "{\"result\":\"old\"}";//기존
		}
	}
	@GetMapping("member/sns_join")
	public String snslog() {
		return "member/sns_join";
	}
	@PostMapping("member/sns_join")
	public String snslog(@RequestParam("user_name") String name,
			@RequestParam("user_email1") String email1,
			@RequestParam("user_email2") String email2,
			@RequestParam("user_tel1") String tel1,
			@RequestParam("user_tel2") String tel2,
			@RequestParam("user_tel3") String tel3,HttpSession session,
			HttpServletRequest request,HttpServletResponse response) throws Exception {
		SnsLogDTO dto=new SnsLogDTO();
		String tel=tel1+tel2+tel3;String email=email1+"@"+email2;
		System.out.println(id);
		//gender="M";
		if(gender.equals("male"))
			gender="M";
		else
			gender="F";
		System.out.println(gender);System.out.println(email);
		System.out.println(name);System.out.println(tel);
		dto.setId(id);dto.setEmail(email);dto.setGender(gender);
		dto.setPhone(tel);dto.setName(name);
		int result=sl.register(dto);
		if(result==1) {
			session.setAttribute(MemberSessionName.LOGIN, id); 
			return "redirect:/main";
		}else {
			request.setCharacterEncoding("utf-8"); response.setContentType("text/html; charset=utf-8");
			PrintWriter out=response.getWriter();
			out.print("<script>"+
			"alert('로그인에 실패하였습니다'); history.back();"+
			"</script>");
			return "null";
		}
	}
}
