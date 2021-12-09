package com.care.root.admin.product.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.care.root.admin.product.dto.MessageDTO;

//상품등록 이미지 서비스인터페이스
public interface productFileService {
	public static final String IMAGE_REPO = "D:/image_repo";
	public String getMessage(int num, HttpServletRequest request);
	//public String saveFile(MultipartFile file);
	public String getMessage(MessageDTO DTO);
	//public void deleteImage(String productThumbnail);
	public String faqGetMessage(int faqSave, HttpServletRequest request);
	public String paymentGetMessage(int pamentSave, HttpServletRequest request);
	public String faqModifyGetMessage(MessageDTO mDTO);
}
