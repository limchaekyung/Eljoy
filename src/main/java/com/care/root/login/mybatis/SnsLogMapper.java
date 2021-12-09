package com.care.root.login.mybatis;

import com.care.root.login.dto.SnsLogDTO;

public interface SnsLogMapper {
	public SnsLogDTO snsIdCheck(String id);
	public int sns_register(SnsLogDTO dto);
}
