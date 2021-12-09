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
	section {
    max-width: 1000px;
    margin: 0 auto;
	}
    .product_categ{
    width: 50%;
	height: 50px;
	z-index: 1000;
	background-color: #000;
	float: left;
    }
    .product_categ ul {
    list-style: none;
    text-align: center;
	}
	.product_categ ul li {
    margin: 0 3px;
    padding: 8px 15px;
    display:inline-block;
    
	}
	.product_categ ul li a {
    text-decoration: none;
    color: #fff;
    transition: all 0.25s;
	}
	.product_categ ul li a:hover {
    color: #0dcaf0;
    padding-bottom: 3px;
    border-bottom: 1px solid #0dcaf0;
	}
	.first-part {
    min-height: 500px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
	}
	.first-part h1 {
    text-align: center;
    font-size: 5em;
    transition: width 0.5s linear 0.2s;
    position: relative;
    animation: fadetop 3s;
	}
	.page .inner {
    min-height: 70vh;
    background-color: rgba(255, 255, 255, .95);
    padding: 1em 2em;
    color: #000;
	}
	#infoImg{
        max-width:400px;    
        box-shadow: 5px 5px 3px #aaaaaa; 
        float: left;
        margin-right: 10px;
    }
    </style>
</head>
<body>
    <c:import url="../header.jsp"/>
    <!-- Section-->
    <section>
   		<div class="row" id="top">
   			<h5>브랜드</h5>
   			<p>물품 이름</p>
			<div style="float: left; width: 33%;">
       		    <div>
       		    	<img src="${contextPath }/resources/images/1.png" id="infoImg" alt="물품사진">
       		    </div>
			</div> 
			<div style="float: left; width: 66%;">
			<table class="table">
           	    <tr>
           	        <th>물품 이름</th>
           	        <td>@@@</td>
           	    </tr>
              		<tr>
           	        <th>대여 기간</th>
           	        <td>
               	        <select class="form-control" name="qty">
               	            <option>1달</option>
               	            <option>2달</option>
               	            <option>3달</option>
               	        </select>
                   	</td>
               	</tr>
               	<tr>
            	       <th>포인트</th>
            	       <td>@@@</td>
            	   </tr>
            	   <tr>
            	       <th>대여료</th>
            	       <td>@@@원</td>
				</tr>
				<tr>
               	    <td colspan="2" class="text-center"><input type="submit" class="btn btn-outline-dark mt-auto"  value="구매하기"></td>
				</tr>
           	</table>
			</div>        
       	</div>
  <hr>
	<div class="row">
		<nav class="product_categ">
    		<div>
    			<ul>
    				<li>
    					<a href="#first">상품정보</a>
    				</li>
    				<li>
    					<a href="#second">리뷰</a>
    				</li>
    				<li>
    					<a href="#third">FAQ</a>
    				</li>
    			</ul>
    		</div>
    	</nav>
   	</div>
	<div>
		<div class="full-width back-image1 full-page page" id="first">
			<div class="wrap">
       			<h3>상품정보</h3>
        		<div class="inner">
        	    	<p>상품정보 상품정보</p>
        	        
       		    </div>
      		</div>
		</div>
		<div class="full-width back-image2 full-page page" id="second">
    		<div class="wrap">
            	<h3>리뷰</h3>
        		<div class="inner">
        			<p>리뷰 리뷰</p>
        	        
        		</div>
    	    </div>
    	</div>
		<div class="full-width back-image3 full-page page" id="third">
    		<div class="wrap">
        	    <h3>FAQ</h3>
        	    <div class="inner">
        	        <p>FAQ FAQ</p>
    	    	        
    	        </div>
    	    </div>
		</div>
	
	</div>   	
    	</section>
	<c:import url="../footer.jsp"/>
    
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/jquery.js"></script>
		<script src="js/smooth-scroll.polyfills.min.js"></script>
		<script src="js/script.js"></script>
		<script>
        	var scroll = new SmoothScroll('a[href*="#"]');
    	</script>
    	
    	<div style="position: fixed; bottom: 5px; right: 5px;">
    	<a href="#top"><img alt="top" src="${contextPath }/resources/images/top.png" style="width: 20%; height: auto;"></a>
    	</div>
    	
    	
    </body>
</html>
