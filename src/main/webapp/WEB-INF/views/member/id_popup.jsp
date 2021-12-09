<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>id찾기</title>
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
	function find(){
		var code=$('#code').val();
		if(code == ${id_find}){
			//alert('성공')		
			//window.close();
			$.ajax({
				type:"get", url: "/root/member/id_found",
				success: function(data){
					$('#modal_wrap').hide();
					//var id=${model}
					$('#user_id').text(data.id);
				}
			});
		}else
			alert('일치하지 않습니다')
	}
	//function re(){
		//$('#re').on('click',function(){
	///		location.reload();
		//});
	//}
	$(function(){
	$('#re').on('click',function(){
		location.reload();
	});
	});
</script>
<style type="text/css">
	#user_id{padding: 100px;}
</style>
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
	    <button type="button" class="btn btn-primary" onclick="find()" id="btn" style="margin-left:30px; height: 40px; width: 90px;">인증하기</button>&nbsp;&nbsp;
	    <button type="button" class="btn btn-primary" id="re" onclick="re()" style="height: 40px; width: 130px;">다시 보내기</button>&nbsp;&nbsp;
	</form>
</div>
	<span id="user_id" style="margin: 0 auto;"></span>
</body>
</html>