package com.care.root.board.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.root.admin.product.dto.boardQnaRepDTO;
import com.care.root.adminProduct.mtbatis.productMapper;
import com.care.root.board.dto.EnquiryDTO;
import com.care.root.board.dto.FaqDTO;
import com.care.root.board.mybatis.BoardMapper;
import com.care.root.common.session.MemberSessionName;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired BoardMapper mapper;


	//자주하는 질문 전체 목록
	@Override
	public void faq(Model model) {
		
		model.addAttribute("allFaq",mapper.faq());
	}
	//자주하는 질문 그룹별 목록
	@Override
	public ArrayList<FaqDTO> faqList(Model model, int faq_group) {
		model.addAttribute("faqList",mapper.faqList(faq_group));
		return mapper.faqList(faq_group);
	}
	
	//공지사항 전체 목록

	@Autowired productMapper replyMapper; 

	@Override
	public void notice(Model model, int num) {
		int pageLetter = 10; //한페이지에 3개의 글
		int allCount = mapper.noticeCount(); 
		
		int repeat = allCount / pageLetter;
		if(allCount % pageLetter != 0) { 
			repeat += 1; //한페이지 추가 
		}
		int end = num * pageLetter;
		int start = end + 1 - pageLetter;
		model.addAttribute("repeat", repeat);  
		
		model.addAttribute("noticeList", mapper.notice(start, end));
	}
	//공지사항 클릭 시 상세보기
	@Override
	public void selectNotice(Model model, int notice_no) {
		upHitNotice(notice_no);
		System.out.println("selectNotice 서비스 글번호 : "+notice_no);
		model.addAttribute("selectNotice",mapper.selectNotice(notice_no));
	}
	//공지사항 클릭 시 조회수 증가
	public void upHitNotice(int notice_no) {
		mapper.upHitNotice(notice_no);
	}
	//공지사항 검색
	@Override
	public void searchNotice(Model model, String search_option, String keyword) {
		Map<String, String> map = new HashMap<String, String>();

		map.put("search_option", search_option);
		map.put("keyword", keyword);

		model.addAttribute("searchNotice", mapper.searchNotice(map));
	}
	
	//Q&A 전체 목록
	@Override
	public void qna(Model model, int num) {
		int pageLetter = 10; //한페이지에 3개의 글
		int allCount = mapper.qnaCount(); 
		
		int repeat = allCount / pageLetter;
		if(allCount % pageLetter != 0) { 
			repeat += 1; //한페이지 추가 
		}
		int end = num * pageLetter;
		int start = end + 1 - pageLetter;
		model.addAttribute("repeat", repeat);  
		
		model.addAttribute("qnaList", mapper.qna(start, end));	
	}
	//Q&A 글 저장
	@Override
	public void qnaSave(MultipartHttpServletRequest mul, HttpServletRequest request) {
		EnquiryDTO dto = new EnquiryDTO();
		
		HttpSession session = request.getSession();
		dto.setMember_id((String)session.getAttribute(MemberSessionName.LOGIN));
		
		dto.setEnquiry_subject(mul.getParameter("enquiry_subject"));
		dto.setEnquiry_content(mul.getParameter("enquiry_content"));
		dto.setEnquiry_state("답변중");

		mapper.qnaSave(dto);
	}
	//조회수 증가
	public void upHit(int num) {
		mapper.upHit(num);
	}
	//Q&A 제목 클릭 시 상세보기
	@Override
	public void selectQna(Model model, int enquiry_no) {
		model.addAttribute("selectQna", mapper.selectQna(enquiry_no));
		
	}
	//Q&A 검색
	@Override
	public void searchQna(Model model, String search_option, String keyword) {
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		
		model.addAttribute("searchQna", mapper.searchQna(map));
	}
	//Q&A 수정 내용 저장
	@Override
	public void modifySave(Model model, int enquiry_no, MultipartHttpServletRequest mul) {
		EnquiryDTO dto = new EnquiryDTO();
		
		dto.setEnquiry_no(Integer.parseInt(mul.getParameter("enquiry_no")));
		dto.setMember_id("A");
		dto.setEnquiry_subject(mul.getParameter("enquiry_subject"));
		dto.setEnquiry_content(mul.getParameter("enquiry_content"));
		dto.setEnquiry_state("답변완료");
		//System.out.println(mul.getParameter("enquiry_subject"));

		mapper.modifySave(dto);
	}
	//Q&A 삭제
	@Override
	public void deleteQna(int enquiry_no) {
		mapper.deleteQna(enquiry_no);
	}
	//답글내용 보기
	public void getRepList(int enquiry_no, Model model) {
		boardQnaRepDTO dto = new boardQnaRepDTO();
		
		model.addAttribute("RepList",replyMapper.getRepList(enquiry_no));
		
	}
	
	
	
	
}
