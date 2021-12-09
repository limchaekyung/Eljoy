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
	section#container { padding:20px 0; border-top:2px solid #eee; border-bottom:2px solid #eee; }
 	section#container::after { content:""; display:block; clear:both; }
	aside { float:left; width:200px; }
 	div#container_box { float: right; width:calc(100% - 200px - 20px); }
 	aside ul li { margin-bottom:10px; list-style:none;}
</style>
</head>
<body>

	<c:import url="../header.jsp"/>	
	<section id="container">
		<aside>
			<c:import url="../aside.jsp"/>				
		</aside>
		<div id="container_box">
			<h2>본문영역</h2>
		</div>
	</section>
	<c:import url="../footer.jsp"/>

</body>
</html>