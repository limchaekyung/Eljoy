<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<link href="css/styles.css" rel="stylesheet" />
<style type="text/css">
	section#container { padding: 20px 0; border-top: 2px solid #eee; border-bottom: 2px solid #eee; }
 	section#container::after { content: ""; display: block; clear: both; }
	aside { float: left; width: 200px; padding: 0 0 0 5px; }
 	div#container_box { float: right; width: calc(100% - 200px - 20px); }
 	aside ul li { margin-bottom: 10px; list-style: none; }
 	.star_rating { font-size:0; letter-spacing:-4px; }
	.star_rating a {
	    font-size:22px;
	    letter-spacing:0;
	    display:inline-block;
	    margin-left:5px;
	    color:#ccc;
	    text-decoration:none;
	}
	.star_rating a:first-child { margin-left:0; }
	.star_rating a.on { color:#777; }
</style>
</head>
<body>
	<c:import url="../header.jsp"/>	
	<section id="container">
		<aside>
			<c:import url="../aside.jsp"/>				
		</aside>
		<div id="container_box">
		<h3>내 리뷰 상세보기</h3>
			<form action="" method="post" enctype="multipart/form-data">
			<input type="hidden" value="${ selectReview.review_no }"/>
				<b>상품명</b><a href="#">&nbsp;${ selectReview.product_name }</a><hr>
				<b>작성자</b>
				<input type="text" name="review_id" value="${ selectReview.review_id }" readonly><hr> <!-- 읽기 전용, 수정 불가 -->
				<b>내용</b><br>
				<textarea rows="10" cols="50" name="review_content" readonly>${ selectReview.review_content }</textarea><hr>
				<b>별점</b>
				<label class="star_rating">
					<c:forEach var="star" begin="1" end="${ selectReview.review_score }" step="1">
						<a href="#" class="on">★</a>
					</c:forEach>
				</label><hr>
				<b>사진</b><br>
				<c:if test="${ selectReview.review_file1 == 'nan' }">
					<img id="preview" src="#" width="150px" height="150px" alt="선택된 이미지가 없습니다">&nbsp;
				</c:if>
				<c:if test="${ selectReview.review_file1 != 'nan' }">
					<img id="preview" src="${ contextPath }/mypage/download?file=${ selectReview.review_file1 }" width="150px" height="150px">&nbsp;
				</c:if>
				<c:if test="${ selectReview.review_file2 == 'nan' }">
					<img id="preview" src="#" width="150px" height="150px" alt="선택된 이미지가 없습니다">&nbsp;
				</c:if>
				<c:if test="${ selectReview.review_file2 != 'nan' }">
					<img id="preview" src="${ contextPath }/mypage/download?file=${ selectReview.review_file2 }" width="150px" height="150px">&nbsp;
				</c:if>
				<c:if test="${ selectReview.review_file3 == 'nan' }">
					<img id="preview" src="#" width="150px" height="150px" alt="선택된 이미지가 없습니다"><br>
				</c:if>
				<c:if test="${ selectReview.review_file3 != 'nan' }">
					<img id="preview" src="${ contextPath }/mypage/download?file=${ selectReview.review_file3 }" width="150px" height="150px"><br>
				</c:if>
			</form><hr>
				<input type="button" value="수정" onclick="location.href='${ contextPath }/mypage/modifyReviewForm?review_no=${ selectReview.review_no }'">
				<input type="button" value="삭제" onclick="location.href='${ contextPath }/mypage/deleteReview?review_no=${ selectReview.review_no }&review_file1=${ selectReview.review_file1}&review_file2=${ selectReview.review_file2}&review_file3=${ selectReview.review_file3}'">
				<input type="button" value="답글달기" onclick="">
				<input type="button" value="리스트로 돌아가기" onclick="location.href='${ contextPath }/mypage/myReview'">
		</div>
	</section>
	<c:import url="../footer.jsp"/>
	
	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>

	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
</html>