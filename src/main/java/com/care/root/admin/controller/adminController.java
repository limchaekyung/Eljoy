package com.care.root.admin.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;


import com.care.root.admin.product.dto.productDTO;
import com.care.root.admin.product.dto.productImageDTO;
import com.care.root.admin.product.service.productFileService;
import com.care.root.admin.product.service.productService;
import com.care.root.board.dto.FaqDTO;
import com.care.root.board.dto.NoticeDTO;
import com.care.root.board.service.BoardService;
import com.care.root.board.service.BoardServiceImpl;

@Controller //관리자 컨트롤러
public class adminController {
	@Autowired 
	productService ps;
	@Autowired
	BoardServiceImpl bs;
	//관리자 상품 리스트
	@GetMapping("adminProduct/adminProductList")
	public String adminProductList(Model model,
			@RequestParam(value="num", required = false,defaultValue = "1")int num){
		ps.adminProductList(model, num);
		
		return "adminProduct/adminProductList";
	}
	
	// 상품 등록
	@RequestMapping("adminProduct/adminProductInput")
	public String adminProductInput() {
		return "adminProduct/adminProductInput";
	}
	
	
	//상품저장
	/*
	 * @PostMapping("adminProduct/productSave") public void
	 * productSave(MultipartHttpServletRequest mul,//<-서비스로 넘겨줌->서비스에서 값 꺼내와서
	 * mapper로 넘겨줌 ->db에 저장 HttpServletResponse response, HttpServletRequest
	 * request) throws Exception {
	 * 
	 * String message = ps.productSave(mul, request); PrintWriter out =
	 * response.getWriter(); response.setContentType("text/html; charset=utf-8");
	 * out.print(message); }
	 */
	
	// 게시글 등록 Controller
	@RequestMapping("adminProduct/productSave")
	public String insertAction(
		   @ModelAttribute productDTO product,
		   @RequestParam(value="images",required=false) List<MultipartFile> images,
		   HttpServletRequest request
		 ) {
	 //  @RequestParam(value="images",required=false) List<MultipartFile> images) {
	 //	  -> <input type="file" name="images"> 태그를 모두 얻어와 images 라는 List에 매핑
		
	
	/*	
		System.out.println("type : " + type);
		System.out.println(board);
		System.out.println(loginMember);
	 */	
		
		// map을 이용하여 필요한 데이터 모두 담기
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("productTitle",product.getProductTitle());
		map.put("productCategory",product.getProductCategory());
		map.put("productName",product.getProductName());
		map.put("productCompany",product.getProductCompany());
		map.put("productNum",product.getProductNum());
		map.put("productPee",product.getProductPee());
		map.put("productQuantity",product.getProductQuantity());
		map.put("productContent",product.getProductContent());
		map.put("productPeriod",product.getProductPeriod());
		
		
		// 파일 업로드 확인
		for(int i=0 ; i<images.size(); i++) {
			
			System.out.println("images [" + i + "] :" 
					+ images.get(i).getOriginalFilename());
		}
		
		// 파일이 업로드 되지 않은 부분도 출력되고 있음을 확인
		// == 모든 input type="file" 태그가 순서대로 넘어오고 있음을 확인
		// --> 넘어오는 순서를 file level로 사용가능.
		
		
		// 파일 저장 경로 설정
		// HttpServletRequest 객체가 있어야지만 파일 저장 경로를 얻어올 수 있음.
		// - > HttpServletRequest 객체는 Controller에서만  사용 가능.
		
		String savePath = null;
		
		
		savePath= request.getSession().getServletContext().getRealPath("resources/summernoteImg");

		System.out.println(savePath);
		
		
		int result =ps.insertProduct(map,images,savePath);

		
		String url = null;
		// 게시글 삽입 결과에 따른 View 연결 처리
		if(result > 0) {
			url = "redirect:adminProductList";
			
		}else{
			url = "redirect:insert";
		}
		return url;

	}
	
	
	
	
	
	
	
	
	
	
	//상품 내용 확인
	@RequestMapping("adminProduct/adminProductView")
	public String adminProductView(@RequestParam String productNum,Model model) {
		ps.adminProductView(productNum,model);
		ps.selectImg(productNum,model);//수정 페이지에서 썸네일 불러오기 
		//System.out.println("컨트롤 : "+productNum);
		
		    
		
			
			
		return "adminProduct/adminProductView";
	}
	@GetMapping("adminProduct/download")
	public void download(@RequestParam String productThumbnail,
						 HttpServletResponse  response) throws Exception {
		// addHeader : 사용자에게 전달할 값이 다운로드할 값인지 데이터를 보내줄껀지를 위해
		response.addHeader("Content-disposition", "attachment;imageFileName="+productThumbnail);
		// disposition : 해당 내용을 웹브라우저에 inline방식으로 데이터를 추가할지,
		// 해당하는 이미지("attachment;imageFileName="+imageFileName)를 보내줄껀지 결정
		
		File file = new File(productFileService.IMAGE_REPO+"/"+productThumbnail); // 업로드 할때 만든 경로. 해당 경로에서 파일을 가져오겠다
		FileInputStream in = new FileInputStream(file);// 해당하는 경로부터 파일을 읽어 오겠다
		FileCopyUtils.copy(in, response.getOutputStream()); // 읽어온값 response 에게 넘겨주기
		in.close();
		
	}

	
	
