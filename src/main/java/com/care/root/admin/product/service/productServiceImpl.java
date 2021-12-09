package com.care.root.admin.product.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Delete;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.root.admin.product.dto.MessageDTO;
import com.care.root.admin.product.dto.boardQnaRepDTO;
import com.care.root.admin.product.dto.productDTO;
import com.care.root.admin.product.dto.productImageDTO;
import com.care.root.adminProduct.mtbatis.productMapper;
import com.care.root.board.dto.EnquiryDTO;
import com.care.root.board.dto.FaqDTO;
import com.care.root.board.dto.NoticeDTO;
import com.care.root.board.service.BoardService;
import com.care.root.board.service.BoardServiceImpl;


//상품등록서비스임플
@Service
public class productServiceImpl implements productService{
	@Autowired productMapper mapper;
	
	@Override
	public void adminProductList(Model model, int num) {
		int pageLatter = 5;
		int allCount = mapper.selectProductCount();
		int pageNumCnt = 5;
		int endPageNum = (int)(Math.ceil((double)num / (double)pageNumCnt) * pageNumCnt);
		int startPageNum = endPageNum - (pageNumCnt - 1);
		
		int repeat = allCount / pageLatter;
		if(allCount % pageLatter != 0) {
			repeat += 1;
		}
		int end = num * pageLatter;
		int start = end + 1 - pageLatter;
		int prevPage = num-1;
		int nextPage = num+1;
		
		int endPageNum_tmp = (int)(Math.ceil((double)allCount / (double)pageNumCnt));
		 
		if(endPageNum > endPageNum_tmp) {
		 endPageNum = endPageNum_tmp;
		}
		boolean prev = start == 1 ? false : true;
		boolean next = endPageNum * pageNumCnt >= allCount ? false : true;
		
		
		model.addAttribute("startPageNum", startPageNum);
		model.addAttribute("endPageNum", endPageNum);
		
		model.addAttribute("repeat", repeat);
		model.addAttribute("prevPage",prevPage);
		model.addAttribute("nextPage",nextPage);
		model.addAttribute("prev",prev);
		model.addAttribute("next",next);
		model.addAttribute("select",num);
		
		model.addAttribute("adminProductList",mapper.adminProductList(start,end));
		
	}

	@Override
	public String productSave(MultipartHttpServletRequest mul, HttpServletRequest request) {
		productDTO dto = new productDTO();
		
		dto.setProductTitle(mul.getParameter("productTitle"));
		dto.setProductName(mul.getParameter("productName"));
		
		dto.setProductCategory(mul.getParameter("productCategory"));
		dto.setProductCompany(mul.getParameter("productCompany"));
		dto.setProductNum(mul.getParameter("productNum"));
		dto.setProductPee(mul.getParameter("productPee"));
		dto.setProductQuantity(mul.getParameter("productQuantity"));
		dto.setProductContent(mul.getParameter("productContent"));
		dto.setProductPeriod(mul.getParameter("productPeriod"));
		
		
		productFileService pfs = new productFileServiceImpl();
		MultipartFile file = mul.getFile("productThumbnail");
		
		if(file.getSize() != 0) { //이미지 등록한 경우
			//dto.setProductThumbnail(pfs.saveFile(file));
			
		}else {
			//dto.setProductThumbnail("nan");
		}
		return pfs.getMessage(mapper.productSave(dto), request);
	}

	@Override
	public void adminProductView(String productNum,Model model) {
		model.addAttribute("productView",mapper.adminProductView(productNum));
		
	}
	
	@Override
	public void selectImg(String productNum,Model model) {
		model.addAttribute("productImgView",mapper.attachmentList(productNum));
		//System.out.println("서비스 : "+productNum);
	}

