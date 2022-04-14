//로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          data: {
      	  property_keys: ["kakao_account.email","properties.nickname"]
   		 },
          success: function (response) {
			window.open("https://accounts.kakao.com/login?continue=https%3A%2F%2Fkauth.kakao.com%2Foauth%2Fauthorize%3Fproxy%3DeasyXDM_Kakao_cfqcs4ipulm_provider%26ka%3Dsdk%252F1.41.2%2520os%252Fjavascript%2520sdk_type%252Fjavascript%2520lang%252Fko%2520device%252FWin32%2520origin%252Fhttp%25253A%25252F%25252Flocalhost%25253A8090%26origin%3Dhttp%253A%252F%252Flocalhost%253A8090%26response_type%3Dcode%26redirect_uri%3Dkakaojs%26state%3Dn5p3nczn5agisoagraozt%26client_id%3D16280b2ff75bc611cf6f95bb6dfa9a49&talk_login=hidden")
			console.log(response)
        	  $.ajax({
					url:'/kakaoLogin',
					type:'post',
					data:{
						'kakaoId':response.id+'@k',
						'email':response.kakao_account.email,
						'name':response.properties.nickname
					},
					success:function(){
						location.href='/index';
					},
					error:function(){}
				});
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
$('#bt').click(function(){
   if($('#user_id').val()=='')
   Swal.fire({
           icon: 'warning',
           title: '아이디 항목은 필수 입력값입니다!',
         });
   else if($('#user_pwd').val()=='')
      Swal.fire({
           icon: 'warning',
           title: '패스워드 항목은 필수 입력값입니다!',
         });
   else if($('#user_pwd').val().length<= 4)
      Swal.fire({
              icon: 'warning',
              title: '패스워드 항목을 4자(개) 이상으로 해주세요.',
         });
   else{
      $.ajax({
         type:'post',
         url:'/loginOk',
         data: {
            'user_id': $('#user_id').val(),
            'user_pwd': $('#user_pwd').val()
         },
         dataType:'text',
         success:function(data){
            data = data.trim();
            if(data =='ok'){
               
               
               
               Swal.fire({
                     icon: 'success',
                     title: $('#user_id').val() + "님 로그인 성공!✌(‘ω’✌)",
                     closeOnClickOutside: false
                  }).then(function() {
                     location.href = '/';
                  });
            }else if(data=='fail'){
               Swal.fire({
                 icon: 'warning',
                 title: '아이디 또는 비밀번호가 일치 하지 않아요!',
               });
            }
         },
         error:function(err){
            alert(err);
         }
      });
   }
   

   
   
});

$('#kakao').click(kakaoLogin);