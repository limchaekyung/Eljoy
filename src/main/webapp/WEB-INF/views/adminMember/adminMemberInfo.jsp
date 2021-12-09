<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.t{width: 1500px; height: 1000px;  margin: auto; }
	section#container { padding: 20px 0; border-top: 2px solid #eee; border-bottom: 2px solid #eee; }
	.wrap{width: 1200px;height: 800px;margin: 0px 0 0 200px;}


	.memberName{margin-left: 470px;}
	.rentalStatus{margin: 40px 0 0 530px;}
	li {list-style: none;}
	aside ul li { margin-bottom: 10px; list-style: none; }
 	aside { float: left; width: 200px; padding: 0 0 0 10px; }
</style>
</head>
<body>
<jsp:include page="../header.jsp" />
<section id="container">
<aside>
	<jsp:include page="../aside.jsp" />						
</aside>
<div class="t">

	<div class="wrap">
		<div class="memberName">
			<h1><b>홍길동</b>님 페이지</h1> <!-- db에 있는 값 가져와서 이름에 넣기 -->
		</div>
		
		<div class="container">        
	   		<table class="table table-striped">
	    	<thead>
		      <tr>
		        <th>아이디</th>
		        <th>이름</th>
		        <th>가입일</th>
		        <th>최종 접속일</th>
		        <th>연락처</th>
		        <th>이메일</th>
		        <th></th>
		      </tr>
		    </thead>
	    <tbody>
	      <tr>
	        <td>acbs123</td><!-- db에 있는 값 가져오기 -->
	        <td>홍길동</td>
	        <td>21-03-25</td>
	        <td>21-05-13</td>
	        <td>010-1234-5678</td>
	        <td>abcde123@naver.com</td>
	      </tr>
	      <tr>
	      	<td><button type="button" class="btn btn-outline-primary" id="" onclick="">탈퇴</button></td>
	      </tr>
	    </tbody>
	  </table>
	</div>
		
		<div class="rentalStatus">
			<h2>대여현황</h2>
		</div>
		
		<div class="container">        
	   		<table class="table table-striped">
	    	<thead>
		      <tr>
		        <th>상품번호</th>
		        <th>상품명</th>
		        <th>상품가격</th>
		        <th>대여일자</th>
		        <th>반납일자</th>
		        <th>반납여부</th>
		      </tr>
		    </thead>
	    <tbody>
	    	<c:choose >
		    	<c:when test="#">
		    		<tr>
				        <td>123</td><!-- db에 있는 값 가져오기 -->
				        <td>[삼성전자] 갤럭시 노트9</td>
				        <td>4000원</td>
				        <td>21-05-13</td>
				        <td>21-05-25</td>
				        <td>대여중</td>
		    		</tr>
		    	</c:when>
		    	<c:otherwise>
		    		<tr>
		    			<td colspan="6" style="text-align: center;"><h3>대여물품 없음</b></h3> </td>
		    		</tr>
		    	</c:otherwise>
	    	</c:choose>
		      
	      
	    </tbody>
	  </table>
	</div>
		
		
	
		
		
		
		
	</div>
	
</div>
</section>
<jsp:include page="../footer.jsp" />
</body>
</html>





































