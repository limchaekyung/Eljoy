package com.care.root.board.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.root.board.dto.FaqDTO;

public interface BoardService {
	
	//자주하는 질문 전체 목록
	public void faq(Model model);
	//자주하는 질문 그룹별 목록
	public ArrayList<FaqDTO> faqList(Model model, int faq_group);
	
	//공지사항 전체 목록
	public void notice(Model model, int num);
	//공지사항 클릭 시 상세보기
	public void selectNotice(Model model, int notice_no);
	//공지사항 검색
	public void searchNotice(Model model, String search_option, String keyword);
	
	//Q&A 전체 목록
	public void qna(Model model, int num);
	//Q&A 글 저장
	public void qnaSave(MultipartHttpServletRequest mul, HttpServletRequest request);
	//Q&A 제목 클릭 시 상세보기
	public void selectQna(Model model, int enquiry_no);
	//Q&A 검색
	public void searchQna(Model model, String search_option, String keyword);
	//Q&A 수정 내용 저장
	public void modifySave(Model model, int enquiry_no, MultipartHttpServletRequest mul);
	//Q&A 삭제
	public void deleteQna(int enquiry_no);
}