	//상품수정(업데이트)
/*	@PostMapping("adminProduct/adminProductModify")
	public void adminProductModify(MultipartHttpServletRequest mul,
									HttpServletResponse response, // 사용자에게 메시지 전달(성공,실패)
									HttpServletRequest request) throws Exception {
		String message = ps.productModify(mul,request);
		PrintWriter out = response.getWriter();
		response.setContentType("text/html; charset=utf-8");
		out.print(message);
	} */
	
	@ResponseBody
	@RequestMapping("adminProduct/delete")
	public void ajaxDelete(@RequestParam (value="valueArr" ,required=false) List<String> deleteProductNum) {
	
	   ps.delete(deleteProductNum);
		
	}
	
	
	// 게시글 수정 Controller
   @RequestMapping("adminProduct/adminProductModify")	 
    public String ShopUpdateAction(
   		 						@ModelAttribute productDTO updateProductDTO,
   		 						HttpServletRequest request,
   		 						@RequestParam(value="images" ,required=false) MultipartFile images
   		 						){
   	 
     
  updateProductDTO.setProductNum(updateProductDTO.getProductNum());
   
   
   System.out.println("1 " + updateProductDTO.getProductNum());
   
   System.out.println(updateProductDTO);

   String savePath = null;	 
   
		savePath = request.getSession().getServletContext().getRealPath("resources/summernoteImg");
   	
	
   
	   int result = ps.updateProduct(updateProductDTO,images,savePath);
	
	
	    String url =null;
	
		// 게시글 삽입 결과에 따른 View 연결 처리
		if(result > 0) {
			url = "redirect:adminProductList";
			
		}else{
			url = "redirect:adminProductView";
		}
	
	   return url;
  } 
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//관리자 전체 회원 조회
	@RequestMapping("adminMember/adminMemberList")
	public String adminMemberList() {
		return "adminMember/adminMemberList";
	}
	
	
	//관리자 회원 상세정보
	@RequestMapping("adminMember/adminMemberInfo")
	public String adminMemberInfo() {
		return "adminMember/adminMemberInfo";
	}
	
	//QnA작성
	@RequestMapping("boardInput/qnaInput")
	public String qnaInput() {
		return "boardInput/qnaInput";
	}
	
	//공지사항 작성
	@RequestMapping("boardInput/noticeInput")
	public String noticeInput() {
		
		return "boardInput/noticeInput";
	}
	//공지사항 클릭하고 보기
	@RequestMapping("boardInput/notice")
	public String notice(@RequestParam int notice_no,Model model) {
		System.out.println("notice_no 컨트롤러 : " + notice_no);
		ps.contentView(notice_no, model);
		
		bs.upHitNotice(notice_no);
		return "boardInput/notice";
	}
	
	//QnA 클릭해서 확인
	@RequestMapping("boardInput/QNA")
	public String QNA() {
		return "boardInput/QNA";
	}
	
	
	//FAQ 등록
	@RequestMapping("boardInput/faqInput")
	public String faqInput() {
		return "boardInput/faqInput";
	}
	
	
	
	
	// -------------------------------- summernote --------------------------------
	// summernote에 업로드된 이미지 저장 Controller
	
