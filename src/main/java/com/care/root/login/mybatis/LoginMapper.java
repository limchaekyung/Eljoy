package com.care.root.login.mybatis;

import java.util.Map;

import com.care.root.login.dto.LoginDTO;

public interface LoginMapper {
	public LoginDTO login(String id);
	public void keepLogin(Map<String, Object> dates);
	public LoginDTO getUserSessionId(String sessionId);
}
