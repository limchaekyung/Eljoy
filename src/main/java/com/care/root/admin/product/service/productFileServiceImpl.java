package com.care.root.admin.product.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.care.root.admin.product.dto.MessageDTO;

//상품등록 이미지 서비스임플
public class productFileServiceImpl implements productFileService{

	@Override
	public String getMessage(int num, HttpServletRequest request) {
		String message = null;
		if(num == 1) {
			message = "<script>alert('상품이 추가되었습니다');";
			message += "location.href='"+request.getContextPath()+
						"/adminProduct/adminProductList';</script>";
		}else {
			message = "<script>alert('문제가 발생하였습니다');";
			message += "location.href='"+request.getContextPath()+
						"/adminProduct/adminProductInput';</script>";
		}
		return message;
	}

//	@Override
//	public String saveFile(MultipartFile file) {
//		SimpleDateFormat simp = new SimpleDateFormat("yyyyMMddHHmmss-");
//		Calendar calendar = Calendar.getInstance();
//		String sysFileNAme = 
//				simp.format(calendar.getTime())+file.getOriginalFilename();
//		File saveFile = new File(IMAGE_REPO+"/"+sysFileNAme);
//		try {
//			file.transferTo(saveFile);
//		} catch (Exception e) {
//			
//		}
//		
//		return sysFileNAme;
//	}

//	public void deleteImage(String originFileName) {
//		File deleteFile = new File(IMAGE_REPO+"/"+originFileName);
//		deleteFile.delete(); // 해당하는 파일(originFileName) 삭제
//		System.out.println("썸네일 이름 : " + originFileName);
//		
//	}

	public String getMessage(MessageDTO dto) {
		String message = null;
		String path = dto.getRequest().getContextPath(); //절대경로 만들기
		if(dto.getResult() == 1) { // 성공하면 1
			message = "<script>alert('"+dto.getSuccessMessage()+"');";
			message += "location.href='"+path+dto.getSuccessURL()+"';</script>";
		}else {
			message = "<script>alert('"+dto.getFailMessage()+"');";
			message += "location.href='"+path+dto.getFailURL()+"';</script>";
		}
		return message;
		
	}

	@Override
	public String faqGetMessage(int faqSave, HttpServletRequest request) {
		String message = null;
		if(faqSave == 1) {
			message = "<script>alert('글이 등록되었습니다');";
			message += "location.href='"+request.getContextPath()+
						"/board/faq';</script>";
		}else {
			message = "<script>alert('문제가 발생하였습니다');";
			message += "location.href='"+request.getContextPath()+
						"/boardInput/faqForm';</script>";
		}
		return message;
		
	}

	@Override
	public String faqModifyGetMessage(MessageDTO dto) {
		String message = null;
		String path = dto.getRequest().getContextPath();
		if(dto.getResult() == 1) {
			message = "<script>alert('"+dto.getSuccessMessage()+"');";
			message += "location.href='"+path+dto.getSuccessURL()+"';</script>";
		}else {
			message = "<script>alert('"+dto.getFailMessage()+"');";
			message += "location.href='"+path+dto.getFailURL()+"';</script>";
		}
		return message;
	}

	@Override
	public String paymentGetMessage(int pamentSave, HttpServletRequest request) {
		String message = null;
		if(pamentSave == 1) {
			message = "<script>alert('구매완료');";
			message += "location.href='"+request.getContextPath()+
						"/mypage/myRental';</script>";
		}else {
			message = "<script>alert('문제가 발생하였습니다');";
			message += "location.href='"+request.getContextPath()+
						"/Product/ProductView';</script>";
		}
		return message;
	}
	
	

	
	

}


































