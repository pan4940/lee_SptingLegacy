
$('#loginBtn').click(function() {
	if ($('#member_id').val() == '')
		Swal.fire({
			icon: 'warning',
			title: '아이디 항목은 필수 입력값입니다!',
		});
	else if ($('#member_pwd').val() == '')
		Swal.fire({
			icon: 'warning',
			title: '패스워드 항목은 필수 입력값입니다!',
		});
	else if ($('#member_pwd').val().length <= 4)
		Swal.fire({
			icon: 'warning',
			title: '패스워드 항목을 4자(개) 이상으로 해주세요.',
		});
	else {
		$.ajax({
			type: 'post',
			url: '/member/loginOK',
			data: {
				'member_id': $('#member_id').val(),
				'member_pwd': $('#member_pwd').val()
			},
			dataType: 'text',
			success: function(data) {
				data = data.trim();
				if (data == 'ok') {

					Swal.fire({
						icon: 'success',
						title: $('#member_id').val() + "님 로그인 성공!",
						closeOnClickOutside: false
					}).then(function() {
						location.href = '/';
					});
				} else if (data == 'fail') {
					Swal.fire({
						icon: 'warning',
						title: '아이디 또는 비밀번호가 일치 하지 않아요!',
					});
				}
			},
			error: function(err) {
				alert(err);
			}
		});
	}
});

  
function checkSocial(id, name){
	$.ajax({
		type: 'post',
		url: '/member/socialLoginOk',
		data: 'member_id=' + id,
		dataType: 'text',
		success: function(data) {
			if (data == "ok") {
				Swal.fire({
					icon: 'success',
					title: name + "님 로그인 성공!",
					closeOnClickOutside: false
				}).then(function() {
					location.href = '/';
				});
			} else if (data == 'fail') {
				Swal.fire({
					icon: 'warning',
					title: '소셜 로그인 실패!',
				});
			}
		},
		error: function(err) {
			
		}

	});
}