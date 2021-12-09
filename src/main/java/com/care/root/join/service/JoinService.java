package com.care.root.join.service;

import com.care.root.join.dto.JoinDTO;

public interface JoinService {
	public int join(JoinDTO dto);
	public int id_check(String id);
	public int email_check(String email);
	public int phone_check(String phone);

}
