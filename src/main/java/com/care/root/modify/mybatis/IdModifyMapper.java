package com.care.root.modify.mybatis;

import com.care.root.modify.dto.IdDTO;

public interface IdModifyMapper {
	public IdDTO modify(String id);
	public IdDTO Id_email(String email);
	public IdDTO Id_phone(String phone);
	public void id_modify(IdDTO dto);
}
