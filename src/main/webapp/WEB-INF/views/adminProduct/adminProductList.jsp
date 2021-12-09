<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">



<style type="text/css">
	.wrap{width: 1200px;height: 400px; margin: 20px 0 0 200px;}
	.button{margin: 0 0 0 900px;}
	.container{margin-top: 20px;}
	#b3{margin-top: 10px; margin-left: 10px;}
	.t{width: 1500px; height: 1000px;  margin: auto;}
	#a{width: 60px; text-align: center; color: black;}
	/* a:link{text-decoration:none; color: black;} */
	
	aside ul li { margin-bottom: 10px; list-style: none; }
 	aside { float: left; width: 200px; padding: 0 0 0 10px; }
</style>

</head>
<body>
<jsp:include page="../adminHeader.jsp" />

<aside>
	<jsp:include page="../aside.jsp" />						
</aside>
<div class="t">

<div class="wrap">

	<h3>상품관리</h3>
	<div class="button">
		<%-- <button type="button" class="btn btn-outline-primary" id="b1" onclick="${contextPath }/adminProduct/adminProductDelete?productNum=${dto.productNum}">선택삭제</button>
		<button type="button" class="btn btn-outline-primary" id="b2" onclick="">전체삭제</button> --%>
	</div>
	
	<div class="container">    
		
	 	 <table class="table table-striped">
	   	 <thead>
	      <tr style="text-align: center;">
	      	<th><input type="checkbox" name="allCheck" id="allCheck"></th>
	        <th>상품번호</th>
	        <th>상품명</th>
	        <th>상품가격</th>
	        <th>등록일자</th>
	      </tr>
	      <c:if test="${adminProductList.size() ==0 }">
	      	<tr><td colspan="5">등록된 글이 없습니다</td></tr>
	      </c:if>
	    </thead>
	    <tbody>
	    <c:forEach var="dto" items="${adminProductList }">
	      <tr style="text-align: center;">
	      	<td><input type="checkbox" class="choice" name="choice" id="choice" value="${dto.productNum}"></td>
	        <td width="100px;">${dto.productNum }</td>
	        <td width="400px;"><a href="${contextPath }/adminProduct/adminProductView?productNum=${dto.productNum}">${dto.productTitle }</a></td>
	        <td>${dto.productPee }</td>
	        <td>${dto.productDate }</td>
	        <%-- <td>
	        <c:if test="${dto.productNum == productImgView.parent_board_no }">
	        	<c:set var="src" value="${contextPath}${productImgView.filePath}/${productImgView.fileName}"/>
				<div class="thumbnail">
		            <div class="form-inline mb-2">
		               <label class="input-group-addon mr-3 insert-label">썸네일</label>
		               <div class="boardImg" id="titleImgArea">
		                  <img id="titleImg" width="100" height="100" src="${src}">
		               </div>
		            </div>
		         </div>
		    </c:if>
	        </td> --%>
	      </tr> 
	     </c:forEach>
	    </tbody>  	
	  </table>
	  
	  <div style="display: flex; margin: 0 0 0 0px; padding-bottom: 10px;">
   		<a href="${contextPath }/adminProduct/adminProductList?num=1" id="a" class="page-link"><<</a>
   		<c:if test="${prev }">
			<a href="${contextPath }/adminProduct/adminProductList?num=${prevPage}" id="a" class="page-link">이전</a>
		</c:if>
		<c:forEach var = "num" begin="${startPageNum }" end="${endPageNum }">	
			<span>
				<c:if test="${select != num }">
					<a href="${contextPath }/adminProduct/adminProductList?num=${num}" id="a" class="page-link">${num }</a>				
				</c:if>

				<c:if test="${select == num }">
					<a href="${contextPath }/adminProduct/adminProductList?num=${num}" id="a" class="page-link"><b>${num }</b></a>
				</c:if>
			</span>	
		</c:forEach>
		<c:if test="${next }">
			<a href="${contextPath }/adminProduct/adminProductList?num=${nextPage}" id="a" class="page-link">다음</a>
		</c:if>
		<a href="${contextPath }/adminProduct/adminProductList?num=${repeat }" id="a" class="page-link">>></a>
   	  </div>
   	  
	  <div style="margin: -43px 0 0 990px;">
	  	<button type="button" class="btn btn-outline-primary"  onclick="input()">상품등록</button>
		<input type="button" class="btn btn-outline-primary" id="b1" onclick="deleteValue();" value="선택삭제"/>
	  </div>
	  
	  <form action="${ contextPath }/adminProduct/adminProductSearch">
			<select name="ProductSearch_option">
	        	<option value="product_num"<c:if test="${ProductSearch_option eq 'product_num'}">selected</c:if>>상품번호</option>
	        	<option value=product_title<c:if test="${ProductSearch_option eq 'product_title'}"></c:if>>상품명</option>
	        	<option value=product_pee<c:if test="${ProductSearch_option eq 'product_pee'}">selected</c:if>>상품가격</option>
	        </select>
			   <input type="text" name="keyword" value="${keyword}">
			   <input type="submit" id="searchBtn" value="검색">
		</form>
	  
	  
</div>	
</div>
</div>
<jsp:include page="../footer.jsp" />
<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>

	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>


<script type="text/javascript">
	function input() {
		location.href='adminProductInput'
	}
	
	
    // 체크박스 전체해제 전체클릭
    $("#allCheck").click(function(){
   
    if($("#allCheck").prop("checked")){
      
        $("input[name=choice]").prop("checked",true);
    }else{
        $("input[name=choice]").prop("checked",false);
    }

    });

	//체크박스 하나 해제시 전체체크박스 해제
	$(document).on("click", "input[name=choice]", function(){
	
		var checkbox =$("input[name=choice]:checked");
		
		if($("input[name=choice]").length==checkbox.length){ 
		  
		    $("allCheck").prop("checked",true); 
		}else{ 
		   $('#allCheck').prop("checked",false); 
		} 
	
	});
	
	function deleteValue() {
		var url = "adminProduct/delete";
		var valueArr = new Array();
		var list = $("input[name=choice]");
		for (var i = 0; i<list.length; i++){
			if(list[i].checked){
				valueArr.push(list[i].value);
			}
		}
		if(valueArr.length ==0){
			alert("선택된 글이 없습니다")
		}
		else{
			var chk = confirm("정말 삭제 하시겠습니까?");
			$.ajax({
				url : "delete",
				type : 'POST',
				traditional : true,
				data : {
					valueArr : valueArr
				},
				success : function(jdata) {	
					console.log(jdata);
				
					location.href="adminProductList";
					 
				}
			})
		}
		
	}

	
	
</script>
</html>


























