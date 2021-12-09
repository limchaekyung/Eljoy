<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
rel="stylesheet" type="text/css" />
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요한) -->
<script src="http://code.jquery.com/jquery.js"></script>
<!-- 모든 합쳐진 플러그인을 포함하거나 (아래) 필요한 각각의 파일들을 포함하세요 -->
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<script type="text/javascript">
	$(function(){
	var getName= RegExp(/^[가-힣]+$/);
	var getEmail=RegExp(/^[a-zA-Z0-9]{1,}$/);
	var getEmail2=RegExp(/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i);
	
	var chk1 = false, chk2 = false, chk3=false;
	
	//이름 입력값 검증.
	$('#name').on('keyup', function() {
		//이름값 공백 확인
	if($("#name").val() == ""){
	    $('#name').css("background-color", "pink");
		$('#nameChk').html('<b style="font-size:16px;color:red;">[이름은 필수정보에요!]</b>');
		chk1 = false;
	}	
	//이름값 유효성검사
	else if(!getName.test($("#name").val())){
	    $('#name').css("background-color", "pink");
		$('#nameChk').html('<b style="font-size:16px;color:red;">[이름을 정확히 입력해주세요]</b>');
		chk1 = false;
	} else {
	//$('#name').css("background-color", "aqua");
		$('#name').css("background-color", "transparent");
		$('#nameChk').html('');
		$.ajax({
			type: "post", dataType:"json",  
			url: "/root/member/id_name",
			data: {
				"user_name": $('#name').val()
			},
			success: function(data){
				if($.trim(data.result)=="success")
					chk1=true;
				else
					chk1=false;
			}
		});
	}//이름
	});
	
	//이메일1
	$('#email1').on('keyup',function(){
		if($('#email1').val() == ""){
			$('#emailChk').html('<b style="font-size:16px;color:red;">[이메일은 필수입니다]</b>');
			chk2=false;
		}else if(!getEmail.test($('#email1').val())){
			$('#emailChk').html('<b style="font-size:16px;color:red;">[이메일을 확인해주세요]</b>');
			chk2=false;
		}else{
			$('#emailChk').html('');
			chk2=true;
		}
	});
	
	//이메일2
	$('#email_select').change(function(){
		var email2=$('#email_select').val();
		//getEmail
		if($('#email2').val()=="")
			chk3=false;
		if(email2==1){
			$('#email2').attr("readonly",false);
			$('#email2').val("");
			chk3=false;
		}else{
		$('#email2').val(email2);
		$('#email2').attr("readonly",true);
		$('#emailChk').html('<b style="font-size:16px;color:red;"></b>');
		chk3=true;}
	});//이메일2
	
	//이메일 직접입력
	$('#email2').change(function(){
		var email2=$('#email2').val();
		
		if($('#email2').val()==""){
			chk3=false;
			$('#emailChk').html('<b style="font-size:16px;color:red;">[이메일은 필수입니다]</b>');
		}else if(!getEmail2.test($('#email2').val())){
			$('#emailChk').html('<b style="font-size:16px;color:red;">[이메일을 확인해주세요]</b>');
			chk3=false;
		}else{
			chk3=true;
			$('#emailChk').html("");
	}
	});
	
	$('#btn').click(function(e) {
		if(!chk1)
			alert('일치하는 이름이 없습니다');
		else if(chk1 && chk2 && chk3) {		
		var n=$("#name").val();
		var e1=$("#email1").val();
		var e2=$("#email2").val();
		var form={ user_name:n, user_email1:e1, user_email2 : e2 }
				$.ajax({
					url : "id_find", type : "POST",
					data : JSON.stringify(form),
					dataType: 'json',//return type
					contentType: "application/json; charset=utf-8",
					success: function(result){
						 var url = "id_popup";
				         var name = "popup test";
				         var option = "width = 500, height = 500, top = 100, left = 200, location = no"
				       	 window.open(url, name, option);
					}
				});
				//e.preventDefault();
			//	$('#find').submit();
				//success : function(result){
				/////	alert("성공");
				//}
			//} 
		} else {
			alert('입력정보를 다시 확인하세요.');			
		}
	});
});
</script>
<style type="text/css">
	#btn{ color:blue; background-color: white;}
	#btn:hover{ background-color:white; opacity: 0.5; color:blue;}
	.id{font-size: 25px;}
	.id a{ color:blue;text-decoration: none; }
	.id:checked {color: blue;}
	.pw{font-size: 25px; color:black;}
	.pw a{color:black;text-decoration: none;}
	#find{width:545px; height:400px; border:1px solid gray; margin-left: 50px; padding-left: -65px; padding-right: 10px;}
	#a{ padding: 20px; border-bottom: medium;}
	#b{ padding: 20px;}
	.form-group{width: 480px; padding: -50px;padding-left: -80px;}
</style>
</head>
<body style="background-color: rgba(0,0,0,0.05) ">
<%@ include file="../header.jsp" %><br>
<hr>
	<form class="form-horizontal" id="find" role="form" method="post" 
		action="id_find" style="padding-left: 80px; margin: 0 auto;">
		<div style="margin:0 auto; padding: 10px;"> 
		 <span id="a"><b class="id"><a href="id_find">아이디 찾기</a></b></span>
		|<span id="b"><b class="pw"><a href="pw_find"> 비밀번호 찾기</a></b></span>
		<hr style="width:180px;height: 4px; color: blue;">
		</div>
		<div class="form-group" id="divName" style="margin: 0 auto;">
			<label for="inputName" class="col-lg-2 control-label">이름</label>
			<div class="col-lg-10">
				<input type="text" class="form-control onlyHangul" id="name"
					name="user_name" data-rule-required="true" 
					placeholder="한글만 입력 가능합니다." maxlength="15" style="width: 280px;">
			</div>
			<span id="nameChk" style="padding: 0 0 0 15px;"></span>
		</div>
		<div class="form-group" id="divEmail">
			<label for="inputEmail" class="col-lg-2 control-label">이메일</label>
			<div class="col-lg-10">
				<!--input type="email" class="form-control" id="email" data-rule-required="true" placeholder="이메일" maxlength="40"-->
				<input type="text" id="email1" name="user_email1" size="15">
				@ <input type="text" name="user_email2" id="email2" size="15"
					readonly="readonly"> <select name="email3" class="box"
					id="email_select">
					<option value="" selected>선택하시오</option>
					<option value="naver.com">naver.com</option>
					<option value="hotmail.com">hotmail.com</option>
					<option value="hanmail.com">hanmail.com</option>
					<option value="yahoo.co.kr">yahoo.co.kr</option>
					<option value="gmail.com">gmail.com</option>
					<option value="1">직접입력</option>
				</select><br> <span id="emailChk"></span><br>
			</div>
		</div>
		<div class="form-group">
			<div class="col-lg-offset-2 col-lg-10">
				<button type="button" class="btn btn-primary" id="btn"
					style="width: 285px; height: 50px;">인증번호 받기</button>
			</div>
		</div>
	</form>
	<hr>
	<%@ include file="../footer.jsp" %><br>

</body>
</html>