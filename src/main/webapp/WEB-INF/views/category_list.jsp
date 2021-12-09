<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
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
<link href="${contextPath }/resources/css/styles.css" rel="stylesheet" />
<!-- jquery -->
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
a {
	color: black;
	text-decoration: none;
}

a:hover {
	text-decoration:
}
</style>
</head>
<body>
	<aside>
	<br>
		<div class=" w3-light-grey w3-bar-block">
			<h3 class="w3-bar-item">카테고리</h3>
			<a href="${contextPath}/Product/category?productcategory=휴대폰" class="w3-bar-item w3-button w3-hover-light-blue">핸드폰</a> 
			<a href="${contextPath}/Product/category?productcategory=태블릿PC"	class="w3-bar-item w3-button w3-hover-light-blue">태블릿PC</a> 
			<a href="${contextPath}/Product/category?productcategory=스마트워치" class="w3-bar-item w3-button w3-hover-light-blue">스마트워치</a>
			<a href="${contextPath}/Product/category?productcategory=블루투스 이어폰" class="w3-bar-item w3-button w3-hover-light-blue">블루투스 이어폰</a>
			
			<hr>
			<h3 class="w3-bar-item">제조사</h3>
			<a href="${contextPath}/Product/categorySearch?productCompany=apple" class="w3-bar-item w3-button w3-hover-light-blue">apple</a> 
			<a href="${contextPath}/Product/categorySearch?productCompany=삼성"	class="w3-bar-item w3-button w3-hover-light-blue">samsung</a> 
		</div>
	</aside>


</body>
</html>










