package com.care.root.mypage.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.care.root.board.dto.MessageDTO;
@Service
public class MypageFileServiceImpl implements MypageFileService {

	//파일 업로드
	@Override
	public String saveFile(MultipartFile file) {
		SimpleDateFormat s = new SimpleDateFormat("yyyyMMddHHmmss-");
		Calendar calendar = Calendar.getInstance();
		String sysFileName = s.format(calendar.getTime()) + file.getOriginalFilename();
		File saveFile = new File(IMAGE_REPO + "/" + sysFileName); 
		try {
			file.transferTo(saveFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sysFileName;
	}
	//alert 메시지 설정
	@Override
	public String getMessage(MessageDTO dto) {
		String message = null;
		String path = dto.getRequest().getContextPath(); //절대 경로
		if(dto.getResult() == 1) { //성공
			//message = "<script>alert('" + dto.getSuccessMessage() + "');";
			message += "location.href='" + path + dto.getSuccessURL() + "';</script>";
		} else { //실패
			message = "<script>alert('" + dto.getFailMessage() + "');";
			message += "location.href='" + path + dto.getFailURL() + "';</script>";
		}
		return message;
	}
	//파일 삭제
	@Override
	public void deleteImage(String originalFileName) {
		File deleteFile = new File(IMAGE_REPO + "/" + originalFileName);
		deleteFile.delete();
	}
	


}
