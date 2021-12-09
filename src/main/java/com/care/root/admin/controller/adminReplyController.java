package com.care.root.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.care.root.admin.product.dto.boardQnaRepDTO;
import com.care.root.admin.product.service.productService;
import com.care.root.board.dto.EnquiryDTO;

@RestController
public class adminReplyController {

	@Autowired
	productService ps;
	
	@PostMapping(value="board/addReply", produces="application/json; charset=utf-8")
	public String addReply(@RequestBody Map<String, Object> map,//사용자가 넘겨준 값의 map으로 들어옴 contentView에서 key,value값으로 넘겨줌
							HttpSession session) {//해당하는 id값을 지정하기 위해서 session 사용, 현재 로그인한 사용자
		boardQnaRepDTO dto = new boardQnaRepDTO();// 답글 dto에 ajax에서 가져온 값(map에 들어잇음) 저장한다
		EnquiryDTO edto = new EnquiryDTO();
		//dto.setId((String)session.getAttribute(LOGIN));// 현재 로그인한 유저의 id가 저장된 session
		dto.setEnquiryReplyNo(Integer.parseInt((String)map.get("enquiryReplyNo")));//원글에 대한 값과 같아야 한다(원글이 지워지면 답글도 지워지도록),
		//     int형           int형으로 형변환      Object형 :   Object형을 int형으로 형변환, 이유는 dto가 int형이라
		int replyno = Integer.parseInt((String)map.get("enquiryReplyNo"));
		dto.seteReplyContent((String)map.get("eReplyContent"));
		dto.seteReplyCheck(1);
//		edto.setEnquiry_no(Integer.parseInt((String)map.get("enquiryReplyNo")));
//		edto.setEnquiry_state("1");
		
		ps.addReply(dto);
		ps.replyState(edto,replyno);
		return "{\"result\":\"success\"}";//json이 문자열 형태로 돌아가니까 success에서 result를 표현하면 success 이 메시지가 뜸, 우리프로젝트에서는 표현 안했음
		
	}

}
