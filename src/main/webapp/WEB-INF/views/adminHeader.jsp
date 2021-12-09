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
<style type="text/css">


.category_loc {
	display: table;
	margin-left: auto;
	margin-right: auto;
}

.category_li {
	list-style-type: none;
	float: left;
	margin-left: 20px;
}
</style>
</head>
<body>
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container px-4 px-lg-5">
			<a href="${contextPath }/main" class="navbar-brand">
				<img src="${contextPath }/resources/img/logo-removebg-preview.png" style="width: 150px; height: 80px;">
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="${contextPath }/main">Home</a></li>					
						<li class="nav-item"><a class="nav-link" href="${contextPath }/adminMember/adminMemberList">회원관리</a></li>	
					<li class="nav-item"><a class="nav-link" href="${contextPath }/adminProduct/adminProductList">상품관리</a></li>					
					<li class="nav-item"><a class="nav-link" href="${contextPath }/board/notice">공지사항</a></li>
					<li class="nav-item"><a class="nav-link" href="${ contextPath }/member/logout">로그아웃</a></li>
				</ul>
				<form class="d-flex" action="${ contextPath }/mypage/myCart">
					<button class="btn btn-outline-dark" type="submit">
						<i class="bi-cart-fill me-1"></i> Cart 
					</button>
				</form>
			</div>
		</div>
	</nav>

	<!-- Header-->
	<header style="background-color: #5282e1;">
		<div class="container" style="display: flex; align-items: center; justify-content: center;">
			<a href="${contextPath }/Product/applecategory?productCompany=apple&productcategory=스마트워치"><img src="${contextPath }/resources/img/ad.jpg" style="padding: 10px 10px;"></a>
		</div>
	</header>

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
</html>