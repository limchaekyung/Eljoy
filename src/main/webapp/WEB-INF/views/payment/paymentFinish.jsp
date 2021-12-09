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
    </style>
</head>
<body>
    <c:import url="../header.jsp"/>
          <div align="center">
          	<table style="align:center">
      			<tr>
      				<td style="text-align:center; font-size:17px; font-weight:bold;">주문이 완료되었습니다.</td>
      			</tr>
      			<tr>
      				<td style="text-align:center; font-size:17px; font-weight:bold;">
      					주문번호는 <a href="/stu/my_detail.do?order_no=${map.ORDER_NO }">${map.ORDER_NO }</a>입니다
      				</td>
      			</tr>
      		</table>
          </div>
          <br><br>
           
            <div style="text-align:center">
          		<input type="button" name="main" value="메인으로" onClick="location.href='${contextPath}/main'">
            	<input type="button" name="myPage" value="주문확인" onclick="location.href='${contextPath}/mypage/myPage">
            </div>
        
    <c:import url="../footer.jsp"/>
        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
	
</body>
</html>