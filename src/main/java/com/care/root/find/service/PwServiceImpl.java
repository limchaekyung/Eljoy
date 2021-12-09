package com.care.root.find.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.care.root.find.dto.PwDTO;
import com.care.root.find.mybatis.PwMapper;

@Service
public class PwServiceImpl implements PwService{
	@Autowired
	PwMapper pm;
	@Override
	public int PwCheck(String id, String name) {
		PwDTO dto= pm.PwCheck(id);
		if(dto==null)
		return 0;
		else {
			if(dto.getUser_name().equals(name))
				return 1;
			else
				return 0;
		}
	}
	@Override
	public int pw_modify(String id, String pw) {
		BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();
		int result=0;
		try {
		PwDTO dto=new PwDTO();
		String securPw=encoder.encode(pw);
		dto.setUser_id(id); dto.setUser_pw(securPw);
		result=pm.pw_modify(dto);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
