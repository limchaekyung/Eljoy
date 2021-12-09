package com.care.root.find.service;

import com.care.root.find.dto.IdDTO;

public interface IdService {
	public int id_name(String name);
	public IdDTO id_found(String name);
}
