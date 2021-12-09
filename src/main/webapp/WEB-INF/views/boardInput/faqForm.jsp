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
</style>
</head>
<body>
<c:import url="../header.jsp"/>	
<c:import url="../aside.jsp"/>

<section id="container">
	<div id="container_box">
		<form action="${contextPath}/faqSave" >
			<table>
				<tr>
					<td>
						공지분류 ${faq_no}
					</td>
					<td>
						<select name="faq_group" class="faqGroup " style="border: 2px solid skyblue; border-radius: 5px;">
				            <option value="0">회원/정보관리
				            <option value="1">주문/결제
				            <option value="2">배송
				            <option value="3">취소/환불
				            <option value="4">반품/교환
				         </select>
					</td>
				</tr>
				<tr>
					<td>
						글 제목
					</td>
					<td>
						<input type="text"name="faq_subject" style="width: 455px;">
					</td>
				</tr>
				<tr>
					<td>
						글 내용
					</td>
					<td>
						<textarea rows="10" cols="60" name="faq_content"></textarea>
					</td>
				</tr>
				<tr>
					<td>
						<input type="submit" value="등록">
						<button type="button" id="cancel" onclick="removeCheck()">취소</button>
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

































