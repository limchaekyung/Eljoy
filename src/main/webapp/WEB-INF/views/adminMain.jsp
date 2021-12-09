<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="${contextPath }/resources/css/styles.css" rel="stylesheet" />
    <style type="text/css">
    .searchText {
	width: 400px;
	height: 39px;
	border: 2px solid black;
	border-radius: 10px;
	outline: none;
	margin: 0 auto;
	align-content: center;
}


.search {
	position: relative;
	text-align: center;
	top: 10px;
}
.wrap {
	width: 1200px;
	height: 400px;
	margin: 20px 0 0 200px;
}

.button {
	margin: 0 0 0 900px;
}

.container {
	margin-top: 20px;
}

#b3 {
	margin-top: 10px;
	margin-left: 10px;
}

.t {
	width: 1500px;
	height: 3000px;
	margin: auto;
}

#a {
	width: 60px;
	text-align: center;
	color: black;
}
/* a:link{text-decoration:none; color: black;} */
aside ul li {
	margin-bottom: 10px;
	list-style: none;
}

aside {
	float: left;
	width: 300px;
	padding: 0 0 0 40px;
}

.row {
	margin: 0px auto; /*가운데 정렬*/
	/*width:1024px;*/
}
    </style>
</head>
<body>
    <c:import url="adminHeader.jsp"/>
    <div class="search" style="text-align: center;">
				<form action="${ contextPath }/Product/ProductSearch">
					<select name="ProductSearch_option" style="padding: 3px">
						<option value="product_num"
							<c:if test="${ProductSearch_option eq 'product_num'}">selected</c:if>>상품번호</option>
						<option value=product_title
							<c:if test="${ProductSearch_option eq 'product_title'}"></c:if>>상품명</option>
						<option value=product_pee
							<c:if test="${ProductSearch_option eq 'product_pee'}">selected</c:if>>상품가격</option>
					</select> <input type="text" name="keyword" class="searchText"
						style="width: 270px; height: 30px;" value="${keyword}"> <input
						type="submit" id="searchBtn" class="btn btn-outline-dark"
						value="검색">
				</form>
			</div>
			<aside>
				<c:import url="category_list.jsp" />
			</aside>
			
			
        <div class="t">
			<div class="wrap">
				<div class="container-fluid">
					<div class="row">
						<c:forEach var="dto" items="${productList }">
							<div class="col-md-4 mb-4 mt-4">
								<div class="card h-100 " style="width: 300px;">
									<!-- Product image-->
									<c:set var="src"
										value="${contextPath}${dto.filePath}/${dto.fileName}" />
									<div class="thumbnail">
										<div class="mb-2 mt-2" style="text-align: center">
											<div class="boardImg" id="titleImgArea">
												<img id="titleImg" width="200" height="200" src="${src}">
											</div>
										</div>
									</div>

									<!-- Product details-->
									<div class="card-body">
										<div class="text-center">
											<!-- Product name-->
											${dto.productName }
											<h5 class="fw-bolder"></h5>
											<!-- Product price-->
											${dto.productPee } 원
										</div>
									</div>

									<!-- Product actions-->
									<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
										<div class="text-center">
											<a class="btn btn-outline-dark mt-auto"
												href="${contextPath }/Product/ProductView?productNum=${dto.productNum}">상세보기</a>
										</div>
									</div>

								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			

		</div>
        <footer>
        	<c:import url="footer.jsp"/>
        </footer>
        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
