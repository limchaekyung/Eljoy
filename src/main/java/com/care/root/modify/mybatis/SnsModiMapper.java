package com.care.root.modify.mybatis;

import com.care.root.modify.dto.SnsDTO;

public interface SnsModiMapper {
	public SnsDTO snsInfo(String id);
	public SnsDTO email_check(String email);
	public SnsDTO phone_check(String phone);
	public void sns_modify(SnsDTO dto);
}
