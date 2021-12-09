<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	aside { float: left; width: 200px; padding: 0 0 0 20px; }
	aside ul li { margin-bottom: 10px; list-style: none; }
	div#container_box { float: right; width: calc(100% - 200px - 20px); }
	section#container { padding: 20px 0; border-top: 2px solid #eee; border-bottom: 2px solid #eee; }
 	section#container::after { content: ""; display: block; clear: both; }
 	table {
 	 border-collapse: separate;
	border-spacing: 0 20px;
	}
</style>
</head>
<body>
<c:import url="../header.jsp"/>	
<c:import url="../aside.jsp"/>

<section id="container">
	<div id="container_box">
		<form action="${contextPath}/faqModify" >
			<input type="hidden" name="faq_no" value="${faqModifyView.faq_no}">
			<table>
				<tr>
					<td>
						공지분류
					</td>
					<td>
						<select name="faq_group" class="faqGroup " style="border: 2px solid skyblue; border-radius: 5px;" id="fruit" readonly 
							        onFocus="this.initialSelect = this.selectedIndex;" 
							        onChange="this.selectedIndex = this.initialSelect;">
				            <option value="0" <c:if test="${faqModifyView.faq_group =='0'}"> selected </c:if>>회원/정보관리
				            <option value="1" <c:if test="${faqModifyView.faq_group =='1'}"> selected </c:if>>주문/결제
				            <option value="2" <c:if test="${faqModifyView.faq_group =='2'}"> selected </c:if>>배송
				            <option value="3" <c:if test="${faqModifyView.faq_group =='3'}"> selected </c:if>>취소/환불
				            <option value="4" <c:if test="${faqModifyView.faq_group =='4'}"> selected </c:if>>반품/교환
				         </select>
					</td>
				</tr>
				<tr>
					<td>
						글 제목
					</td>
					<td>
						<input type="text"name="faq_subject" style="width: 455px;" value="${faqModifyView.faq_subject}">
					</td>
				</tr>
				<tr>
					<td>
						글 내용
					</td>
					<td>
						<textarea rows="10" cols="60" name="faq_content">${faqModifyView.faq_subject}</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: right;">
						<input type="submit" value="수정">
						<button type="button" id="cancel" onclick="removeCheck()">취소</button>
						<button type="button" id="cancel" onclick="location.href='${contextPath}/faqDelete?faq_no=${faqModifyView.faq_no}'">삭제</button>
					</td>
				</tr>
			</table>	
		</form>
	</div>
</section>
<c:import url="../footer.jsp"/>
	
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>

<!-- Core theme JS-->
<script src="js/scripts.js"></script>
</body>
<script type="text/javascript">
	//취소버튼
	function removeCheck() {
	    if (confirm("등록 취소하시겠습니까?") == true){    //확인
	       location.href='${contextPath}/board/faq'
	    }else{   //취소
	        return false;
	    }
	   }
</script>
</html>

































