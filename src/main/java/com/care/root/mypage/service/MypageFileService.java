package com.care.root.mypage.service;

import org.springframework.web.multipart.MultipartFile;

import com.care.root.board.dto.MessageDTO;

public interface MypageFileService {
	public static final String IMAGE_REPO = "c:\\spring\\final_project"; //이미지가 저장될 폴더
	
	//파일 업로드
	public String saveFile(MultipartFile file);
	//alert 메시지 설정
	public String getMessage(MessageDTO dto);
	//파일 삭제
	public void deleteImage(String originalFileName);
}
