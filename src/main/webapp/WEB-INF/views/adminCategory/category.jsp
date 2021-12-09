<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	/* .sideCategory{width: 200px; height: 500px;}
	nav ul {list-style: none; line-height: 30px;}
	nav ul li a{color: black; text-decoration: none;}
	nav ul li a:hover {
		color:blue;padding-bottom: 3px;
		border-bottom: 1px solid blue; transition:all 0.25s;
		text-decoration: none;
	} */
	
</style>


</head>
<body>


<div class ="sideCategory">
	<%-- <h2>관리자</h2>
	<nav>
		<label><b>상품관리</b></label>
		<ul>
			<li><a href="${contextPath }/adminProduct/adminProductList">상품조회</a></li>
		</ul>
		<label><b>회원관리</b></label>
		<ul>
			<li><a href="${contextPath }/adminMember/adminMemberList">회원관리</a></li>
		</ul>
		<label><b>게시판</b></label>
		<ul>
			<li><a href="${contextPath }/board/faq">자주하는 질문</a></li>
			<li><a href="${contextPath }/board/qna">Q&A</a></li>
			<li><a href="${contextPath }/board/notice">공지사항</a></li>
		</ul>
	</nav>
	
</div> --%>
	


</body>
</html>