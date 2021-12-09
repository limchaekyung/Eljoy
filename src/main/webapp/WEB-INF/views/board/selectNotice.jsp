<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />

<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />

<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
<style type="text/css">
	section#container { padding: 20px 0; border-top: 2px solid #eee; border-bottom: 2px solid #eee; }
 	section#container::after { content: ""; display: block; clear: both; }
	aside { float: left; width: 200px; padding: 0 0 0 5px; }
 	div#container_box { float: right; width: calc(100% - 200px - 20px); }
 	aside ul li { margin-bottom: 10px; list-style: none; }
</style>
</head>
<body>
	<c:import url="../header.jsp"/>	
	<section id="container">
		<aside>
			<c:import url="../aside.jsp"/>				
		</aside>
		<div id="container_box">
		<h3>${ selectNotice.notice_title }</h3>
			<form action="" method="post" enctype="multipart/form-data">
			<input type="hidden" value="${ selectNotice.notice_no }"/>
				<fmt:parseDate var="parseRegDate" value="${ selectNotice.notice_writedate }" pattern="yyyy-MM-dd HH:mm:ss" />
				<fmt:formatDate var="formatRegDate" value="${ parseRegDate }" pattern="yyyy.MM.dd"/>
				<b>작성날짜</b>&nbsp;${ formatRegDate }&nbsp;
				<b>조회수</b>&nbsp;${ selectNotice.notice_hit }<br><br>
				<b>내용</b><br>
				<textarea rows="10" cols="50" name="notice_content" readonly>${ selectNotice.notice_content }</textarea><hr>		
			</form>
				<input type="button" value="리스트로 돌아가기" onclick="location.href='${ contextPath }/board/notice'">
		</div>
	</section>
	<c:import url="../footer.jsp"/>
	
	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>

	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
</html>