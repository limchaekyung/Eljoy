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
</head>
<body>
		<!-- Footer-->
        <footer style="background-color: #5282e1;">
        <div class="text-center">
        	<div class="m-0 text-start text-white" style="float: left; width: 50%; padding: 30px 0 30px 30px; font-size: 20px">
        		EL_JOY(주)<br>
				대표이사 : @@@, 주소 : 서울 종로구 돈화문로 26 단성사 4층, Tel : 1599-0110<br>
				사업자등록번호 : 123-45-67890, 통신판매업신고 : 2021-서울종로구-0707<br>
				<span style="font-size: 15px">Copyright &copy; Your Website 2021</span>
        	</div>
	        <div class="m-0 text-end text-white" style="float: right; width: 50%; padding: 30px 30px 30px 0; font-size: 20px">
	        	고객센터 <span style="color: yellow;"><b>02-3672-6900</b></span><br>
	        	서울 종로구 돈화문로 26 단성사 4층<br>
	        	Fax : 02-1111-2222 / E-mail : abc@gmail.com<br>
	        	<a href="${ contextPath }/board/faq" style="color: yellow; text-decoration: none;">고객센터 바로가기 ></a>
	        </div>
        </div>
            <div class="container" style="clear: both;">
            	<p class="m-0 text-center text-white" style="font-size: 20px"></p>	
            </div>
        </footer>
        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
</body>
</html>