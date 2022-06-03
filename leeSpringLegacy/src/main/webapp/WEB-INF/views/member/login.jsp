<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://accounts.google.com/gsi/client" async defer></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<!-- <script src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"></script> -->
<script type="text/javascript" src="/resources/js/login.js"></script>
    
    <div id="loginDiv">
      <div id="login">
        <input id="member_id" style="width: 100%; border: 0px; border-bottom: 2px solid black"
          type="text"placeholder="ID" />
        
        <br />
        <input
          id="member_pwd"  type="password"
          style="width: 100%; border: 0px; border-bottom: 2px solid black"
          placeholder="Password"
        />
        <br />
        <input id="loginBtn" type="button" value="Login" />
        
        <br />
      </div>

      <div id="login2">
        <span>
        	Forgotten 
        	<a onclick="location.href='findIdForm'">ID</a> 
        	or 
        	<a onclick="location.href='findPwdForm'">Password</a>
        </span>
        <span><a onclick="location.href='/member/joinForm'">New Customer</a></span>
      </div>

      <div id="login3">
        <span>Login with </span>&nbsp;&nbsp;
        <!-- 네이버 로그인 버튼 노출 영역 -->
        <div id="message"></div>
        
        
        
  		<div id="button_area"> 
  			<div id="naverIdLogin"></div>
  			<!-- <div id="g_id_onload"
			     data-client_id="145826599820-dm771pd54v5deur8gcka37n9jepmo95t.apps.googleusercontent.com"
			     data-login_uri="http://localhost:8080/member/google"
			     data-auto_prompt="false">
			</div>
			<div class="g_id_signin"
			     data-type="standard"
			     data-size="large"
			     data-theme="outline"
			     data-text="sign_in_with"
			     data-shape="rectangular"
			     data-logo_alignment="left">
			</div> -->
  			
  			
  			<div id="googleBtn">
			</div>




			<span>
				<img id="kakaoLogin" alt="" src="/resources/image/kakao_login_medium_narrow.png">
	        </span>
  		</div>
        
        
      </div>
    </div>
  
     
<!-- 네이버 스크립트 -->
<!-- <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script> -->


	
