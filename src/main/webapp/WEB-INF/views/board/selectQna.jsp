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
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style type="text/css">
	section#container { padding: 20px 0; border-top: 2px solid #eee; border-bottom: 2px solid #eee; }
 	section#container::after { content: ""; display: block; clear: both; }
	aside { float: left; width: 200px; padding: 0 0 0 5px; }
 	div#container_box { float: right; width: calc(100% - 200px - 20px); }
 	aside ul li { margin-bottom: 10px; list-style: none; }
 	#first {display: none;}
 	aside ul li { margin-bottom: 10px; list-style: none; }
 	aside { float: left; width: 200px; padding: 0 0 0 10px; }
</style>
</head>
<body>

	<c:import url="../header.jsp"/>	
	<aside>
		<jsp:include page="../aside.jsp" />						
	</aside>
	<section id="container">
		<div id="container_box">
		<h3>${ selectQna.member_id } 님의 문의글</h3>
			<form action="" method="post" enctype="multipart/form-data">
			<input type="hidden" value="${ selectQna.enquiry_no }"/>
				<b>작성자</b>
				<input type="text" name="member_id" value="${ selectQna.member_id }" readonly><hr> <!-- 읽기 전용, 수정 불가 -->
				<b>제목</b><br>
				<input type="text" name="enquiry_subject" size="80" value="${ selectQna.enquiry_subject }" readonly><hr>
				<b>내용</b><br>
				<textarea rows="10" cols="80" name="enquiry_content" readonly>${ selectQna.enquiry_content }</textarea><hr>
			
			</form>
				<c:if test="${ login == selectQna.member_id }"><!-- ${login == user } 이용자 로그인 시 수정,삭제보여줌 -->
					<input type="button" value="수정" onclick="location.href='${ contextPath }/board/modifyForm?enquiry_no=${ selectQna.enquiry_no }'">
					<input type="button" value="삭제" onclick="location.href='${ contextPath }/board/deleteQna?enquiry_no=${ selectQna.enquiry_no }'">
				</c:if>
				<c:if test="${ login == 'admin' }"><!-- ${login == admin } 관리자 로그인시 답글달기 보여줌 -->
					<c:if test="${RepList.eReplyCheck == 1 }">
						<input type="button" value="답변보기" onclick="slideClick()">
					</c:if>
					<c:if test="${RepList.eReplyCheck != 1 }">
						<input type="button" value="답변등록" onclick="slideClick()">
					</c:if>
				</c:if>
				<input type="button" value="리스트로 돌아가기" onclick="location.href='${ contextPath }/board/qna'"><br><br>
				
			<!-- 답글보기 -->
			<c:choose>
				<c:when test=""> <!-- ${login == user && RepList.eReplyCheck == 1} -->
					<div id="reply">
						<input type="hidden" value="${ selectQna.enquiry_no }"/>
						<b>담당자</b><br><br>
						<textarea rows="10" cols="50" name="eReplyContent" readonly="readonly">${RepList.eReplyContent }</textarea><br>
					</div>
				</c:when>
				<c:otherwise>
				
				</c:otherwise>
			</c:choose>
			
			<!-- 관리자 로그인시 답글 달기 -->
			<div id="first">
				<form id="frm" action="${contextPath }/replyModify" >
					<input type="hidden" name="enquiryReplyNo" value="${ selectQna.enquiry_no }"/>
					<b>담당자</b><br><br>
				<c:if test="${RepList.eReplyCheck == 1 }"><!-- 답변 있을때 수정 -->
					<textarea rows="10" cols="50" name="eReplyContent">${RepList.eReplyContent}</textarea><br>
					<input type="submit" value="수정">
					<input type="button" onclick="slide_hide()" value="닫기">
				</c:if>
				<c:if test="${RepList.eReplyCheck != 1 }"><!-- 답변 없을때 등록 -->
					<textarea rows="10" cols="50" name="eReplyContent">${RepList.eReplyContent }</textarea><br>
					<input type="button" onclick="rep()" value="답변등록">
					<input type="button" onclick="slide_hide()" value="취소">
				</c:if>
				</form>
			</div>
			
		</div>
	</section>
	<c:import url="../footer.jsp"/>
	S
	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>

	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
<script type="text/javascript">
	function slideClick() {
		$("#first").slideDown('slow') // 보여주는거 아래로 슬라이드 형식으로.천천히
		
	}
	function slide_hide() {
		$("#first").slideUp('fast') // 취소 누르면 없어지는거
		
	}
	function rep() { //답글 달기
		let form = {} // key와 value 형태로 만들기 위해서 object 형태로 만듬
		let arr = $("#frm").serializeArray() // 해당 id(id="frm") 안에 내용을 배열 형태로 가져옴
		// arr에 key로는 "#frm"의 name(name="enquiryReplyNo")이 들어옴, value는 value="${ selectQna.enquiry_no }"들어옴
		for(i=0;i<arr.length;i++){
			// from에  key    =    value
			form[arr[i].name] = arr[i].value // key와 value를 가진 form을 json형태로 보내주기
		}
		$.ajax({
			url : "addReply",
			type : "POST",
			dataType : "json",
			data : JSON.stringify(form), //form을 json 형태로 보내줌(자바스크립트 형태의 form을 json형태(문자열 형태))
			contentType : "application/json; charset=utf-8", //return type json타입으로 돌려준다 한글처리는 utf-8
			success : function (list) {
				alert('성공적으로 답글이 달렸습니다');
				slide_hide()
				replyData()// 답글 단 후 바로 그 페이지에서 답글 단 것을 볼수있게 하기 위해서
				
				
			},
			erorr : function () {
				alert('문제가 발생했습니다')
			}
		})
	}
	
	
	
	
</script>
</html>