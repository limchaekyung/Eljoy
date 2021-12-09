package com.care.root.admin.product.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.root.admin.product.dto.boardQnaRepDTO;
import com.care.root.admin.product.dto.productDTO;
import com.care.root.admin.product.dto.productImageDTO;
import com.care.root.board.dto.EnquiryDTO;
import com.care.root.board.dto.FaqDTO;
import com.care.root.board.dto.NoticeDTO;

//상품등록 서비스인터페이스
public interface productService {
	public void adminProductList(Model model,int num);
	public String productSave(MultipartHttpServletRequest mul,HttpServletRequest request);
	public void adminProductView(String productNum,Model model);
	//public String productModify(MultipartHttpServletRequest mul, HttpServletRequest request);
	//public String productDelete(String productNum, String productThumbnail,HttpServletRequest request);
	public productImageDTO insertImage(MultipartFile uploadFile, String savePath);
	public int insertProduct(Map<String, Object> map, List<MultipartFile> images, String savePath);
	public void selectImg(String productNum,Model model);
	public int updateProduct(productDTO updateProductDTO, MultipartFile images, String savePath);
	public void delete(List<String> num);
	public List<String> selectDBFileList();
	public void noticeSave(NoticeDTO dto, HttpServletRequest request);
	public void contentView(int notice_no, Model model);
	public void addReply(boardQnaRepDTO dto);
	public String noticeModify(HttpServletRequest request,int notice_no);
	public String noticeDelete(int notice_no, HttpServletRequest request);
	public void replyModify(int enquiryReplyNo, String eReplyContent);
	public void replyState(EnquiryDTO edto,int replyno);
	public void adminProductSearch(Model model, String productSearch_option, String keyword);
	public String faqSave(HttpServletRequest request, FaqDTO dto);
	public String faqDelete(HttpServletRequest request, int faq_no);
	public String faqModify(HttpServletRequest request, int faq_no);
	public void faqModifyView(int faq_no, Model model);
	
	
	
	
	
	
	
	
	
	
	
	
	
}
