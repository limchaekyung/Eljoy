package com.care.root.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.care.root.login.dto.SnsLogDTO;
import com.care.root.login.mybatis.SnsLogMapper;

@Service
public class SnsLogServiceImpl implements SnsLogService{
	@Autowired
	SnsLogMapper slm;
	@Override
	public int check(String id) {
		SnsLogDTO dto=slm.snsIdCheck(id);
		if(dto==null)
			return 1;
		else 
			return 0;
	}
	@Override
	public int register(SnsLogDTO dto) {
		slm.sns_register(dto);
		return 0;
	}
	
}
