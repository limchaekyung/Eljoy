<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style type="text/css">
	div ul { padding-left: 5px; }
</style>
</head>
<body>
	<aside>
	<div class="w3-light-grey w3-bar-block" style="float: left;">
		<c:choose>
			<c:when test="${login == 'admin' }"><!-- ${login == admin } 관리자 로그인시 -->
				<h3 class="w3-bar-item">상품관리</h3>
				<ul>
					<li><a href="${contextPath }/adminProduct/adminProductList" class="w3-bar-item w3-button w3-hover-light-blue">상품조회</a></li>
				</ul>
				<h3 class="w3-bar-item">회원관리</h3>
				<ul>
					<li><a href="${contextPath }/adminMember/adminMemberList" class="w3-bar-item w3-button w3-hover-light-blue">회원관리</a></li>
				</ul>
			</c:when>
			<c:otherwise>
			<c:if test="${ login != null }">
				<h3 class="w3-bar-item">마이페이지</h3>
				<ul>
					<li><a href="${ contextPath }/mypage/myCart" class="w3-bar-item w3-button w3-hover-light-blue">장바구니</a></li>
					<li><a href="${ contextPath }/member/id_modify" class="w3-bar-item w3-button w3-hover-light-blue">개인정보 수정</a></li>
					<li><a href="${ contextPath }/mypage/myRental" class="w3-bar-item w3-button w3-hover-light-blue">주문 내역</a></li>
					<li><a href="${ contextPath }/mypage/myReview" class="w3-bar-item w3-button w3-hover-light-blue">내 리뷰</a></li>
					<li><a href="${ contextPath }/mypage/myEnquiry" class="w3-bar-item w3-button w3-hover-light-blue">내 질문</a></li>
				</ul>
			</c:if>			
			</c:otherwise>
		</c:choose>
		
		<h3 class="w3-bar-item">고객센터</h3>
		<ul>
			<li><a href="${ contextPath }/board/faq" class="w3-bar-item w3-button w3-hover-light-blue">자주하는 질문</a></li>
			<li><a href="${ contextPath }/board/notice" class="w3-bar-item w3-button w3-hover-light-blue">공지사항</a></li>
			<li><a href="${ contextPath }/board/qna" class="w3-bar-item w3-button w3-hover-light-blue">Q&A</a></li>
		</ul>
	</div>
	</aside>

</body>
</html>