package com.care.root.mypage.mybatis;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.care.root.board.dto.EnquiryDTO;
import com.care.root.mypage.dto.CartDTO;
import com.care.root.mypage.dto.ReviewDTO;
import com.care.root.payment.dto.paymentDTO;

public interface MypageMapper {
	//장바구니 목록
	public ArrayList<CartDTO> myCart(String member_id);
	//장바구니 내역 삭제
	public int deleteCart(int cart_no, String member_id);
	//장바구니 목록 수
	public int cartCnt(String member_id);
	
	//주문 내역 전체 목록
	public ArrayList<paymentDTO> myRental(String member_id);
	//주문 내역 전체 목록 수 
	public int myrentalCount();
	
	//내 리뷰 전체 목록
	public ArrayList<ReviewDTO> myReview(String review_id);
	//내 리뷰 저장
	public void reviewSave(ReviewDTO dto);	
	//내 리뷰 클릭 시 상세보기
	public ReviewDTO selectReview(int review_no);
	//내 리뷰 수정
	public void modifyReviewSave(ReviewDTO dto);
	//내 리뷰 삭제
	public int deleteReview(int review_no);
	//내 질문 전체 목록
	public ArrayList<EnquiryDTO> myEnquiry(String member_id);

}
