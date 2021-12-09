package com.care.root.common.Interceptor;
//세션이 있어야하는 class
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.care.root.common.session.MemberSessionName;
import com.care.root.login.dto.LoginDTO;
import com.care.root.login.service.LoginService;

public class Interceptor1 extends HandlerInterceptorAdapter implements MemberSessionName{
	
	@Autowired LoginService ls;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		response.setContentType("text/html; charset=utf-8");
		//Cookie loginCookie=WebUtils.getCookie(request, "loginCookie");
		//if(loginCookie!=null){//자동로그인 존재
			//System.out.println(loginCookie);
			if(request.getSession().getAttribute(LOGIN)==null) {			
				PrintWriter out=response.getWriter();
				out.print("<script>"+
				"location.href='/root/member/login'"+
				"</script>");
				return false;
			}
			//LoginDTO dto=ls.getUserSessionId(loginCookie.getValue());
			else {
				if(request.getSession().getAttribute(LOGIN).equals("admin")) {
					PrintWriter out=response.getWriter();
					out.print("<script>"+
					"location.href='/root/adminProduct/adminProductList'"+
					"</script>");
					return true;
				}
				else {
					PrintWriter out=response.getWriter();
					out.print("<script>"+
					"location.href='/root/adminProduct/adminProductList'"+
					"</script>");
				}
				return true;
			}
			
		}
	
}
