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
	var getIdCheck= RegExp(/^[a-zA-Z0-9]{4,14}$/);
	var getName= RegExp(/^[가-힣]+$/);
	var getEmail=RegExp(/^[a-zA-Z0-9]{1,}$/);
	var getEmail2=RegExp(/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i);
	
	var chk1 = false, chk2 = false, chk3=false,chk4=false;
	
	$('#id').on('keyup',function(){
		if($("#id").val() == ""){
			$('#id').css("background-color", "pink");
			$('#idchk').html('<b style="font-size:16px;color:red;">[아이디는 필수 정보입니다]</b>');
			chk4=false;
		}
		else if(!getIdCheck.test($("#id").val())){
			$('#id').css("background-color", "pink");
			$('#idchk').html('<b style="font-size:16px;color:red;">[영문자,숫자 4-14자로 입력하시오]</b>');
			chk4=false;
		}else{
			$('#id').css("background-color", "transparent");
			$('#idchk').html('');
			chk4=true;			
		}
	});
	
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
		chk1 = true;
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
		if(chk1 && chk2 && chk3 && chk4) {
				e.preventDefault();
				$('#find').submit();			 
		} else {
			alert('입력정보를 다시 확인하세요.');			
		}
	});
	
	if(${chk=='success'}){
		 var url = "pw_popup";
         var name = "popup test";
         var option = "width = 500, height = 500, top = 100, left = 200, location = no"
       	 window.open(url, name, option);
	}
});
</script>
<style type="text/css">
	#btn{ color:blue; background-color: white;}
	#btn:hover{ background-color:white; opacity: 0.5; color:blue;}
	.id{font-size: 25px; color: black;}
	.id a{text-decoration: none; color:black}
	.pw:checked {color: blue;}
	.pw{font-size: 25px; color:blue;}
	.pw a{color:blue;;text-decoration: none;}
	#find{width:545px; height:500px; border:1px solid gray; margin-left: 50px; padding-left: -65px; padding-right: 10px;}
	#a{ padding: 20px; border-bottom: medium;}
	#b{ padding: 20px;}
	.form-group{width: 480px; padding: -50px;padding-left: -80px;}
</style>
</head>
<body style="background-color: rgba(0,0,0,0.05) ">
<%@ include file="../header.jsp" %><br>
<hr>
	<form class="form-horizontal" id="find" role="form" method="post" 
		action="pw_find" style="padding-left: 80px; margin: 0 auto;">
		<div style="margin:0 auto; padding: 10px;"> 
		<span id="a"><b class="id"><a href="id_find">아이디 찾기</a></b></span>
		|<span id="b"><b class="pw"><a href="pw_find">비밀번호 찾기</a></b></span>
		<hr style="width:200px;height: 4px; color: blue;margin-left: 183px;">
		</div>
		<div class="form-group" id="divId">
			<label for="inputId" class="col-lg-2 control-label">아이디</label>
			<div class="col-lg-10">
				<input type="text" id="id" name="user_id"
					class="form-control onlyAlphabetAndNumber"
					data-rule-required="true" placeholder="14자 이하의 영문,숫자"
					maxlength="30">
			</div>
			<span id="idchk"></span><br>
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