	/*@Override
	public String productModify(MultipartHttpServletRequest mul, HttpServletRequest request) {
		productDTO dto = new productDTO();
		dto.setProductTitle(mul.getParameter("productTitle"));
		dto.setProductName(mul.getParameter("productName"));
		dto.setProductCategory(mul.getParameter("productCategory"));
		dto.setProductCompany(mul.getParameter("productCompany"));
		dto.setProductNum(mul.getParameter("productNum"));
		dto.setProductPee(mul.getParameter("productPee"));
		dto.setProductQuantity(mul.getParameter("productQuantity"));
		dto.setProductContent(mul.getParameter("productContent"));
		
		
		
		MultipartFile file = mul.getFile("productThumbnail");//"imageFileName" 사용자로부터 넘어온 선택된 파일 또는 originFile
		productFileService pfs = new productFileServiceImpl();
//		if(file.getSize() != 0) { // 이미지 변경됨
//			//dto.setProductThumbnail(pfs.saveFile(file)); // 이미지 파일을 수정하면 수정된 이미지 파일 이름으로 바꿈
//			
//		}else {
//			//dto.setProductThumbnail(mul.getParameter("originFileName")); // 이미지 변경 안됨(기존에 파일을 선택햇으면 파일이름이, 안했으면 nan이 들어있음
//		}
		//파일이 변경되지 않았다는 가정
		int result = mapper.productModify(dto);
		MessageDTO mDTO = new MessageDTO();
		mDTO.setResult(result); //result가 성공인지 실패인지를 가지고 있음
		mDTO.setRequest(request);
		mDTO.setSuccessMessage("성공적으로 수정되었습니다!");
		mDTO.setSuccessURL("/adminProduct/adminProductList");
		mDTO.setFailMessage("수정 중 문제가 발생햇습니다");
		mDTO.setFailURL("/adminProduct/adminProductView");
		String message = pfs.getMessage(mDTO);
		return message;
		
	} 
	
*/
	

//	@Override
//	public String productDelete(String productNum, String productThumbnail, HttpServletRequest request) {
//		System.out.println("서비스 상품코드 : " + productNum);
//		productFileService pfs = new productFileServiceImpl();
//		int result = mapper.delete(productNum); // result에는 제대로 삭제되면 1, 삭제가 안되면 1이 아닌 값
//		if(result == 1) {
//			pfs.deleteImage(productThumbnail);
//		}
//		
//		MessageDTO mDTO = new MessageDTO();
//		mDTO.setResult(result); //result가 성공인지 실패인지를 가지고 있음
//		mDTO.setRequest(request);
//		mDTO.setSuccessMessage("성공적으로 삭제되었습니다!");
//		mDTO.setSuccessURL("/board/boardAllList");
//		mDTO.setFailMessage("삭제 중 문제가 발생햇습니다");
//		mDTO.setFailURL("/board/contentView");
//		return pfs.getMessage(mDTO);
//		
//	}
	
	
	// summernote 업로드 이미지 저장 Service
		@Override
		public productImageDTO insertImage(MultipartFile uploadFile, String savePath) {
		
			// 파일명 변경
			String fileName = rename(uploadFile.getOriginalFilename());
			System.out.println(fileName);
			// 웹상 접근 주소
			String filePath = "/resources/summernoteImg";
			
			// 돌려 보내줄 파일 정보를 Attachment 객체에 담아서 전달
			productImageDTO at = new productImageDTO();
			at.setFilePath(filePath);
			at.setFileName(fileName);
			
			// 서버에 파일 저장 (transferTo())
			
			try {
				uploadFile.transferTo(new File(savePath+ "/" +fileName));
				
				
			} catch (Exception e) {
				e.printStackTrace();
				
				//throw new InsertAttachmentFailException("summernote 파일 업로드 실패");
				
			}
			
			
			return at;
		}
		
		
		
		// 파일명 변경 메소드
		public String rename(String originFileName) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
			String date = sdf.format(new java.util.Date(System.currentTimeMillis()));
			
			int ranNum = (int)(Math.random()*100000); // 5자리 랜덤 숫자 생성
			
			String str = "_" + String.format("%05d", ranNum);
			//String.format : 문자열을 지정된 패턴의 형식으로 변경하는 메소드
			// %05d : 오른쪽 정렬된 십진 정수(d) 5자리(5)형태로 변경. 빈자리는 0으로 채움(0)
			
			String ext = originFileName.substring(originFileName.lastIndexOf("."));
			
