<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />

<!-- Bootstrap icons-->
<linkhref="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />

<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
<style type="text/css">
	.t{width: 1500px; height: 1000px;  margin: auto;}
.wrap{width: 1200px;height: 800px; margin: -490px 0 0 400px;}
</style>

<script type="text/javascript">
	function removeCheck() {
	 if (confirm("작성을 취소하시겠습니까?") == true){    //확인
		 location.href='${contextPath}/board/qna'
	 }else{   //취소
	     return false;
	 }
	}
	function back() {
		window.history.back();
	}
</script>

</head>
<body>

<jsp:include page="../header.jsp" />
<aside>
	<jsp:include page="../adminCategory/category.jsp" />						
</aside>
<div class="t">

	<!-- 게시판 클릭시 이용자는 읽기만 관리자는 답변기능  -->
	<!-- QnA 보기 페이지 -->
	<div class="wrap">
		<div>
			<label><h1>Q & A</h1></label>
		</div>
		
		
		<c:choose>
			<c:when test="${login == admin }"><!-- 관리자 로그인 -->
				<div>
					<label style="margin: 40px 0 0 0px;">글 제목</label><br>
					<input type="text" style=" width: 740px;" name="enquiry_subject" value="db값 가져오기" readonly="readonly">
				</div>
				<div style="margin-top: 20px;">
					<textarea rows="10" cols="100" name="enquiry_content" readonly="readonly">db값 가져오기</textarea>
				</div>
				
				<label>관리자</label><br>
				<textarea rows="5" cols="100" name ="e_reply_content"></textarea>
				<div style="margin: 10px 0 0 0px;">
					<button type="button" class="btn btn-outline-primary" id="" onclick="#" style="margin: 10px 0 0 290px;">등 록</button>
					<button type="button" class="btn btn-outline-primary" id="" onclick="removeCheck()" style="margin: 10px 0 0 70px;" >취 소</button>
				</div>
			</c:when>
			
			<c:otherwise> <!-- 이용자 로그인 -->
				<div>
					<label style="margin: 40px 0 0 0px;">글 제목</label><br>
					<input type="text" style=" width: 740px;" name="enquiry_subject" value="db값 가져오기" readonly="readonly">
				</div>
				<div style="margin-top: 20px;">
					<textarea rows="10" cols="100" name="enquiry_content" readonly="readonly">db값 가져오기</textarea>
				</div>
				
				<c:choose>
					<c:when test=""><!-- ${a==a } 답변 달렸을 경우 -->
					관리자 답변<br>
						<textarea rows="5" cols="100" name ="e_reply_content" style="margin: 0 0 0 -5px;">db에서 관리자 답변 값 가져오기</textarea>
					</c:when>
				</c:choose>
				<button type="button" class="btn btn-outline-primary" id="" onclick="back()" style="margin: 10px 390px 0 -6px;" >뒤로가기</button>
			</c:otherwise>
		</c:choose>
		
		
</div>
<jsp:include page="../footer.jsp" />

<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
</body>
</html>































