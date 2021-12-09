package com.care.root.mypage.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.root.common.session.MemberSessionName;
import com.care.root.mypage.dto.CartDTO;
import com.care.root.mypage.dto.ReviewDTO;
import com.care.root.mypage.mybatis.MypageMapper;

@Service
public class MypageServiceImpl implements MypageService {
	@Autowired MypageMapper mapper;
	
	//장바구니 전체 목록
	@Override
	public void myCart(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute(MemberSessionName.LOGIN);
		
		model.addAttribute("cartList", mapper.myCart(member_id));
	}
	//장바구니 내역 삭제
	@Override
	public void deleteCart(int cart_no, String cart_photo, HttpServletRequest request) {
		MypageFileService mfs = new MypageFileServiceImpl();
		
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute(MemberSessionName.LOGIN);
		
		int result = mapper.deleteCart(cart_no, member_id); //성공 시 1 반환
		
		if(result == 1) {
			mfs.deleteImage(cart_photo);
		}
	}
	//장바구니 목록 수
	@Override
	public void cartCnt(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute(MemberSessionName.LOGIN);
		
		model.addAttribute("cartCnt", mapper.cartCnt(member_id));
	}
	
	//주문 내역 전체 목록
	@Override
	public void myRental(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute(MemberSessionName.LOGIN);
		
		model.addAttribute("rentalList", mapper.myRental(member_id)); 
		
	}
	//내 리뷰 전체 목록
	@Override
	public void myReview(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String review_id = (String)session.getAttribute(MemberSessionName.LOGIN);
		
		model.addAttribute("reviewList", mapper.myReview(review_id));
	}
	//내 리뷰 저장
	@Override
	public void reviewSave(MultipartHttpServletRequest mul, HttpServletRequest request) {
		ReviewDTO dto = new ReviewDTO();
		dto.setReview_content(mul.getParameter("review_content"));
		dto.setReview_score(Integer.parseInt(mul.getParameter("review_score")));
		
		HttpSession session = request.getSession();
		dto.setReview_id((String)session.getAttribute(MemberSessionName.LOGIN));
		//dto.setReview_id("bbb1234");
		
		dto.setProduct_name(mul.getParameter("product_name"));
		
		MypageFileService mfs = new MypageFileServiceImpl();
		
		MultipartFile file1 = mul.getFile("review_file1"); 
		MultipartFile file2 = mul.getFile("review_file2"); 
		MultipartFile file3 = mul.getFile("review_file3"); 
		if(file1.getSize() != 0) {
			dto.setReview_file1(mfs.saveFile(file1));				
		} else {
			dto.setReview_file1("nan");
		}
		if(file2.getSize() != 0) {
			dto.setReview_file2(mfs.saveFile(file2));				
		} else {
			dto.setReview_file2("nan");
		}
		if(file3.getSize() != 0) {
			dto.setReview_file3(mfs.saveFile(file3));				
		} else {
			dto.setReview_file3("nan");
		}	
		
		mapper.reviewSave(dto);
	}
	//내 리뷰 클릭 시 상세보기
	@Override
	public void selectReview(Model model, int review_no) {
		model.addAttribute("selectReview", mapper.selectReview(review_no));
	}
	//내 리뷰 수정
	@Override
	public void modifyReviewSave(Model model, int review_no, MultipartHttpServletRequest mul) {
		ReviewDTO dto = new ReviewDTO();
		dto.setReview_no(Integer.parseInt(mul.getParameter("review_no")));
		dto.setReview_content(mul.getParameter("review_content"));
		//dto.setReview_score(Integer.parseInt(mul.getParameter("review_score")));
		//dto.setReview_id(mul.getParameter("review_id"));
		
		MypageFileService mfs = new MypageFileServiceImpl();
		
		MultipartFile file1 = mul.getFile("review_file1"); 
		MultipartFile file2 = mul.getFile("review_file2"); 
		MultipartFile file3 = mul.getFile("review_file3"); 
		if(file1.getSize() != 0) {
			dto.setReview_file1(mfs.saveFile(file1));
			mfs.deleteImage(mul.getParameter("org_file_name1"));
		} else {
			dto.setReview_file1("nan");
		}
		if(file2.getSize() != 0) {
			dto.setReview_file2(mfs.saveFile(file2));
			mfs.deleteImage(mul.getParameter("org_file_name2"));
		} else {
			dto.setReview_file2("nan");
		}
		if(file3.getSize() != 0) {
			dto.setReview_file3(mfs.saveFile(file3));	
			mfs.deleteImage(mul.getParameter("org_file_name3"));
		} else {
			dto.setReview_file3("nan");
		}
		mapper.modifyReviewSave(dto);
	}
	@Override
	public void deleteReview(int review_no, String review_file1, String review_file2, String review_file3) {
		MypageFileService mfs = new MypageFileServiceImpl();
		
		int result = mapper.deleteReview(review_no);
		if(result == 1) {
			mfs.deleteImage(review_file1);
			mfs.deleteImage(review_file2);
			mfs.deleteImage(review_file3);
		}
	}
	//내 질문 전체 목록
	@Override
	public void myEnquiry(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute(MemberSessionName.LOGIN);
		
		model.addAttribute("qnaList", mapper.myEnquiry(member_id));
		
	}
	
	
	
}
