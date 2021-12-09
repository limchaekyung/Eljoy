package com.care.root.login.service;

import java.sql.Date;

import com.care.root.login.dto.LoginDTO;

public interface LoginService {
	public int login(String id,String pw);
}
