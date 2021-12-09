<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- 글 입력 창 -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>



    
    
<style type="text/css">
	.wrap{width: 1200px;height: 800px; margin: 0px 0 0 140px;}
	.t{width: 1500px;  margin: auto;}
	.subTitle{margin-left: 450px; font-size: 40px;}
	.iTitle{margin: 20px 0 0 100px; height: 20px; }
	/* .#ProName{margin: 100px 0 0 500px} */

	.inpuptTile{width: 400px;}
	.t{width: 1500px;   margin: auto; }
	.category1{margin: 20px 0 0 48px; border: 1px solid black;}
	.category2{margin: 40px 0 0 48px; border: 1px solid black;}
	
	.thumbnail{width:150px; height:200px; margin: -400px 0 0 900px;}
	
	
	.summernote1{width: 1000px;   margin: 180px 0 0 100px;}
	
	.file{margin: 0 0 0 100px;}
	
	.button{margin: 10px 0 0 900px;height: 900px;}
	#ok{font-size: 16px;}
	#cancel{font-size: 16px;}
	aside ul li { margin-bottom: 10px; list-style: none; }
 	aside { float: left; width: 200px; padding: 0 0 0 10px; }
</style>
<!-- summernote 사용 시 필요한 js 파일 추가 -->
<script src="${contextPath}/resources/summernote/js/mySummernote.js"></script>
<script type="text/javascript">
	//summernoet
	//$(document).ready(function() { /* 이거 없으면 summernote 없어짐 */
	  //$('#summernote').summernote();
	//});
	
	
	// 취소버튼
	function removeCheck() {
		 if (confirm("수정을 취소하시겠습니까?") == true){    //확인
			 location.href='adminProductList'
		 }else{   //취소
		     return false;
		 }
		}

	//사진 업로드
	function readURL(input) {
		var file = input.files[0] // 파일에 대한 정보를 가지고 잇음
		if(file !=''){
			var reader = new FileReader() //첨부 사진 파일 읽기 위해
			reader.readAsDataURL(file) //파일의 정보를 토대로 파일을 읽고
			reader.onload = function(e) { //파일 로드한 값을 표현
				//e : 이벤트 안에 result값이 파일의 정보를 가지고 있다
				$("#preview").attr('src', e.target.result)
			}
		}
			
	}
	// 이미지 영역을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
	   $(function(){
	      $("#fileArea").hide(); // #fileArea 요소를 숨김.      
	      
	      $(".boardImg").on("click", function(){ // 이미지 영역이 클릭 되었을 때
	         
	         // 클릭한 이미지 영역 인덱스 얻어오기
	         var index = $(".boardImg").index(this);
	               // -> 클릭된 요소가 .boardImg 중 몇번째 인덱스인지 반환
	               
	         //console.log(index);
	         
	         // 클릭된 영역 인덱스에 맞는 input file 태그 클릭
	         $("#img" + index).click();
	      });
	      
	   });

	   
	  
	  // 각각의 영역에 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 함수
	  function LoadImg(value, num) {
	     // value.files : 파일이 업로드되어 있으면 true
	     // value.files[0] : 여러 파일 중 첫번째 파일이 업로드 되어 있으면 true
	     
	      if(value.files && value.files[0]){ // 해당 요소에 업로드된 파일이 있을 경우
	         
	         var reader = new FileReader();
	      // 자바스크립트 FileReader
	     // 웹 애플리케이션이 비동기적으로 데이터를 읽기 위하여 
	     // 읽을 파일을 가리키는 File 혹은 Blob객체를 이용해 
	     // 파일의 내용을 읽고 사용자의 컴퓨터에 저장하는 것을 가능하게 해주는 객체
	     
	     reader.readAsDataURL(value.files[0]);
	    // FileReader.readAsDataURL()
	     // 지정된의 내용을 읽기 시작합니다. 
	     // Blob완료되면 result속성 data:에 파일 데이터를 나타내는 URL이 포함 됩니다.   
	     
	     reader.onload = function(e){
	       // FileReader.onload
	            // load 이벤트의 핸들러. 
	            // 이 이벤트는 읽기 동작이 성공적으로 완료 되었을 때마다 발생합니다.   
	        
	            // 읽어들인 내용(이미지 파일)을 화면에 출력
	            
	            $(".boardImg").eq(num).children("img").attr("src", e.target.result);
	            // e.target.result : 파일 읽기 동작을 성공한 요소가 읽어들인 파일 내용
	            
	     }
	      }
	   }
	function productSave() {
		location.href='productModify'
	}
//	var no = ${productView.productNum}; 
//	console.log(no);
	
	
</script>
</head>
<body>
<jsp:include page="../header.jsp" />
<aside>
	<jsp:include page="../aside.jsp" />						
