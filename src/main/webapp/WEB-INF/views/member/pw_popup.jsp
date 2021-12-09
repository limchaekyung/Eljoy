<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pw찾기</title>
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
	var getPwCheck= RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);
	var chk1=false,chk2=false;
	
	$('#password').on('keyup', function(){
		$("#passwordCheck").val('');
		$("#passwordCheck").css("background-color","transparent");
		$('#pwChk2').html('');
		chk2=false;
		
		if($("#password").val() == ""){
		    $('#password').css("background-color", "pink");
			$('#pwChk1').html('<b style="font-size:16px;color:red;">[패스워드는 필수정보입니다]</b>');
			chk1 = false;
		}
		
		else if(!getPwCheck.test($("#password").val()) || $("#password").val().length < 8){
		    $('#password').css("background-color", "pink");
			$('#pwChk1').html('<b style="font-size:16px;color:red;">[특수문자 포함 8자이상]</b>');
			chk1 = false;
		} else {
		    $('#password').css("background-color", "transparent")
			$('#pwChk1').html('');
			chk1 = true;
		}
		
	});
	
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
			$('#pwChk2').html('<b style="font-size:16px;color:red;">[일치하지 않습니다]</b>');
			chk2 = false;
		} else {
		    $('#passwordCheck').css("background-color", "transparent")
			$('#pwChk2').html('');
			chk2 = true;
		}
		
	});//비밀번호
	
	$('#btn').click(function(e) {
		if(chk1 && chk2) {
			var answer=confirm('바꾸시겠습니까?');
			if(answer){
				e.preventDefault();
				$('#modify').submit();
				alert('수정되었습니다');
				//window.close();
				}
			}
			else{
			alert('입력정보를 다시 확인하세요.');	
		}
		
	});
	$('#complete').hide();
});
	
	function find(){		
		var code=$('#code').val();
		if(code == ${pw_find}){			
			/*$.ajax({
				type:"get", url: "/root/member/complete",
				success: function(data){
					$('#modal_wrap').hide();
					$('#complete').show();
					$('#user_id').text(data.id);
				}
			});*/
			$('#modal_wrap').hide();
			$('#complete').show();
		}else
			alert('일치하지 않습니다')
	}
	$(function(){
		$('#re').on('click',function(){
			location.reload();
		});
		});
	
	
</script>
</head>
<body>
<div id="modal_wrap">
	<br><br>
	<form class="form-horizontal" id="find" role="form" method="post" 
		action="#" style="padding-left: 80px; margin: 0 auto; width:700px;">
	<b style="color:red">* 해당 이메일로 식별코드를 전송하였습니다</b>
	<div class="form-group" id="divName" style="margin: 0 auto;">
		<label for="inputName" class="col-lg-2 control-label"><b></b></label>
		<div class="col-lg-10">
		<input type="text" class="form-control onlyHangul" id="code"
		name="user_code" data-rule-required="true" 
		placeholder="인증번호 입력" maxlength="15" style="width: 280px;">
		</div>
	</div><br>
	    <button type="button" class="btn btn-primary" onclick="find()" id="confirm" style="margin-left:30px; height: 40px; width: 90px;">인증하기</button>&nbsp;&nbsp;
	    <button type="button" class="btn btn-primary" id="re" onclick="re()" style="height: 40px; width: 130px;">다시 보내기</button>&nbsp;&nbsp;
	</form>
</div>
<div id="complete" style="display: none; margin: 30px">
	<form id="modify" method="post" action="pw_modify">
		<div class="form-group" id="divPassword">
			<label for="inputPassword" class="col-lg-2 control-label">새로운 패스워드</label>
			<div class="col-lg-10">
				<input type="password" class="form-control" id="password"
					name="user_pw" data-rule-required="true"
					placeholder="특수문자 포함 8지 이상" maxlength="20">
			</div>
			<span id="pwChk1" style="padding: 0 0 0 15px;"></span>
		</div>
		<div class="form-group" id="divPasswordCheck">
			<label for="inputPasswordCheck" class="col-lg-2 control-label">패스워드 확인</label>
			<div class="col-lg-10">
				<input type="password" class="form-control" id="passwordCheck"
					data-rule-required="true" placeholder="패스워드 확인" maxlength="20">
				<span id="pwChk2"></span>
			</div>
		</div>
	 <button type="button" class="btn btn-primary" id="btn" style="height: 50px; height: 50px; margin:0 0 0 20px;">완료</button>&nbsp;&nbsp;
		
	</form>
</div>
</body>
</html>