			return date + str + ext;
		}

		@Override
		public int insertProduct(Map<String, Object> map, List<MultipartFile> images, String savePath) {
			
			int result = 0; // 최종 결과 저장 변수 선언
			
			System.out.println(map);
			
			
			result = mapper.insertProduct(map);

			String productNum = (String)map.get("productNum");

			
			// 3) 게시글 삽입 성공 시 이미지 정보 삽입
			if(result > 0) {
				
				// 이미지 정보를 Attachment 객체 저장하여 List에 추가
				List<productImageDTO> uploadImages = new ArrayList<productImageDTO>(); 

				// images.get(i).getOriginalFilename() -> 업로드된 파일의 원본 파일명
				//  --> 중복 상황을 대비하여 파일명 변경하는 코드 필요(rename() 메소드)
				
				// DB에 저장할 웹상 접근 주소(filePath)
				String filePath = "/resources/summernoteImg"; 
				
				
				// for문을 이용하여 파일정보가 담긴 images를 반복접근
				// -> 업로드된 파일이 있을 경우에만  uploadImages 리스트에 추가
				for(int i=0; i<images.size(); i++) {
					// i == 인덱스 == fileLevel과 같은 값
					
					// 현재 접근한 images의 요소(MultipartFile)에 업로드된 파일이 있는지 확인
					if(!images.get(i).getOriginalFilename().equals("")){
						// 파일이 업로드 된 경우 == 업로드된 원본 파일명이 있는 경우
						
						// 원본파일명 변경
						String fileName = rename(images.get(i).getOriginalFilename());
						
						// Attachment 객체 생성
						productImageDTO at = new productImageDTO(filePath, fileName,i,productNum);
						
						uploadImages.add(at); // 리스트에 추가
					}
				}
				
	//---------------------------------------summernote---------------
				
				// 게시판 타입이 2번(summernote를 이용한 게시글 작성)일 경우
				// boardContent 내부에 업로드된 이미지 정보(filePath,fileName)이 들어있음
				// -> boardContent에서 <img> 태그만을 골라내어
				// img 태그의 src 속성 값을 추출 후 filePath, fileName을 얻어냄.
				
					Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>"); //img 태그 src 추출 정규표현식
					
					// SummerNote에 작성된 내용 중 img태그의 src속성의 값을 검사하여 매칭되는 값을 Matcher객체에 저장함.
					Matcher matcher = pattern.matcher((String)map.get("productContent"));     
					 
					String fileName = null; // 파일명 변환 후 저장할 임시 참조 변수
					String src = null; // src 속성값을 저장할 임시 참조 변수
					
					// matcher.find() : Matcher 객체에 저장된 값(검사를 통해 매칭된 src 속성 값)에 반복 접근하여 값이 있을 경우 true 
					while(matcher.find()){
						src=  matcher.group(1); // 매칭된 src 속성값을  Matcher 객체에서 꺼내서 src에 저장 
						
						filePath = src.substring(src.indexOf("/", 2), src.lastIndexOf("/")); // 파일명을 제외한 경로만 별도로 저장.
						
						fileName = src.substring(src.lastIndexOf("/")+ 1); // 업로드된 파일명만 잘라서 별도로 저장.
						
						// Attachment 객체를 이용하여 DB에 파일 정보를 저장
						productImageDTO at = new productImageDTO(filePath, fileName, 1, productNum);
						uploadImages.add(at);
					}
				
				
					//---------------------------------------summernote---------------

					
					if(!uploadImages.isEmpty()) {
						// 파일 정보 삽입 DAO 호출
						result = mapper.insertProductImg(uploadImages);
						// result == 삽입된 행의 개수
						
						// 모든 데이터가 정상 삽입 되었을 경우 --> 서버에 파일 저장
						if(result == uploadImages.size()) {
						//	result = productNum; // result에 boardNo 저장

							// MutipartFile.transferTo()
							// -> MutipartFile 객체에 저장된 파일을 
							//    지정된 경로에 실제 파일의 형태로 변환하여 저장하는 메소드
							
							int size = 0;
							
							 if(!images.get(0).getOriginalFilename().equals("")){
								size = images.size();
							}
							
							for(int i=0; i<size; i++) {
							
								 // uploadImages : 업로드된 이미지 정보를 담고있는 Attachment가 모여있는 List
								 // images : input type="file" 태그의 정보를 담은 MutipartFile이 모여있는 List
								
								 // uploadImages를 만들 때 각 요소의 파일 레벨을
								 // images의 index를 이용하여 부여함.
									
									try {
										images.get(uploadImages.get(i).getFileLevel())
										.transferTo(new File(savePath +"/"+ uploadImages.get(i).getFileName()));  
										
										
									}catch(Exception e) {
										e.printStackTrace();
										
										// transferTo() 는 IOException을 발생 시킴 (CheckedException)
									// -> 어쩔 수 없이 try-catch 작성
										// --> 예외가 처리되버려서 @Transctional이 정상 동작하지 못함
										// --> 꼭 예외처리를 하지 않아도 되는 UncheckedException을 강제 발생하여
										//     @Transactional이 예외가 발생했음을 감지하게 함
										// --> 상황에 맞는 사용자 정의 예외를 작성
										//throw new InsertAttachmentFailException("파일 서버 저장 실패");
									}
								}
						
							}else { // 파일 정보를 DB에 삽입하는데 실패했을 때
							//	throw new InsertAttachmentFailException("파일 정보 DB 삽입 실패");
							
							}
					
					}
					
				}
				
			
			return result;
		}

		
		
		@Override
		public int updateProduct(productDTO updateProductDTO, MultipartFile images, String savePath) {
			
			
			int result = mapper.productModify(updateProductDTO);
	       
			System.out.println(result + "수정된거냐 안된가냐");
			
			//System.out.println(updateShopBoard.getItemNo()+"shopBoardUpdate");
			
			String filePath = "/resources/summernoteImg";
			if(result > 0) {
				
				productImageDTO oldFile = mapper.attachmentList(updateProductDTO.getProductNum());
				productImageDTO uploadImages = new productImageDTO();
				productImageDTO removeFile = new productImageDTO();
				
				
				if(!images.getOriginalFilename().equals("")) {

					String fileName = rename(images.getOriginalFilename());
					
					productImageDTO at = new productImageDTO(filePath, fileName, 0, updateProductDTO.getProductNum());
					//at.setFileNo(oldFile.getFileNo());filePath fileName
					
					System.out.println("파일수정정보at" + at);
				    result = mapper.updateProductImg(at);
				    System.out.println("파일수정행: " +result);
				
				if(result<=0) {
					System.out.println("파일 정보 수정 실패");
				}

			
				if(result > 0) {
					try {
						images
						.transferTo(new File(savePath+"/"+at.getFileName()));
						
					}catch(Exception e) {
						e.printStackTrace();
					}
				
				}
				
				File tmp = new File(savePath + "/" + oldFile.getFileName());
				tmp.delete();
			
				}
			
			   }
			
			
			// 1) summernote로 작성된 게시글  부분 수정
			// 2) 썸네일 이미지 수정
			// 3) summernote로 작성된 게시글 에있는 이미지 정보 수정
			// -> 게시글 내부 <img> 태그의 src 속성을 얻어와 파일명을 얻어옴.
			// -> 수정 전 게시글의 이미지와  수정 후  게시글 이미지  파일명을 비교
			// --> 새롭게 추가된 이미지, 기존 이미지에서 삭제된 것도 존재
			// --> Attachment 테이블에 반영
			
			
			List<productImageDTO> oldFiles = mapper.selectProductSummernoteImg(updateProductDTO.getProductNum());

			Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>"); //img 태그 src 추출 정규표현식
			
			// 게시글에 작성된 <img> 태그의 src속성을 이용해 
			Matcher matcher = pattern.matcher(updateProductDTO.getProductContent());
			
			// 정규식을 통해 게시글에 작성된 이미지 파일명만 얻어와 모아둘 List 선언
			List<String> fileNameList = new ArrayList<String>();
			
			String src = null; //  matcher에 저장된 src를 꺼내서 임시 저장할 변수
			String fileName = null; //src에서 파일명을 추출해서 임시 저장할 변수
			
			while(matcher.find()) {
				src = matcher.group(1); // /ehshe/shop/resources/clothes/abc.jpg
				fileName =src.substring(src.lastIndexOf("/")+1); // abc.jpg
				fileNameList.add(fileName);
			}
			
			// DB에 새로 추가할 이미지파일 정보를 모아둘 List 생성
			List<productImageDTO> newShopAttachmentList = new ArrayList<productImageDTO>();
			
			// DB에서 삭제할 이미지 파일 번호를 모아둘 LIST 생성
			List<Integer> deleteFileNoList = new ArrayList<Integer>();
			
			
			
			// 수정된 게시글 파일명 목록(fileNameList)와
			// 수정 전 파일 정보 목록(oldFiles)를 비교해서
			// 수정된 게시글 파일명 하나를 기준으로 하여 수정 전 파일명과 순차적 비교를 진행
			// --> 수정된 게시글 파일명과 일치하는 수정 전 파일명이 없다면
			//    == 새로 삽입된 이미지임을 의미함.
			
			for(String fName : fileNameList) {
				
				boolean flag = true;
				
				for(productImageDTO oldAt : oldFiles) {
					
					// if(oldAt.getFileLevel() == 0) continue;
					
					if(fileName.equals(oldAt.getFileName())) { // 수정 후 / 수정 전 같은 파일이 있다.== 수정되지 않았다.
						flag = false;
						break;
					}
				}
				
				// flag == true ==  수정 후 게시글 파일명과 수정전 파일명이 일치하는게 없을 경우
				// == 새로운 이미지 --> newShopAttachmentList 추가
				if(flag) {
					productImageDTO at = new productImageDTO(filePath,fName,1,updateProductDTO.getProductNum());
					newShopAttachmentList.add(at);
				}
				
			}
			
			
			// 수정전 게시글 파일명 목록(oldFlies)와
			// 수정된 파일 정보 목록(fileNameList)를 비교해서
			// 수정전 게시글 파일명 하나를 기준으로 하여 수정 후 파일명과 순차적 비교를 진행
			// --> 수정 전 게시글 파일명과 일치하는 수정 후 파일명이 없다면
			//    == 기존 수정 전 이미지가 삭제함을 의미 
			for(productImageDTO oldAt : oldFiles) {
				
			//	if(oldAt.getFileLevel() == 0) continue;
				
				boolean flag = true;
				
				for(String fName : fileNameList) {
					if(oldAt.getFileName().equals(fName)) {
						flag =  false;
						break;
					}
				}
				
				// flag == true ==  수정 전 게시글 파일명과 수정 후  파일명이 일치하는게 없을 경우
				// == 삭제된 이미지 --> deleteFileNoList 추가
				if(flag){
					deleteFileNoList.add(oldAt.getFileNo());
					
				}
				
			}
		  //newShopAttachmentList / deleteFileNoList 완성됨
			
			if(!newShopAttachmentList.isEmpty()) { //새로 삽입된 이미지가 있다면
				result = mapper.insertProductImg(newShopAttachmentList);
				
				if(result != newShopAttachmentList.size()) { // 삽입된 결과행의 수와 삽입을 수행한 리스트 수가 맞지 않을 경우 == 실패
					System.out.println("파일 수정 실패(파일 정보 삽입 중 오류 발생)");
				}
			}
			
			if(!deleteFileNoList.isEmpty()){ // 삭제할 이미지가 있다면
				result = mapper.deleteProductImgList(deleteFileNoList);
			
			
				if(result != deleteFileNoList.size()) {
					System.out.println("파일 수정 실패(파일 정보 삭제 중 오류 발생)");
					
				}
			
			
		}

			
			
	   return result;
				
   }

		
		
