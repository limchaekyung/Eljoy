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
	.wrap{width: 1200px;height: 800px; margin: 0px 0 0 200px; }
	.t{width: 1500px; height: 1000px;  margin: auto;}
	.inpuptTile{width: 400px; margin-left: 50px;}
	.array_search{margin: 0 0 0 780px;}
	aside { float: left; width: 200px; padding: 0 0 0 10px; }
	aside ul li { margin-bottom: 10px; list-style: none; }
</style>

</head>
<body>
<jsp:include page="../adminHeader.jsp" />
<aside>
	<jsp:include page="../aside.jsp" />
</aside>
<div class="t">

	<div class="wrap">
		<div>
			<h1>회원목록</h1>
		</div>
		
		<!-- <div class="array_search">
			<select name="array" class="array">
				<option value="0">정렬기준
				<option value="1">가입일
				<option value="2">이름
				<option value="3">최종 접속일
			</select>
			<input type="text" name="search">
			<button type="button" class="btn btn-outline-primary" id="search" onclick="">검색</button>
		</div> -->
		<form action="${ contextPath }/adminMember/adminMemberSearch" method="post" style="margin: 0 0 0 850px;">
			<select name="MemSearch_option">
	        	<option value="member_id"<c:if test="${search_option eq 'member_id'}">selected</c:if>>이름</option>
	        	<option value="enquiry_subject"<c:if test="${search_option eq 'enquiry_subject'}">selected</c:if>>아이디</option>
	   		</select>
			   <input type="text" name="keyword" value="${ keyword }">
			   <input type="submit" id="searchBtn" value="검색">
		</form>
		
	<div class="container">        
	  <table class="table table-striped">
	    <thead>
	      <tr>
	        <th>아이디</th>
	        <th>이름</th>
	        <th>가입일</th>
	        <th>최종 접속일</th>
	        <th></th>
	      </tr>
	    </thead>
	    <tbody>
	    <c:forEach var="#" items="#">
	      <tr>
	        <td><a href="adminMemberInfo">acbs123</a></td><!-- db에 있는 값 가져오기 -->
	        <td>홍길동</td>
	        <td>21-03-25</td>
	        <td>21-05-13</td>
	        <td><button type="button" class="btn btn-outline-primary" id="return" onclick="">반납</button></td>
	      </tr>
	     </c:forEach>
	    </tbody>
	  </table>
	</div>
		
		
		
		
		
		
		
		
		
		
		
	</div>
	
</div>
<jsp:include page="../footer.jsp" />
</body>
</html>


