	@ResponseBody // 응답 시 값 자체를 돌려보냄
	@RequestMapping("adminProduct/insertImage")
	public String insertImage(HttpServletRequest request,
							  @RequestParam("uploadFile") MultipartFile uploadFile) {
		// 서버에 파일(이미지)를 저장할 폴더 경로 얻어오기
		String savePath
		 = request.getSession().getServletContext().getRealPath("resources/summernoteImg");
		System.out.println("savePath"+savePath);
		
		productImageDTO at =ps.insertImage(uploadFile,savePath);
		
		// java -> js로 객체 전달 : JSON
		return new Gson().toJson(at);
		
	}
	
	
	
	
	
	//공지사항 저장
	@RequestMapping("noticeSave")
	public String noticeSave(HttpServletRequest request,
							HttpServletResponse response){
		NoticeDTO dto = new NoticeDTO();
		dto.setNotice_title(request.getParameter("notice_title"));
		dto.setNotice_content(request.getParameter("notice_content"));
		//dto.setNotice_no(Integer.parseInt(request.getParameter("notice_no"))); // 시퀀스 만들어지면 지우고 maaper에 시퀀스로 등록하기
		dto.setNotice_group(request.getParameter("notice_group"));
		
		
		ps.noticeSave(dto, request);
		
		return "redirect:board/notice";
		
	}

	//공지사항 수정
	@RequestMapping("noticeModify")
	public String noticeModify(HttpServletResponse response, // 사용자에게 메시지 전달(성공,실패)
							HttpServletRequest request,
							@RequestParam int notice_no) throws IOException {
		String message = ps.noticeModify(request,notice_no);
		PrintWriter out = response.getWriter();
		response.setContentType("text/html; charset=utf-8");
		out.print(message);
		
		
		return "redirect:board/notice";
	}
	//공지사항 삭제
	@RequestMapping("noticeDelete")
	public void delete(@RequestParam int notice_no,
						HttpServletRequest request,
						HttpServletResponse response) throws IOException {
		
		String message = ps.noticeDelete(notice_no, request);
		PrintWriter out = response.getWriter();
		response.setContentType("text/html; charset=utf-8");
		out.print(message);
		
	}

	//QnA 답변 수정
	@RequestMapping("replyModify")
	public String replyModify(HttpServletRequest request,
							@RequestParam int enquiryReplyNo,
							@Param(value = "eReplyContent") String eReplyContent) {
		
		ps.replyModify(enquiryReplyNo,eReplyContent);
		return "redirect:board/qna";
	}
	
	//회원검색
	@RequestMapping("adminMember/adminMemberSearch")
	public void adminMemberSearch(){
		
	}
	
	//상품검색
	@RequestMapping("adminProduct/adminProductSearch")
	public String adminProductSearch(Model model,@RequestParam(defaultValue="product_num") String ProductSearch_option,@RequestParam(defaultValue="") String keyword){
		ps.adminProductSearch(model,ProductSearch_option,keyword);
		model.addAttribute("productSearch_option", ProductSearch_option);
		model.addAttribute("keyword", keyword);
		
		return "adminProduct/adminProductSearch";
	}
	@RequestMapping("boardInput/faqForm")
	public String faqForm() {
		return "boardInput/faqForm";
	}
	
	@RequestMapping("faqSave")
	public void faqSave(HttpServletRequest request,@ModelAttribute FaqDTO dto,HttpServletResponse response) throws IOException {
		String message = ps.faqSave(request, dto);
		PrintWriter out = response.getWriter();
		response.setContentType("text/html; chartset=utf-8");
		out.print(message);
		
		
	}
	
	@RequestMapping("faqDelete")
	public void faqDelete(HttpServletRequest request,HttpServletResponse response,@RequestParam int faq_no) throws IOException {
		String message = ps.faqDelete(request, faq_no);
		PrintWriter out = response.getWriter();
		response.setContentType("text/html; chartset=utf-8");
		out.print(message);
		
	}
	
	@RequestMapping("boardInput/faqModifyView")
	public String faqModifyView(@RequestParam int faq_no, Model model) {
		ps.faqModifyView(faq_no,model);
		return "boardInput/faqModifyView";
	}
	
	@RequestMapping("faqModify")
	public void faqModify(HttpServletRequest request,HttpServletResponse response,@RequestParam int faq_no) throws IOException {
		String message = ps.faqModify(request, faq_no);
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html; chartset=utf-8");
		
		out.print(message);
		
	}
	
	
}












