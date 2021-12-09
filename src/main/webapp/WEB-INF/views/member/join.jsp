<%@ page language="java" contentType="text/html; charset=UTF-8" 
	 pageEncoding="UTF-8"%>
	 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!-- meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0"/ -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- Bootstrap -->
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
	var getPwCheck= RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);
	var getName= RegExp(/^[가-힣]+$/);
 	var getEmail=RegExp(/^[a-zA-Z0-9]{1,}$/);
 	var getEmail2=RegExp(/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i);

	var chk1 = false, chk2 = false, chk3 = false, chk4 = false, chk5 = false, 
	chk6=false,	chk7=false,chk8=false, chk9=false, chk10=false;
	$('#id').on('keyup',function(){
		if($("#id").val() == ""){
			$('#id').css("background-color", "pink");
			$('#idchk').html('<b style="font-size:16px;color:red;">[아이디는 필수 정보입니다]</b>');
			chk1=false;
		}
		else if(!getIdCheck.test($("#id").val())){
			$('#id').css("background-color", "pink");
			$('#idchk').html('<b style="font-size:16px;color:red;">[영문자,숫자 4-14자로 입력하시오]</b>');
			chk1=false;
		}else{//id 중복확인 비동기 처리
			$.ajax({
				type: "POST",
				url: "/root/member/id_check", dataType:"json",
			data: {
				"user_id": $("#id").val()
			},
			success: function(data){
				if($.trim(data.result)=="success"){
				
					$('#id').css("background-color", "aqua");
					$('#idchk').html('<b style="font-size:16px;color:black;">[사용가능한 id입니다]</b>');
					chk1=true;
				}else if($.trim(data.result) == "fail") { 
					
					$('#id').css("background-color", "pink");
					$('#idchk').html('<b style="font-size:16px;color:red;">[중복된 ID입니다!]</b>');
					chk1 = false;
			}
			}
			});
			//$('#id').css("background-color", "transparent");
			//$('#idchk').html("");
			//chk1=true;
		}
	});//아이디
	
	//패스워드 입력값 검증.
	$('#password').on('keyup', function(){
		$("#passwordCheck").val('');
		$("#passwordCheck").css("background-color","transparent");
		$('#pwChk2').html('');
		chk3=false;
		//비밀번호 공백 확인
		if($("#password").val() == ""){
		    $('#password').css("background-color", "pink");
			$('#pwChk').html('<b style="font-size:16px;color:red;">[패스워드는 필수정보입니다]</b>');
			chk2 = false;
		}
		//비밀번호 유효성검사
		else if(!getPwCheck.test($("#password").val()) || $("#password").val().length < 8){
		    $('#password').css("background-color", "pink");
			$('#pwChk').html('<b style="font-size:16px;color:red;">[특수문자 포함 8자이상]</b>');
			chk2 = false;
		} else {
			$('#password').css("background-color", "aqua");
			$('#pwChk').html('');
			chk2 = true;
		}
		
	});
	
	//패스워드 확인란 입력값 검증.
	$('#passwordCheck').on('keyup', function() {
		//비밀번호 확인란 공백 확인
		if($("#passwordCheck").val() == ""){
		    $('#passwordCheck').css("background-color", "pink");
			$('#pwChk2').html('<b style="font-size:16px;color:red;">[패스워드확인은 필수정보입니다]</b>');
			chk3 = false;
		}		         
		//비밀번호 확인란 유효성검사
		else if($("#password").val() != $("#passwordCheck").val()){
		    $('#passwordCheck').css("background-color", "pink");
			$('#pwChk2').html('<b style="font-size:16px;color:red;">[위에랑 일치하지 않습니다]</b>');
			chk3 = false;
		} else {
			$('#passwordCheck').css("background-color", "aqua");
			$('#pwChk2').html('<b style="font-size:16px;color:green;"></b>');
			chk3 = true;
		}
		
	});//비밀번호
	
	//이름 입력값 검증.
	$('#name').on('keyup', function() {
		//이름값 공백 확인
	if($("#name").val() == ""){
	    $('#name').css("background-color", "pink");
		$('#nameChk').html('<b style="font-size:16px;color:red;">[이름은 필수입니다]</b>');
		chk4 = false;
	}	
	//이름값 유효성검사
	else if(!getName.test($("#name").val())){
	    $('#name').css("background-color", "pink");
		$('#nameChk').html('<b style="font-size:16px;color:red;">[이름을 정확히 입력해주세요]</b>');
		chk4 = false;
	} else {
		$('#name').css("background-color", "aqua");
		$('#nameChk').html('<b style="font-size:16px;color:green;"></b>');
		chk4 = true;
	}//이름
	});
	
	//이메일1
	$('#email1').on('keyup',function(){
		if($('#email1').val() == ""){
			$('#emailChk').html('<b style="font-size:16px;color:red;">[이메일은 필수입니다]</b>');
			chk5=false;
		}else if(!getEmail.test($('#email1').val())){
			$('#emailChk').html('<b style="font-size:16px;color:red;">[이메일을 확인해주세요]</b>');
			chk5=false;
		}else{
			$.ajax({
				type: "post", dataType: "json",
				url: "/root/member/email_check",
				data: {
					"user_email": $('#email1').val()+"@"+$('#email2').val()
				},
				success: function(data){
					if($.trim(data.result)=="success"){
						$('#emailChk').html('');
						chk5=true;
					}
						else{
							$('#emailChk').html('<b style="font-size:16px;color:red;">[중복 이메일입니다]</b>');
							chk5=false;
						}
						} 
				
			});
		}
	});
	
	//이메일2
	$('#email_select').change(function(){
		var email2=$('#email_select').val();
		//getEmail
		if($('#email2').val()=="")
			chk6=false;
		if(email2==1){
			$('#email2').attr("readonly",false);
			$('#email2').val("");
			chk6=false;
		}else{
		$('#email2').val(email2);
		$('#email2').attr("readonly",true);
		$('#emailChk').html('<b style="font-size:16px;color:red;"></b>');
		$.ajax({
			type: "post", dataType: "json",
			url: "/root/member/email_check",
			data: {
				"user_email": $('#email1').val()+"@"+$('#email2').val()
			},
			success: function(data){
				if($.trim(data.result)=="success"){
					chk6=true;
				}
					else{
						$('#emailChk').html('<b style="font-size:16px;color:red;">[중복 이메일입니다]</b>');
						chk6=false;
					}
					} 
			
			});
		}
	});//이메일2
	
	//이메일 직접입력
	$('#email2').change(function(){
		var email2=$('#email2').val();
		
		if($('#email2').val()==""){
			chk6=false;
			$('#emailChk').html('<b style="font-size:16px;color:red;">[이메일은 필수입니다]</b>');
		}else if(!getEmail2.test($('#email2').val())){
			$('#emailChk').html('<b style="font-size:16px;color:red;">[이메일을 확인해주세요]</b>');
			chk6=false;
		}else{			
			$.ajax({
				type: "post", dataType: "json",
				url: "/root/member/email_check",
				data: {
					"user_email": $('#email1').val()+"@"+$('#email2').val()
				},
				success: function(data){
					if($.trim(data.result)=="success"){
						$('#emailChk').html('');
						chk6=true;
					}
						else{
							$('#emailChk').html('<b style="font-size:16px;color:red;">[중복 이메일입니다]</b>');
							chk6=false;
						}
						} 
				
		});
	}
	});//이메일2-2
	
	//전화번호
	$('#tel2').on('keyup', function(){
		//공백 확인
		if($("#tel2").val().length == 4){
			$('#tel3').focus();
			$.ajax({
				type: "post", dataType: "json",
				url: "/root/member/phone_check",
				data: {
					"user_phone": $('#tel1').val()+$('#tel2').val()+$('#tel3').val()
				},
				success: function(data){
					if($.trim(data.result)=="success"){
						$('#telChk').html('<b style="font-size:16px;color:red;"></b>');
						chk7=true;
					}
						else{
							$('#telChk').html('<b style="font-size:16px;color:red;">[중복된 번호입니다]</b>');
							chk7=false;
						}
						} 
			});			
		}else if($("#tel2").val().length < 4){
			$('#telChk').html('<b style="font-size:16px;color:red;>[중복]"')
			chk7 = false;
		}
	});//tel2
	
	$('#tel3').on('keyup', function(){
		//공백 확인
		if($("#tel3").val().length == 4){			
			$.ajax({
				type: "post", dataType: "json",
				url: "/root/member/phone_check",
				data: {
					"user_phone": $('#tel1').val()+$('#tel2').val()+$('#tel3').val()
				},
				success: function(data){
					if($.trim(data.result)=="success"){
						$('#telChk').html('<b style="font-size:16px;color:red;"></b>');
						chk8=true;
					}
						else{
							$('#telChk').html('<b style="font-size:16px;color:red;">[중복된 번호입니다]</b>');
							chk8=false;
						}
						} 
			});			
		}else if($("#tel3").val().length < 4){
			chk8 = false;
		}
	});//tel3
	
	$('#signup-btn').click(function(e) {
		if(chk1 && chk2 && chk3 && chk4 && chk5
				&& chk6 && chk7 && chk8) {
			var answer=confirm('회원가입을 완료하시겠습니까?');
			if(answer){			
				e.preventDefault();
				$('#signUpForm').submit();
				alert('회원가입이 완료되었습니다');
				}
			}
			else{
			alert('입력정보를 다시 확인하세요.');	
		}
		
	});
	
	/*$('#signup-btn').click(function(e) {
		if(chk1 && chk2 && chk3 && chk4 && chk5
				&& chk6 && chk7 && chk8) {
			
			var answer = confirm('회원가입을 완료하시겠습니까?');
			if(answer) {
				e.preventDefault();
				$('#signUpForm').submit();
			}
		} else {
			alert('입력정보를 다시 확인하세요.');			
		}
	});*/
});
	
