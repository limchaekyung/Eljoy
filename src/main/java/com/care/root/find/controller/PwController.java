package com.care.root.find.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.care.root.find.dto.PwDTO;
import com.care.root.find.service.PwService;
import com.care.root.join.service.MailService;

@Controller
@RequestMapping("member")
public class PwController {
	@Autowired
	PwService ps;
	@Autowired
	MailService ms;
	
	String email="";
	String id="";
	String name="";
	@GetMapping("pw_find")
	public String pw_find() {
		return "member/pw_find";
	}
	@PostMapping("pw_find")
	public String pw_find(@RequestParam("user_id") String id,@RequestParam("user_name") String name,
			@RequestParam("user_email1")String email1,@RequestParam("user_email2")String email2,
			HttpServletRequest request,HttpServletResponse response,Model model) throws Exception	{
		System.out.println(id);System.out.println(name); 
		email=email1+"@"+email2;
		this.name=name;
		this.id=id;
		System.out.println(email);
		int result=ps.PwCheck(id, name);
		System.out.println(result);
		PrintWriter out=response.getWriter();
		if(result==0) {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		out.print("<script>alert('"+"정보가 일치하지 않습니다"+"');</script>");
		out.flush();
		return "member/pw_find";
		}
		else {		
		model.addAttribute("chk","success");
		return "member/pw_find";
		}
	}
	@RequestMapping("pw_popup")
	public String pw_popup(HttpServletRequest request,
			HttpServletResponse response,HttpSession session) throws Exception {		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String code=ms.rand();
		PrintWriter out=response.getWriter();
		
		String str="";
		str+="<html><body>";
		str+="<h1>비밀번호 인증 코드입니다</h1>";
		str+=code;
		str+="</body></html>";
		ms.sendMail(email, "비밀번호 인증 코드입니다", str);
		session.setAttribute("pw_find", code);
		System.out.println(code);
		return "member/pw_popup";
	}

	@PostMapping("pw_modify")
	public void pw_modify(@RequestParam("user_pw")String pw,HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		//PwDTO dto=new PwDTO();
		//dto.setUser_id(id);dto.setUser_pw(pw); 
		System.out.println(pw);System.out.println("id"+id);
		int result=ps.pw_modify(id,pw);
		System.out.println("result:"+result);
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		//String str=;
		out.print("<script>window.close();</script>");
		out.flush();
		//return "/main";
	}
}
