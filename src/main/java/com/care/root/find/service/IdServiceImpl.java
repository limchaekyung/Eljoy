package com.care.root.find.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.care.root.find.dto.IdDTO;
import com.care.root.find.mybatis.IdMapper;

@Service
public class IdServiceImpl implements IdService{
	@Autowired
	IdMapper id;
	@Override
	public int id_name(String name) {
		IdDTO dto= id.id_name(name);
		if(dto==null)
			return 0;
		else 
			return 1;
	}
	@Override
	public IdDTO id_found(String name) {
		IdDTO dto=id.id_found(name);
		return dto;
	}
	
}
