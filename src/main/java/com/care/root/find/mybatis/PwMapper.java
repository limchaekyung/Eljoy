package com.care.root.find.mybatis;

import com.care.root.find.dto.PwDTO;

public interface PwMapper {
	public PwDTO PwCheck(String id);
	public int pw_modify(PwDTO dto);
}
