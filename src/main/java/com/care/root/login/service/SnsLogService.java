package com.care.root.login.service;

import com.care.root.login.dto.SnsLogDTO;

public interface SnsLogService {
	public int check(String id);
	public int register(SnsLogDTO dto);
}
