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
	.t{width: 1500px; height: 1000px;  margin: auto;}
	.wrap{width: 900px;height: 800px; margin: 0px 0 0 300px;}
	aside ul li { margin-bottom: 10px; list-style: none; }
 	aside { float: left; width: 200px; padding: 0 0 0 10px; }
</style>
<script type="text/javascript">
	function removeCheck() {
	 if (confirm("작성을 취소하시겠습니까?") == true){    //확인
		 location.href='${contextPath}/board/notice'
	 }else{   //취소
	     return false;
	 }
	}
</script>
</head>
<body>
<jsp:include page="../header.jsp" />
<aside>
	<jsp:include page="../aside.jsp" />						
</aside>
<div class="t">

	
	<div class="wrap">
		
		<form action="${contextPath}/noticeSave">
			<table style="border-collapse: separate; border-spacing: 0 15px;">
				<tr>
					<th><h2>공지사항</h2></th>
				</tr>
				
				<tr>
					<th>공지분류</th>
					<td>
						<div>
							<select name="notice_group" class="category2">
								<option value="0">공지분류
								<option value="[일반공지]">[일반공지]
								<option value="[당첨발표]">[당첨발표]
							</select>
						</div>
					</td>
				</tr>
				
				<tr>
					<th>공지제목</th>
					<td>
						<input type="text" style=" width: 740px;" name="notice_title">
					</td>
				</tr>
				
				<tr>
					<th>공지내용</th>
					<td>
						<textarea rows="10" cols="100" name="notice_content"></textarea>
					</td>
				</tr>		
			</table>
			<div style="margin: -20px 0 0 362px;">
				<button type="submit" class="btn btn-outline-primary" id="" style="margin: 10px 0 0 380px;">등 록</button>
				<button type="button" class="btn btn-outline-primary" id="" onclick="removeCheck()" style="margin: 10px 0 0 0px;" >취 소</button>
			</div>
			
		</form>
	</div>
</div>


<c:import url="../footer.jsp"/>
	
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>

</body>
</html>
























