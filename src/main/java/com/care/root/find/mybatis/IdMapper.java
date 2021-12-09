package com.care.root.find.mybatis;

import com.care.root.find.dto.IdDTO;

public interface IdMapper {
	public IdDTO id_name(String name);
	public IdDTO id_found(String name);
}