</aside>
<div class="t">

	
<div class="wrap">
	<h1 class="subTitle" >상품</h1>
	<form action="${contextPath }/adminProduct/adminProductModify" method="post" enctype="multipart/form-data">
		<div class="iTitle">
			글제목<br>
			<input type="text" name=productTitle class="inpuptTile" style="border: 2px solid skyblue; border-radius: 5px;"  value="${productView.productTitle }">
		</div>
		
		<div id="ProName" style="margin: 50px 0 0 100px;">
			상품명<br>
			<input type="text" name="productName" class="inpuptTile" style="border: 2px solid skyblue; border-radius: 5px;"  value="${productView.productName }">
		</div>
		
		<div>
			<select name="productCategory" class="category1" style="border: 2px solid skyblue; border-radius: 5px;" >
				<option value="0">카테고리
				<option value="휴대폰" <c:if test="${productView.productCategory=='휴대폰'}"> selected </c:if>>휴대폰
				<option value="스마트워치" <c:if test="${productView.productCategory=='스마트워치'}"> selected </c:if>>스마트 워치
				<option value="블루투스 이어폰" <c:if test="${productView.productCategory=='블루투스 이어폰'}"> selected </c:if>>블루투스 이어폰
				<option value="태블릿PC" <c:if test="${productView.productCategory=='태블릿PC'}"> selected </c:if>>태블릿PC
			</select>
		</div>
		
		<div>
			<select name="productCompany" style="border: 2px solid skyblue; border-radius: 5px;" class="category2">
				<option value="0">제조사
				<option value="삼성" <c:if test="${productView.productCompany=='삼성'}"> selected </c:if>>삼성
				<option value="LG" <c:if test="${productView.productCompany=='LG'}"> selected </c:if>>LG
				<option value="apple" <c:if test="${productView.productCompany=='apple'}"> selected </c:if>>apple
			</select>
		</div>
		<div>
		<select name="productPeriod" class="category2" style="border: 2px solid skyblue; border-radius: 5px;">
            <option value="3일" <c:if test="${productView.productPeriod=='3일'}"> selected </c:if>>3일
            <option value="7일" <c:if test="${productView.productPeriod=='7일'}"> selected </c:if>>7일
            <option value="1개월" <c:if test="${productView.productPeriod=='1개월'}"> selected </c:if>>1개월
         </select>
      </div>
		
		<div style="margin: 50px 0 0 900px;">
			상품코드<br>
			<input type="text" name="productNum" style="border: 2px solid skyblue; border-radius: 5px;" value="${productView.productNum}" readonly="readonly">
		</div>
		
		<div style="margin: -90px 0 0 100px;">
			상품가격<br>
			<input type="text" name="productPee" style="border: 2px solid skyblue; width:200px; border-radius: 5px;"  value="${productView.productPee }">원
		</div>
		
		<div style="margin: 10px 0 0 100px; height: 100px;">
			상품수량<br>
			<input type="text" name="productQuantity" style="border: 2px solid skyblue; width:200px; border-radius: 5px;"  value="${productView.productQuantity }">개
		</div>
		<%-- <div class="thumbnail" >
			<img alt="선택된 이미지 없음" src="${contextPath}/adminProduct/download?productThumbnail=${productView.productThumbnail}" id="preview" style="width:150px; height:200px;">
			<input type="file" name="productThumbnail" onchange="readURL(this);">
		</div> --%>
		
	
		 
	    	<c:set var="src" value="${contextPath}${productImgView.filePath}/${productImgView.fileName}"/>
				<div class="thumbnail">
		            <div class="form-inline mb-2">
		               <label class="input-group-addon mr-3 insert-label">썸네일</label>
		               <div class="boardImg" id="titleImgArea">
		                  <img id="titleImg" width="200" height="200" src="${src}">
		               </div>
		            </div>
		         </div>
        
        
         <!-- 파일 업로드 하는 부분 -->
         <div id="fileArea">
            <input type="file" id="img0" name="images" onchange="LoadImg(this,0)"> 
         </div>
         
		
		<div class="summernote1">
			<textarea rows="5" cols="5" id="summernote" name="productContent" placeholder="내용작성" >${productView.productContent }</textarea>
		</div>
		
		
		<div class="button">
			<input type="submit" value="수정" class="btn btn-outline-primary" id="ok">
			<button type="button" class="btn btn-outline-primary" id="cancel" onclick="removeCheck()">취소</button>
		</div>
		
	</form>
</div>	
	</div>
<div style="margin-top: 100%">
<c:import url="../footer.jsp"/>
</div>
	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>

	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
</html>




































