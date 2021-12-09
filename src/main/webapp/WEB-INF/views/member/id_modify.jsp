<%@ page language="java" contentType="text/html; charset=UTF-8" 
	 pageEncoding="UTF-8"%>
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
	var getPwCheck= RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);
	var getName= RegExp(/^[가-힣]{2,5}$/);
 	var getEmail=RegExp(/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i);
 	var getEmail2=RegExp(/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i);
	var getPhone=RegExp(/^01(?:0|1|[6-9])(?:\d{4}|\d{4})\d{4}$/);

	var chk1 = false, chk2 = false, chk3 = true, chk4 = true, chk5 = true;

	//패스워드 입력값 검증.
	$('#password').on('keyup', function(){
		$('#passwordCheck').val('');
		$('#passwordCheck').css("background-color", "transparent");
		chk2=false;
		//비밀번호 공백 확인
		if($("#password").val() == ""){
		    $('#password').css("background-color", "pink");
			$('#pwChk').html('<b style="font-size:16px;color:red;">[패스워드는 필수정보입니다]</b>');
			chk1 = false;
		}
		//비밀번호 유효성검사
		else if(!getPwCheck.test($("#password").val()) || $("#password").val().length < 8){
		    $('#password').css("background-color", "pink");
			$('#pwChk').html('<b style="font-size:16px;color:red;">[특수문자 포함 8자이상]</b>');
			chk1 = false;
		} else {
			$('#password').css("background-color", "aqua");
			$('#pwChk').html('<b style="font-size:16px;color:green;"></b>');
			chk1 = true;
		}
		
	});
	
	//패스워드 확인란 입력값 검증.
	$('#passwordCheck').on('keyup', function() {
		//비밀번호 확인란 공백 확인
		if($("#passwordCheck").val() == ""){
		    $('#passwordCheck').css("background-color", "pink");
			$('#pwChk2').html('<b style="font-size:16px;color:red;">[패스워드확인은 필수정보입니다]</b>');
			chk2 = false;
		}		         
		//비밀번호 확인란 유효성검사
		else if($("#password").val() != $("#passwordCheck").val()){
		    $('#passwordCheck').css("background-color", "pink");
			$('#pwChk2').html('<b style="font-size:16px;color:red;">[비밀번호가 일치하지 않습니다]</b>');
			chk2 = false;
		} else {
			$('#passwordCheck').css("background-color", "aqua");
			$('#pwChk2').html('<b style="font-size:16px;color:green;"></b>');
			chk2 = true;
		}
		
	});//비밀번호
	
	//이름 입력값 검증.
	$('#name').on('keyup', function() {
		//이름값 공백 확인
	if($("#name").val() == ""){
	    $('#name').css("background-color", "pink");
		$('#nameChk').html('<b style="font-size:16px;color:red;">[이름은 필수정보입니다]</b>');
		chk3 = false;
	}	
	//이름값 유효성검사
	else if(!getName.test($("#name").val())){
	    $('#name').css("background-color", "pink");
		$('#nameChk').html('<b style="font-size:16px;color:red;">[이름을 정확히 입력해주세요]</b>');
		chk3 = false;
	} else {
		$('#name').css("background-color", "aqua");
		$('#nameChk').html('<b style="font-size:16px;color:green;"></b>');
		chk3 = true;
	}//이름
	});
	
	//이메일
	$('#email').on('keyup',function(){
		if($('#email').val() == ""){
			$('#emailChk').html('<b style="font-size:16px;color:red;">[이메일은 필수입니다]</b>');
			chk4=false;
		}else if(!getEmail.test($('#email').val())){
			$('#emailChk').html('<b style="font-size:16px;color:red;">[이메일을 확인해주세요]</b>');
			chk4=false;
		}else{
			$.ajax({
				type: "post", dataType: "json",
				url: "/root/member/id_email_check",
				data: {
					"user_email": $('#email').val()
				},
				success:function(data){
					if($.trim(data.result)=="success"){
						$('#emailChk').html('')
						chk4=true;
				}else {
					chk4=false;
					$('#emailChk').html('<b style="font-size:16px;color:red;">[중복된 이메일입니다]')}
			}
				});
		}
	});
			
	//전화번호
	$('#tel').on('keyup', function(){
		//공백 확인
		if($("#tel").val().length == 0){			
			chk5 = false;
			$('#phoneChk').html('<b style="font-size:16px;color:red;">[전화번호를 입력해주세요]')
		}else if(!getPhone.test($("#tel").val())){
			chk5 = false;
			$('#phoneChk').html('<b style="font-size:16px;color:red;">[알맞게 입력해주세요]')
		}else{
			$.ajax({
				type: "post", dataType: "json",
				url: "/root/member/id_phone_check",
				data: {
					"user_tel": $('#tel').val()
				},
				success:function(data){
					if($.trim(data.result)=="success"){
						$('#phoneChk').html('')
						chk5=true;
				}else {
					chk5=false;
					$('#phoneChk').html('<b style="font-size:16px;color:red;">[중복된 번호입니다]')}
			}
				});
		}
	});
	
		
	$('#signup-btn').click(function(e) {
		if(chk1 && chk2 && chk3 && chk4 && chk5) {
				var answer=confirm('수정하시겠습니까?');
					if(answer){
							e.preventDefault();
							$('#IdModifyForm').submit();
							alert('수정되었습니다');
							//location.href='/root/main';
					}
		}else {
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
            <!-- 헤더 들어가는 부분 -->
            <%@ include file="../header.jsp" %><br>
            <!-- 모달창 -->
            
            <!--// 모달창 -->
            <hr/>
            <c:set var="dto" value="${model}"></c:set>
            <form class="form-horizontal" id="IdModifyForm" role="form" method="post" action="id_modify" style="padding-left: 80px">
              
                <div class="form-group" id="divId">
                    <label for="inputId" class="col-lg-2 control-label">아이디</label>
                    <div class="col-lg-10">
                        <input type="text" id="id" name="user_id" class="form-control onlyAlphabetAndNumber"
                        data-rule-required="true" maxlength="30" readonly="readonly" value="${dto.user_id }">
                    </div>
                    <span id="idchk"></span><br>
                </div>
                <div class="form-group" id="divPassword">
                    <label for="inputPassword" class="col-lg-2 control-label">패스워드</label>
                    <div class="col-lg-10">
                        <input type="password" class="form-control" id="password" name="user_pw" data-rule-required="true" placeholder="특수문자 포함 8지 이상" maxlength="20">
                    </div>
                    <span id="pwChk" style="padding:0 0 0 15px;"></span>
                </div>
                <div class="form-group" id="divPasswordCheck">
                    <label for="inputPasswordCheck" class="col-lg-2 control-label">패스워드 확인</label>
                    <div class="col-lg-10">
                        <input type="password" class="form-control" id="passwordCheck" data-rule-required="true" placeholder="패스워드 확인" maxlength="20">
                        <span id="pwChk2"></span>
                    </div>
                </div>
                <div class="form-group" id="divName">
                    <label for="inputName" class="col-lg-2 control-label">이름</label>
                    <div class="col-lg-10">
                        <input type="text" class="form-control onlyHangul" id="name" name="user_name" data-rule-required="true" placeholder="한글만 입력 가능합니다." maxlength="15"
                        value="${dto.user_name }">
                    </div>
                    <span id="nameChk" style="padding:0 0 0 15px;"></span>
                </div>
              
                <div class="form-group" id="divEmail">
                    <label for="inputEmail" class="col-lg-2 control-label">이메일</label>
                    <div class="col-lg-10">
                        <!--input type="email" class="form-control" id="email" data-rule-required="true" placeholder="이메일" maxlength="40"-->
                        <input type="text" id="email" name="user_email" size="45" value="${dto.user_email }"> 
                        <br>
                        <span id="emailChk"></span>
                    </div>
                </div>
                <div class="form-group" id="divPhoneNumber">
                    <label for="inputPhoneNumber" class="col-lg-2 control-label">휴대폰 번호</label>
                    <div class="col-lg-10">
                        <input type="text" value="${dto.user_phone }" name="user_tel" id="tel" maxlength="11" size="45" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
                        <br>
                        <span id="phoneChk"></span>
                    </div>
                </div>
                
                <div class="form-group">
                    <div class="col-lg-offset-2 col-lg-10">
                        <button type="button" class="btn btn-primary" id="signup-btn" style="width: 100px; height: 50px;">수 정</button>&nbsp;&nbsp;
                        <button type="button" class="btn btn-primary" onclick="history.back()"style="width: 100px; height: 50px;">뒤로가기</button>
                        
                    </div>
                </div>
            </form>
            <%@ include file="../footer.jsp" %><br>
 <!-- /div> -->
</body>
</html>
            