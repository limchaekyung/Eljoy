<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	.wrap{width: 900px;height: 800px; margin: 0px 0 0 400px; }
	.t{width: 1500px; height: 1000px;  margin: auto;}
</style>
<script type="text/javascript">
	function removeCheck() {
	 if (confirm("수정을 취소하시겠습니까?") == true){    //확인
		 location.href='../board/faq'
	 }else{   //취소
	     return false;
	 }
	}
</script>
</head>
<body>
<jsp:include page="../header.jsp" />
<aside>
	<jsp:include page="../adminCategory/category.jsp" />						
</aside>
<div class="t">

	<div class="wrap">
		<h2>자주 하는 질문</h2>
		
		<nav>
			<div style="margin-top: 20px;">
				<select name="faq_group" class="faq">
					<option value="1">회원가입/탈퇴
					<option value="2">주문/결제
					<option value="3">파손&분실관련
					<option value="4">배송
					<option value="5">반납
				</select>
			</div>
			<div style="margin-top: 15px;">
				<h5>글 제목</h3>
				<input type="text" name="faqTitle" style="width: 600px;">
			</div>
			<div style="margin-top: 20px;">
				<textarea rows="10" cols="82"></textarea>
			</div>
		</nav>
		<div class="button" style="margin:10px 0 0 540px;">
			<button type="button" class="btn btn-outline-primary" id="ok" onclick="" >등록</button>
			<button type="button" class="btn btn-outline-primary" id="cancel" onclick="removeCheck()">취소</button>
		</div>
	</div>	
</div>
<c:import url="../footer.jsp"/>
	
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
</body>
</html>



























