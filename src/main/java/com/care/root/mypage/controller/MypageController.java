package com.care.root.mypage.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.root.board.dto.MessageDTO;
import com.care.root.common.session.MemberSessionName;
import com.care.root.mypage.dto.CartDTO;
import com.care.root.mypage.service.MypageFileService;
import com.care.root.mypage.service.MypageFileServiceImpl;
import com.care.root.mypage.service.MypageService;

@Controller
@RequestMapping("mypage")
public class MypageController {
	@Autowired MypageService ms;
	
	//장바구니 전체 목록
	@RequestMapping("myCart")
	public String myCart(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ms.myCart(model, request);
		return "mypage/myCart";			
	}
	/*
	@RequestMapping(value="/totalPay", method=RequestMethod.POST, produces="application/json; charset=utf-8") 
	@ResponseBody
	public int totalpay(@RequestParam(value = "checkArr[]") List<String> chArr) {
		System.out.println("연결");
		int sum=0;
		
		for(String s : chArr) {
			sum += Integer.parseInt(s);
		}
		return sum;
	}*/
	//장바구니 내역 삭제
	@RequestMapping(value="/deleteCart", method=RequestMethod.POST)
	@ResponseBody
	public void deleteCart(@RequestParam int cart_no, @RequestParam String cart_photo, HttpServletRequest request) {
		//@RequestParam(value = "chbox[]") List<String> chArr, CartDTO cart
		ms.deleteCart(cart_no, cart_photo, request);
	}
	//주문 내역 전체 목록
	@RequestMapping("myRental")
	public String myRental(Model model, HttpServletRequest request) {
		ms.myRental(model, request);
		return "mypage/myRental";			
	}
	
	//내 리뷰
	@RequestMapping("myReview")
	public String myReview(Model model, HttpServletRequest request) {
		ms.myReview(model, request);
		return "mypage/myReview";			

	}
	//리뷰 작성 페이지
	@RequestMapping("reviewForm")
	public String reviewForm(Model model, @RequestParam String product_name) {
		//작성하기 @RequestParam String payment_title, @RequestParam String cart_photo
		model.addAttribute("model", product_name);
		return "mypage/reviewForm";
	}
	//리뷰 별점 값 가져오기
	@PostMapping(value="star_rating/{review_score}", produces="application/json; charset=utf-8")
	public @ResponseBody String star_rating01(@PathVariable String review_score) {
		//ms.reviewSave(review_score);
		return review_score;
	}
	//내 리뷰 저장
	@PostMapping("reviewSave")
	public String reviewSave(MultipartHttpServletRequest mul, HttpServletRequest request) {
		ms.reviewSave(mul, request);
		
		return "redirect:/mypage/myReview";
	}
	//내 리뷰 클릭 시 상세보기
	@RequestMapping("selectReview")
	public String selectReview(Model model, @RequestParam int review_no) {
		ms.selectReview(model, review_no);
		return "mypage/selectReview";
	}
	//내 리뷰 수정
	@RequestMapping("modifyReviewForm")
	public String modifyReviewForm(Model model, @RequestParam int review_no) {
		ms.selectReview(model, review_no);
		return "mypage/modifyReviewForm";
	}
	//내 리뷰 수정
	@PostMapping("modifyReviewSave")
	public String modifyReviewSave(Model model, @RequestParam int review_no, MultipartHttpServletRequest mul) {
		ms.modifyReviewSave(model, review_no, mul);
		return "redirect:/mypage/myReview";
	}
	//내 리뷰 삭제
	@RequestMapping("deleteReview")
	public String deleteReview(@RequestParam int review_no, @RequestParam String review_file1, @RequestParam String review_file2, @RequestParam String review_file3) {
		ms.deleteReview(review_no, review_file1, review_file2, review_file3);
		return "redirect:/mypage/myReview";
	}
	//내 질문 
	@RequestMapping("myEnquiry")
	public String myEnquiry(Model model, HttpServletRequest request) {
		ms.myEnquiry(model, request);
		return "mypage/myEnquiry";			
	}
	//이미지 불러오기
	@GetMapping("download")
	public void download(@RequestParam("file") String fileName, HttpServletResponse response) throws Exception {
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
	}
}
