package com.care.root.common.Interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.care.root.common.session.MemberSessionName;

//세션이 없어야 하는 class
public class Interceptor2 extends HandlerInterceptorAdapter implements MemberSessionName{
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("interceptor2");
		if(request.getSession().getAttribute(LOGIN)!=null) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out=response.getWriter();
			out.print("<script>"+
			"alert('로그아웃 후에 이용해주세요'); history.back();"+
			"</script>");
			return false;
		}
		else {
			System.out.println("else");
			return true;
		}
	}
}
