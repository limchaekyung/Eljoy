package com.care.root.join.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.care.root.join.dto.JoinDTO;
import com.care.root.join.mybatis.JoinMapper;

@Service
public class JoinServiceImpl implements JoinService{
	@Autowired
	JoinMapper mapper;
	@Override
	public int id_check(String id) {
		JoinDTO dto=mapper.id_check(id);
		if(dto==null) {
		return 1;
		}else
			return 0;
	}
	@Override
	public int email_check(String email) {
		JoinDTO dto=mapper.email_check(email);
		if(dto==null)
		return 1;
		else
			return 0;
	}
	@Override
	public int phone_check(String phone) {
		JoinDTO dto=mapper.phone_check(phone);
		if(dto==null)
			return 1;
		else
			return 0;
	}
	@Override
	public int join(JoinDTO dto) {		
		BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();
		System.out.println("암호화 전:"+dto.getUser_pw());
		
		String securPw=encoder.encode(dto.getUser_pw());
		System.out.println("암호화 결과:"+securPw);
		
		dto.setUser_pw(securPw);
		mapper.join(dto);
		return 0;
	}
	
}
