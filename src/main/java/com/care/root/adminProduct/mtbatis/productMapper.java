package com.care.root.adminProduct.mtbatis;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.care.root.admin.product.dto.boardQnaRepDTO;
import com.care.root.admin.product.dto.productDTO;
import com.care.root.admin.product.dto.productImageDTO;
import com.care.root.board.dto.EnquiryDTO;
import com.care.root.board.dto.FaqDTO;
import com.care.root.board.dto.NoticeDTO;
//상품등록 Mapper
public interface productMapper {
	public ArrayList<productDTO> adminProductList(@Param("s")int start,@Param("e") int end);
	
	
	public int productSave(productDTO dto);
	public productDTO adminProductView(String productNum);
	public int productModify(productDTO dto);
	//public int delete(String productNum);
	public int insertProductImg(List<productImageDTO> uploadImages);
	public int insertProduct(Map<String, Object> map);
	public productImageDTO attachmentList(String productNum);
	
	public int selectProductCount();
	public int updateProductImg(productImageDTO at);


	public List<productImageDTO> selectProductSummernoteImg(String productNum);


	public int deleteProductImgList(List<Integer> deleteFileNoList);

	public void deleteProductImgList2(List<String> deleteFileNoList);
	public int delete(List<String> num);

	public List<String> selectDBFileList();

	public void noticeWriteSave(NoticeDTO dto);


	public NoticeDTO contentView(int notice_no);


	public int addReply(boardQnaRepDTO dto);


	public void replyView(int num);


	public boardQnaRepDTO getRepList(int enquiry_no);


	public int noticeModify(NoticeDTO dto);


	public int noticeDelete(int notice_no);


	public void replyModify(boardQnaRepDTO dto);


	public ArrayList<EnquiryDTO> repCheck(int enquiry_no);


	public void replyState(EnquiryDTO edto);


	// public ArrayList<productDTO> adminProductSearch(Map<String, String> map);

	public List<String> adminProductSearch(Map<String, String> map);


	public int faqSave(FaqDTO dto);


	public int faqDelete(int faq_no);


	public int faqModify(FaqDTO dto);


	public FaqDTO faqModifyView(int faq_no);


	

	





	



	


	





	

	



	



}
