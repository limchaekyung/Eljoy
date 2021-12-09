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
	aside { float: left; width: 200px; padding: 0 0 0 10px; }
 	div#container_box { float: right; width: calc(100% - 200px - 20px); }
 	aside ul li { margin-bottom: 10px; list-style: none; }
 	nav ul li { padding:0 20px 0 0px; }
 	
	.container_test { width: 80%; position: relative; }
	.gnb_test { background: #D5D5D5; padding-left: 10px; padding: 10px; }
	.gnb_test > li { display:inline-block; margin-right:10px; }
	.gnb_test > li > a { display: block; padding: 0 10px; line-height: 25px; color: black; text-decoration: none;}
	.gnb_test > li > a:hover,
	.gnb_test > li.on a { background: #D5D5D5; }
	.contents_test { border: 1px solid #bbb; padding: 10px; }
	.contents_test p { font-weight: bold; }
	
	ul.faq li { list-style: none; }
	ul.faq li p { display: none; }

	.fold_list {border:1px solid #ccc; border-bottom:0;}
	.fold_list > li {border-bottom:1px solid #ccc; list-style: none;}
	.fold_list > li > a {background:#f2f2f2; display:block; padding:10px 20px; color: black; text-decoration: none;}
	.fold_list > li > div {border-top:1px dashed #ccc; padding:10px 20px; display:none;}

	.tab {position:relative; padding-top:31px;}
	.tab>li>a {
	    display:block;
	    position:absolute;
	    top:0;
	    width:95px;
	    height:30px;
	    line-height:30px;
	    text-align:center;
	    background:#eee;
	    color:#555;
	    border:1px solid #767676;
	    border-bottom:0;
	}
	.tab>li.on>a {background:#767676; color:#fff;}
	.tab>li:first-child>a {left:0;}
	.tab>li+li>a {left:100px;}
	.tab>li+li+li>a {left:200px;}
	.tab>li>div {height:0; overflow:hidden; position:absolute; list-style: none;}
	.tab>li.on>div {height:auto; position:static; border:1px solid #767676; padding:10px;}


</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

</head>
<body>
	<c:if test="${login == 'admin' }">
<jsp:include page="../adminHeader.jsp" />
</c:if>
<c:if test="${login != 'admin' }">
<jsp:include page="../header.jsp" />
</c:if>
	<section id="container">
		<aside>
			<c:import url="../aside.jsp"/>
		</aside>
		
		<div id="container_box">
		<h3>자주하는 질문</h3>
		<c:if test="${login == 'admin' }"> <!-- 괸리자 로그인 하면 등록, 수정 버튼 생김 -->
			<input type="button" value="등록" onclick="location.href='${contextPath}/boardInput/faqForm'">
		</c:if>
			<div>
				<div class="container_test">
				    <ul class="gnb_test">
				    	<li><a href="#" value="0">회원/정보관리</a></li>
				        <li><a href="#" value="1">주문/결제</a></li>
				        <li><a href="#" value="2">배송</a></li>
				        <li><a href="#" value="3">취소/환불</a></li>
				        <li><a href="#" value="4">반품/교환</a></li>
				    </ul>
				    <div class="contents_test">
						<p class="faq_group" id="faq_group">전체</p>
						<ul class="fold_list">
							<c:forEach var="dto" items="${ allFaq }">
							<input type="hidden" name="faq_no" value="dto.faq_no">
								<li>
									<a href="#" title="View Detail" id="faq_subject" class="faq_subject">${ dto.faq_subject }</a>
									<div id="faq_content" class="faq_content">
										${ dto.faq_content }
										<c:if test="${login == 'admin'}"><br><br>
											<input type="button" value="수정" class="btn btn-secondary insert-place" onclick="location.href='${contextPath}/boardInput/faqModifyView?faq_no=${dto.faq_no}'">
											<input type="button" value="삭제" class="btn btn-secondary insert-place" onclick="location.href='${contextPath}/faqDelete?faq_no=${dto.faq_no}'">
										</c:if>
									</div>
								</li>
							</c:forEach>		
						</ul>
				    </div>
				</div>
				
				<script type="text/javascript">
					$( document ).ready(function() {
						$( ".gnb_test > li > a" ).click(function() { 
						    if($(this).parent().hasClass("on")){
						        $(".gnb_test > li").removeClass("on");
						        $(".contents_test").css("margin-top","0");
						        
						    }
						    else {
						        $(this).parent().addClass("on").siblings().removeClass("on");
						        $(".contents_test").css({"margin-top":($(this).next().height())+"px"});
						    }
						    console.log($(this).attr("value"));
						    
						    if($(this).attr("value") == 0) {
						    	$(".faq_group").text("회원/정보관리");
						    } else if($(this).attr("value") == 1) {
						    	$(".faq_group").text("주문/결제");
						    } else if($(this).attr("value") == 2) {
						    	$(".faq_group").text("배송");
						    } else if($(this).attr("value") == 3) {
						    	$(".faq_group").text("취소/환불");
						    } else if($(this).attr("value") == 4) {
						    	$(".faq_group").text("반품/교환");
						    }  
						    
						    $.ajax({
								url : "allFaq/"+$(this).attr("value"),
								type : "POST", dataType : "json",
								success : function(list) {
									let html = ""
									$.each(list, function(index, item) {
										html += "<li><a href='#' title='View Detail'>" + item.faq_subject + "</a>"
										html += "<div>" + item.faq_content
										html += "<c:if test='${login == admin}'>" + "<br><br>" //관리자 세션이면 버튼 생기고 유저 세션이면 버튼 안보임
										html += "<button onclick=" + "\"location.href='${contextPath}/boardInput/faqModifyView?faq_no=" + item.faq_no + "'\"" + "class=\"btn btn-secondary insert-place\"" +">" + "수정" + "</button>"
										html += "<button onclick=" + "\"location.href='${contextPath}/faqDelete?faq_no=" + item.faq_no + "'\""+ "class=\"btn btn-secondary insert-place\"" + ">" + "삭제" + "</button>" 
										html += "</c:if>" + "</div></li>"
										$(".fold_list").html(html);
										
										$(".fold_list>li>a").click(function() {
										    $(this).next("div").slideToggle().parent("li").siblings().children("div").hide();
										    $("body,html").animate({scrollTop: $(this).offset().top}, 500);
										    return false;
										});
									}); 
								}, error : function() { alert('문제 발생') }
							});
						    return false;
						});
					});
					
					$(".fold_list>li>a").click(function() {
					    $(this).next("div").slideToggle().parent("li").siblings().children("div").hide();
					    $("body,html").animate({scrollTop: $(this).offset().top}, 500);
					    return false;
					});
				</script>
			</div>
		</div>
	</section>
	<c:import url="../footer.jsp"/>
	
	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>

	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
</html>