package com.care.root.login.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.care.root.login.dto.LoginDTO;
import com.care.root.login.mybatis.LoginMapper;

@Service
public class LoginServiceImpl implements LoginService{
	@Autowired
	LoginMapper log; 
	
	@Override
	public int login(String id, String pw) {
		BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();

		LoginDTO dto= log.login(id);
		if(dto==null)
			return 0;
		else if(encoder.matches(pw, dto.getPw())) {
						
			return 1;}
		//System.out.println("DBpw:"+DBpw);
		//System.out.println("pw:"+pw);
		//if(pw.equals(DBpw))			
		else
			return 0;
	}

}
