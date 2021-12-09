<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<title>로그인 / 회원가입 폼 템플릿</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="http://code.jquery.com/jquery.js"></script>
<link type="text/css" rel="stylesheet" href="../resources/css/login.css">
<style type="text/css">
   a :hover{ color:red;}
</style>
<script type="text/javascript">
window.Kakao.init("f9319c4d99c66e8264e61c12760605ec");

function kakaoLogin(){
   window.Kakao.Auth.login({
      scope:'profile, account_email, gender',
      success: function(authObj){
         //console.log(authObj);
         window.Kakao.API.request({
            url:'/v2/user/me',
            success: res => {
               const kakao_account = res.kakao_account;
               console.log(kakao_account);
               //alert('성공')
               //location.href='/root/member/snsLogin'
               $.ajax({
                  url : "/root/member/snsLogin", type : "POST",
                  data : JSON.stringify(kakao_account),//서버로 전송할 데이터- js객체 타입은 json타입을 변경.
                  //data를 서버로 전송
                  dataType: 'json',//return type
                  contentType: "application/json; charset=utf-8",
                  success: function(data){
                     if($.trim(data.result)=="success"){
                        //alert('신규')
                        location.href='sns_join'
                     }
                        else{
                           //alert('기존')
                           location.href='/root/main';
                        }
                        } 
               })
               //location.href="login";
            }
         });
      }
   });
}


</script>
<script type="text/javascript">
   function login(){
      var chk1=false, chk2=false;
      if($('#user_id').val()=="")
         alert('아이디를 입력해주세요');
      else if($('#user_pw').val()=="")
         alert('비밀번호를 입력해주세요');
      else{
         //e.preventDefault();
         //document.getElementById('log_btn').submit();
         //var form=document.input;
         //form.submit();
         //location.href="login";
         input.submit();
      }
      
      /*else{
         $.ajax({
            type: 'post',dataType: 'json',
            url: "/root/member/login",
            data: {
               "id": $('#id').val()
            },
            success:function(data) {
               if($.trim(data.result)=="success")
                  chk1=true;
            }
         });
         $.ajax({
            type: 'post', dataType: 'json',
            url: "/root/member/login",
         })
      }*/
   }
   
   
</script>
</head>
<body>
<%@ include file="../header.jsp" %><br>

        <div class="wrap">
            <div class="form-wrap">
                <div class="button-wrap">
                    <aside class="togglebtn" style="background-color: #0099FF; text-align: center;">LOGIN</aside>
                </div>
                <div class="social-icons">
                    <img src="../resources/img/fb.png" alt="facebook">
                    <img src="../resources/img/kakao.png" onclick="kakaoLogin()" alt="kakao">
                    <img src="../resources/img/naver.png" alt="naver">
                </div>
                <form id="login" action="login" name="input" class="input-group" method="post">
                    <input type="text" name="id" id="user_id" class="input-field" placeholder="아이디 입력">
                    <input type="password" name="pw" id="user_pw" class="input-field" placeholder="비밀번호 입력"><br>
                    <input type="checkbox" class="checkbox" name="autoLogin" style="margin-top:3px; padding-top: -50px;">
                    <br><br><span id="remember" style=" margin:40px 1px 0 12px; padding: -50px 7px 10px 10px;">
                    Remember Password</span>
                    <a href="id_find" class="find" style="text-decoration: none; padding-left:180px; color:black;">id/pw 찾기</a>
                    <button type="button" class="btn btn-primary" onclick="login()" style="height: 40px; width: 140px; margin-top: 30px;
                    margin-right:-50px; margin-left: -186px; margin-top: 44px; ">Login</button>
                    
                </form>
                
            </div>
        </div>

        
        <script type="text/javascript">
            var x = document.getElementById("login");
            var y = document.getElementById("register");
            var z = document.getElementById("btn");
                  
            function Logout() {

              // Kakao.Auth.logout();
              Kakao.API.request({
                url: '/v1/user/unlink',
             success: function(res) {
               alert('success: ' + JSON.stringify(res))
         },
         fail: function(err) {
           alert('fail: ' + JSON.stringify(err))
         },
             })

            }
            //function login(){
          //      x.style.left = "50px";
          //      y.style.left = "450px";
          //      z.style.left = "0";
          //  }

        </script>
        <c:import url="../footer.jsp"/>
    </body>
</html> 