//		@Override
//		public void delete(String[] ajaxMsg) {
//			System.out.println("서비스ajaxMsg : "+ajaxMsg);
//			mapper.delete(ajaxMsg);
//			
//		}

		@Override
		public void delete(List<String> num) {
			
			System.out.println("서비스ajaxMsg : "+ num);
			
		    mapper.deleteProductImgList2(num);
			
			mapper.delete(num);
			
		}

		@Override
		public List<String> selectDBFileList() {
			
			return mapper.selectDBFileList();
		}

		@Override
		public void noticeSave(NoticeDTO dto, HttpServletRequest request) {
			mapper.noticeWriteSave(dto);
			System.out.println("서비스공지사항내용"+dto.getNotice_content());
			System.out.println("서비스 공지사항 번호"+dto.getNotice_no());
		}

		@Override
		public void contentView(int notice_no, Model model) {
			model.addAttribute("noticeData", mapper.contentView(notice_no));
			System.out.println("notice_no 서비스 : " + notice_no);
		}

		@Override
		public void addReply(boardQnaRepDTO dto) {
			//int result = mapper.addReply(dto);
			mapper.addReply(dto);
			//return result;
		}

		@Override
		public String noticeModify(HttpServletRequest request,int notice_no) {
			NoticeDTO dto = new NoticeDTO();
			dto.setNotice_content(request.getParameter("notice_content"));
			dto.setNotice_group(request.getParameter("notice_group"));
			dto.setNotice_title(request.getParameter("notice_title"));
			dto.setNotice_no(Integer.parseInt(request.getParameter("notice_no")));
			System.out.println("서비스 공지사항 내용 : "+dto.getNotice_content());
			System.out.println("서비스 공지사항 제목 : "+dto.getNotice_title());
			System.out.println("서비스 공지사항 글번호 : "+notice_no);
			productFileService pfs = new productFileServiceImpl();
			
			int result = mapper.noticeModify(dto);
			MessageDTO mDTO = new MessageDTO();
			mDTO.setResult(result); //result가 성공인지 실패인지를 가지고 있음
			mDTO.setRequest(request);
			mDTO.setSuccessMessage("성공적으로 수정되었습니다!");
			mDTO.setSuccessURL("/board/notice");
			mDTO.setFailMessage("수정 중 문제가 발생햇습니다");
			mDTO.setFailURL("/boardInput/notice");
			String message = pfs.getMessage(mDTO);
			mapper.noticeModify(dto);
			return message;
		}

		@Override
		public String noticeDelete(int notice_no,HttpServletRequest request) {
			
			productFileService pfs = new productFileServiceImpl();
			
			int result = mapper.noticeDelete(notice_no);
			
			MessageDTO mDTO = new MessageDTO();
			mDTO.setResult(result);
			mDTO.setRequest(request);
			mDTO.setSuccessMessage("성공적으로 삭제 되었습니다");
			mDTO.setSuccessURL("/board/notice");
			mDTO.setFailMessage("삭제 중 문제가 발생하였습니다");
			mDTO.setFailURL("/boardInput/notice");	
			return pfs.getMessage(mDTO);
			
		}

		@Override
		public void replyModify(int enquiryReplyNo, String eReplyContent) {
			boardQnaRepDTO dto = new boardQnaRepDTO();
			dto.setEnquiryReplyNo(enquiryReplyNo);
			dto.seteReplyContent(eReplyContent);
			mapper.replyModify(dto);
			
		}

		@Override
		public void replyState(EnquiryDTO edto, int replyno) {
			edto.setEnquiry_no(replyno);
			edto.setEnquiry_state("1");
			mapper.replyState(edto);
			
			
		}

		@Override
		public void adminProductSearch(Model model, String productSearch_option, String keyword) {
			Map<String, String> map = new HashMap<String, String>();
			
			map.put("productSearch_option", productSearch_option);
			map.put("keyword", keyword);
			
			model.addAttribute("productSearch", mapper.adminProductSearch(map));
			
		}

		@Override
		public String faqSave(HttpServletRequest request, FaqDTO dto) {
			dto.setFaq_group(Integer.parseInt(request.getParameter("faq_group")));
			dto.setFaq_subject(request.getParameter("faq_subject"));
			dto.setFaq_content(request.getParameter("faq_content"));
			productFileService pfs = new productFileServiceImpl();
			
			return pfs.faqGetMessage(mapper.faqSave(dto), request); 
		}

		@Override
		public String faqDelete(HttpServletRequest request, int faq_no) {
			
			productFileService pfs = new productFileServiceImpl();
			int result = mapper.faqDelete(faq_no);
			MessageDTO mDTO = new MessageDTO();
			mDTO.setResult(result);
			mDTO.setRequest(request);
			mDTO.setSuccessMessage("성공적으로 삭제 되었습니다");
			mDTO.setSuccessURL("/board/faq");
			mDTO.setFailMessage("삭제 중 문제가 발생하였습니다");
			mDTO.setFailURL("/board/faq");
			return pfs.getMessage(mDTO);
		}

		@Override
		public String faqModify(HttpServletRequest request, int faq_no) {
			FaqDTO dto = new FaqDTO();
			dto.setFaq_no(faq_no);
			dto.setFaq_subject(request.getParameter("faq_subject"));
			dto.setFaq_content(request.getParameter("faq_content"));
			
			productFileService pfs = new productFileServiceImpl();
			
			int result = mapper.faqModify(dto);
			MessageDTO mDTO = new MessageDTO();
			mDTO.setResult(result);
			mDTO.setRequest(request);
			mDTO.setSuccessMessage("성공적으로 수정되었습니다");
			mDTO.setSuccessURL("/board/faq");
			mDTO.setFailMessage("수정 중 문제가 발생하였습니다");
			mDTO.setFailURL("/board/faqModify");
			String message = pfs.faqModifyGetMessage(mDTO);
			return message;
		}

		@Override
		public void faqModifyView(int faq_no, Model model) {
			model.addAttribute("faqModifyView",mapper.faqModifyView(faq_no));
			
		}

		
		
		


		

		

		

		

		


		
		

		
		

		
	
 
}































