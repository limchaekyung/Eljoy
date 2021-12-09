package com.care.root.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.care.root.board.dto.FaqDTO;

import com.care.root.admin.product.dto.boardQnaRepDTO;

import com.care.root.board.service.BoardServiceImpl;

@Controller
@RequestMapping("board")
public class BoardController {
	private static final String HttpServletRequest = null;
	@Autowired BoardServiceImpl bs;
	
	//자주하는 질문 전체 목록
	@RequestMapping("faq")
	public String faq(Model model) {
		bs.faq(model);
		return "board/faq";
	}
	//자주하는 질문 그룹별 불러오기
	@PostMapping(value="allFaq/{faq_group}", produces="application/json; charset=utf-8") 
	public @ResponseBody ArrayList<FaqDTO> allFaq(Model model, @PathVariable int faq_group) {
		return bs.faqList(model, faq_group);
	}
	
	//공지사항 전체 목록
	@RequestMapping("notice")
	public String notice(Model model, @RequestParam(value="num", required=false, defaultValue="1") int num) {
		bs.notice(model, num);
		return "board/notice";
	}
	//공지사항 클릭 시 상세보기
	@RequestMapping("selectNotice")
	public String selectNotice(Model model, @RequestParam int notice_no) {
		bs.selectNotice(model, notice_no);
		return "board/selectNotice";
	}
	//공지사항 검색
	@PostMapping("searchNotice")
	public String searchNotice(Model model, @RequestParam(defaultValue="all") String search_option, @RequestParam(defaultValue="") String keyword) {
		bs.searchNotice(model, search_option, keyword);
		model.addAttribute("search_option", search_option);
		model.addAttribute("keyword", keyword);
		return "board/searchNotice";
	}
	//Q&A 전체 목록
	@RequestMapping("qna")
	public String qna(Model model, @RequestParam(value="num", required=false, defaultValue="1") int num) {
		bs.qna(model, num);
		
		return "board/qna";
	}
	//Q&A 글작성
	@RequestMapping("qnaForm")
	public String qnaForm() {
		return "board/qnaForm";
	}
	//Q&A 글 저장
	@PostMapping("qnaSave")
	public String qnaSave(MultipartHttpServletRequest mul, HttpServletRequest request) {
		bs.qnaSave(mul, request);
		return "redirect:/board/qna";
	}
	//Q&A 제목 클릭 시 상세보기
	@RequestMapping("selectQna")
	public String selectQna(Model model, @RequestParam int enquiry_no, RedirectAttributes ra) {
		bs.selectQna(model, enquiry_no);

		ra.addFlashAttribute("model", model);
		
		bs.getRepList(enquiry_no, model);
		
		

		return "board/selectQna";
	}
	//Q&A 검색
	@PostMapping("searchQna")
	public String searchQna(Model model, @RequestParam(defaultValue="member_id") String search_option, @RequestParam(defaultValue="") String keyword) {
		bs.searchQna(model, search_option, keyword);
		model.addAttribute("search_option", search_option);
		model.addAttribute("keyword", keyword);
		return "board/searchQna";
	}
	//Q&A 수정
	@RequestMapping("modifyForm")
	public String modifyForm(Model model, @RequestParam int enquiry_no) {
		bs.selectQna(model, enquiry_no);
		return "board/modifyForm";
	}
	//Q&A 수정 내용 저장
	@PostMapping("modifySave")
	public String modifySave(Model model, @RequestParam int enquiry_no, MultipartHttpServletRequest mul) {
		bs.modifySave(model, enquiry_no, mul);
		return "redirect:/board/qna";
	}
	//Q&A 삭제
	@RequestMapping("deleteQna")
	public String deleteQna(@RequestParam int enquiry_no) {
		bs.deleteQna(enquiry_no);
		return "redirect:/board/qna";
	}
	
}