</script>
</head>
<body>
            <c:import url="../header.jsp"/><br>
            <br>
            
            <form class="form-horizontal" id="signUpForm" role="form" method="post" action="join" style="padding-left: 40%; margin-left: auto; margin-right: auto;">

                <div class="form-group" id="divId">
                    <label for="inputId" class="col-lg-2 control-label">아이디</label>
                    <div class="col-lg-10">
                        <input type="text" id="id" name="user_id" class="form-control-md onlyAlphabetAndNumber"
                        data-rule-required="true" placeholder="14자 이하의 영문,숫자" maxlength="30" style="width: 230px;">
                    </div>
                    <span id="idchk"></span><br>
                </div>
                <div class="form-group" id="divPassword">
                    <label for="inputPassword" class="col-lg-2 control-label">패스워드</label>
                    <div class="col-lg-10">
                        <input type="password" class="form-control-md" id="password" name="user_pw" data-rule-required="true" placeholder="특수문자 포함 8자이상" maxlength="20" style="width: 230px;">
                    </div>
                    <span id="pwChk" style="padding:0 0 0 15px;"></span>
                </div>
                <div class="form-group" id="divPasswordCheck">
                    <label for="inputPasswordCheck" class="col-lg-2 control-label">패스워드 확인</label>
                    <div class="col-lg-10">
                        <input type="password" class="form-control-md" id="passwordCheck" data-rule-required="true" placeholder="패스워드 확인" maxlength="20" style="width: 230px;">
                        <span id="pwChk2"></span>
                    </div>
                </div>
                <div class="form-group" id="divName">
                    <label for="inputName" class="col-lg-2 control-label">이름</label>
                    <div class="col-lg-10">
                        <input type="text" class="form-control-md onlyHangul" id="name" name="user_name" data-rule-required="true" placeholder="한글만 입력 가능합니다." maxlength="15" style="width: 230px;">
                    </div>
                    <span id="nameChk" style="padding:0 0 0 15px;"></span>
                </div>
              
                <div class="form-group" id="divEmail">
                    <label for="inputEmail" class="col-lg-2 control-label">이메일</label>
                    <div class="col-lg-10">
                        <!--input type="email" class="form-control" id="email" data-rule-required="true" placeholder="이메일" maxlength="40"-->
                        <input type="text" id="email1" name="user_email1" size="15"> @ <input type="text" name="user_email2" id="email2" size="20" readonly="readonly">
                        <select name="email3" class="box" id="email_select">
                        	<option value="" selected>선택하시오</option>
                        	<option value="naver.com">naver.com</option>
                        	<option value="hotmail.com">hotmail.com</option>
                        	<option value="hanmail.com">hanmail.com</option>
                        	<option value="yahoo.co.kr">yahoo.co.kr</option>
                        	<option value="gmail.com">gmail.com</option>
                        	<option value="1">직접입력</option>
                        </select><br>
                        <span id="emailChk"></span>
                    </div>
                </div>
                <div class="form-group" id="divPhoneNumber">
                    <label for="inputPhoneNumber" class="col-lg-2 control-label">휴대폰 번호</label>
                    <div class="col-lg-10">
                    	<select class="tel" id="tel1" name="user_tel1">
                            <option value="010">010</option>
                            <option value="011">011</option>
                            <option value="016">016</option>
                            <option value="017">017</option>
                            <option value="018">018</option>
                        </select>
                        - <input type="text" name="user_tel2" id="tel2" maxlength="4" size="5" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
                        - <input type="text" name="user_tel3" id="tel3" maxlength="4" size="5" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" >
                        <br> <span id="telChk"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPhoneNumber" class="col-lg-2 control-label-md">성별</label>
                    <div class="col-lg-10">
                        <select class="form-control-md" id="gender" name="user_gender" style="width: 5%;" >
                            <option value="M">남</option>
                            <option value="F">여</option>
                        </select>
                    </div>
                </div>
                
                <div class="form-group">
                    <div class="col-lg-offset-2 col-lg-10">
                        <button type="button" class="btn btn-primary" id="signup-btn" style="height: 50px; height: 50px;">회원가입</button>&nbsp;&nbsp;
                        <button type="button" class="btn btn-primary" onclick="history.back()"style="height: 50px; height: 50px;">뒤로가기</button>
                        
                    </div>
                </div>
            </form>
            <%@ include file="../footer.jsp" %><br>
 <!-- /div> -->
</body>
</html>