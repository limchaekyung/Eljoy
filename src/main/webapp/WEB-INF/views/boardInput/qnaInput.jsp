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
</script>

</head>
<body>

<jsp:include page="../header.jsp" />
<aside>
	<jsp:include page="../adminCategory/category.jsp" />						
</aside>
<div class="t">

	
	<div class="wrap">
		<div>
			<label><h1>Q & A</h1></label>
		</div>
		<div>
			<label style="margin: 40px 0 0 0px;">글 제목</label><br>
			<input type="text" style=" width: 740px;" name="enquiry_subject">
		</div>
		<div style="margin-top: 20px;">
			<textarea rows="10" cols="100" name="enquiry_content"></textarea>
		</div>
		<button type="button" class="btn btn-outline-primary" id="" onclick="#" style="margin: 10px 0 0 290px;">등 록</button>
		<button type="button" class="btn btn-outline-primary" id="" onclick="removeCheck()" style="margin: 10px 0 0 70px;" >취 소</button>
		
		
</div>
<jsp:include page="../footer.jsp" />

<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
</body>
</html>