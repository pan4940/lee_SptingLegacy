$(function() {
	$.ajax({
		type: 'post',
		url: '/getMainImg',
		success: function(data) {
			$.each(data, function(index, item) {
				if ($('#' + item.menu).length != 0) {
					$('#' + item.menu + ' img').attr('src', '/storage/menu/' + item.stored_thumbnail);
				}
			})
		},
		error: function(err) {
			console.log(err)
		}
	})
	$.ajax({
		type: 'post',
		url: '/board/getNewPost',
		success: function(data) {
			console.log(data)
			$('<a/>', { href: data.boardDTO.board_num, class: 'move' }).append(
				$('<img/>', { src: '/file/display?fileName=/' + data.fileDTO.uploadPath + '/' + data.fileDTO.uuid + '_' + data.fileDTO.fileName })
			).appendTo($('#post_image'));
			$('<a/>', { href: data.boardDTO.board_num, class: 'move' }).append(
				$('<span/>').text(data.boardDTO.subject)
			).appendTo($('#post_content'));
			$('<p/>').html(data.boardDTO.content).appendTo($('#post_content'));
			$('<a/>', { href: data.boardDTO.board_num, class: 'move' }).text('Read more').appendTo($('#post_content'));
			let actionForm = $("#actionForm");
			$(".move").on("click", function(e) {
				e.preventDefault();
				console.log($(this).attr("href"));
				$("input[name='board_num']").val($(this).attr('href'));
				console.log(actionForm);
				actionForm.submit();
			});
		},
		error: function(err) {
			console.log(err)
		}
	});
	$.ajax({
		type: 'post',
		url: '/getMainProduct',
		success: function(data) {
			console.log(data)
			$.each(data, function(index, items) {
				if (index < 8) {
					$('<div/>', {style:"position: relative", class: 'col-6 col-sm-3 product_infoDiv' }).append(
						$('<a/>', { 'href': '/detail?seq=' + items.product_number }).append($('<img/>', { src: '/storage/' + items.stored_thumbnail,height:'100%' }))
					).append($('<div/>',{style:"position: absolute; bottom: 0; display:none",html:items.product_name+'<br>'+items.product_price.toLocaleString()+ '원'})).appendTo($('#ourproductSample'))
				}

			});
			$('.product_infoDiv').hover(function(){
				if(this.children[1].style.display=='none')
					this.children[1].style.display='block';
				else
					this.children[1].style.display='none';
			})
		},
		error: function(data) {
			console.log(data)
		}
	});
})