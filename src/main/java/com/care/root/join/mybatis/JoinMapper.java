package com.care.root.join.mybatis;

import com.care.root.join.dto.JoinDTO;

public interface JoinMapper {
	public JoinDTO id_check(String id);
	public JoinDTO email_check(String email);
	public JoinDTO phone_check(String phone);
	public int join(JoinDTO dto);
}
