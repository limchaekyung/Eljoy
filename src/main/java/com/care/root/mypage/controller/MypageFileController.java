package com.care.root.mypage.controller;

import java.io.File;
import java.io.FileInputStream;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.root.mypage.service.MypageFileService;

@RequestMapping("file")
@Controller
public class MypageFileController {
	@Autowired MypageFileService fs;
	
	
	/*
	@GetMapping("download")
	public void download(@RequestParam("file") String fileName,
						HttpServletResponse response) throws Exception {
		//Content-disposition : 파일 다운로드할 때 http 헤더에 추가해야함, 명시해줘야 다운로드 가능
		//attachment : 파일을 다운로드하여 브라우저로 표현하는 의미
		response.addHeader("Content-disposition", "attachment; fileName=" + fileName); //어떤 파일을 보낼지
		//IMAGE_REPO : 이미지 저장 경로의 값을 불러오는 코드
		File file = new File(MypageFileService.IMAGE_REPO + "\\" + fileName);
		//저장되어 있는 이미지를 inputStream 으로 불러옴, 해당 파일을 읽어옴
		FileInputStream in = new FileInputStream(file); 
		//in : 왼쪽의 값(이미지 불러온 값)을, out : 오른쪽(response(응답).output 하겠다)
		FileCopyUtils.copy(in, response.getOutputStream()); //읽어온 파일을 응답
		in.close();
	}*/
}
