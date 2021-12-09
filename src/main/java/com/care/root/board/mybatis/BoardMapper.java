package com.care.root.board.mybatis;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.care.root.board.dto.EnquiryDTO;
import com.care.root.board.dto.FaqDTO;
import com.care.root.board.dto.NoticeDTO;

public interface BoardMapper {
	
	//자주하는 질문 전체 목록
	public ArrayList<FaqDTO> faq();
	//자주하는 질문 그룹별 목록
	public ArrayList<FaqDTO> faqList(int faq_group);
	
	//공지사항 전체 목록
	public ArrayList<NoticeDTO> notice(@Param("s") int start, @Param("e") int end);
	//공지사항 전체 목록 수 카운트
	public int noticeCount();
	//공지사항 클릭 시 상세보기
	public NoticeDTO selectNotice(int notice_no);
	//공지사항 조회 수 증가
	public void upHitNotice(int notice_no);
	//Q&A 검색
	public ArrayList<NoticeDTO> searchNotice(Map<String, String> map);
	
	//Q&A 전체 목록
	public ArrayList<EnquiryDTO> qna(@Param("s") int start, @Param("e") int end);
	//Q&A 전체 목록 수 카운트
	public int qnaCount();
	//Q&A 글 저장
	public void qnaSave(EnquiryDTO dto);
	//조회 수 증가
	public void upHit(int num);
	//Q&A 제목 클릭 시 상세보기
	public EnquiryDTO selectQna(int enquiry_no);
	//Q&A 검색
	public ArrayList<EnquiryDTO> searchQna(Map<String, String> map);
	//Q&A 수정 내용 저장
	public void modifySave(EnquiryDTO dto);
	//Q&A 삭제
	public void deleteQna(int enquiry_no);
	
}
