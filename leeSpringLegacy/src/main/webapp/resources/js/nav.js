
$(function() {
	if (window.innerWidth < 800) {
		$('#second_large').hide();
	} else {
		$('#second_small').hide();
	}
	$("#fourth").hide();
	
});


$("#second_large span").mouseover(function(event) {
	$("#third_large").css("display", "flex");
	$("#third_large").empty();
	if (event.currentTarget.innerText == "MEN") {
		$("<div/>", { class: 'col-3' })
			.append(
				$("<ul/>")
					.append($("<li/>").append($("<a/>", { text: "TOP", href: "/product/list?product_category_num=1100" })))
					.append($("<li/>").append($("<a/>", { text: "BOTTOM", href: "/product/list?product_category_num=1200" })))
					.append($("<li/>").append($("<a/>", { text: "BAG", href: "/product/list?product_category_num=1300" })))
					.append($("<li/>").append($("<a/>", { text: "HANDWEAR", href: "/product/list?product_category_num=1400" })))
					.append($("<li/>").append($("<a/>", { text: "ACCESSORIES", href: "/product/list?product_category_num=1500" })))
					.append($("<li/>").append($("<a/>", { text: "SHOES", href: "/product/list?product_category_num=1600" })))
					.append($("<li/>").append($("<a/>", { text: "COLLABORATIONS", href: "/product/list?product_category_num=1700" }))
				)
			)
		.appendTo($("#third_large"));
		
		$("<div/>", { class: 'col-3' })
			.appendTo($("#third_large"));
			
		//반복문. 2개의 남성브랜드 정보 가져와서 2번 반복하게 할 것. 
		$.ajax({
			type: 'post',
			url: '/product/getNavMenProductCategoryDTO',
			dataType: 'json',
			success: function(data) {
				console.log(data);
				$.each(data, function(index,item){
					let fileCallPath = encodeURIComponent(item.fileList[0].uploadPath + "/" + item.fileList[0].uuid + "_" +  item.fileList[0].fileName);
					$("<div/>", { "id": "menuimage" + index, class: "col-3" })
						.append($("<a/>", {href: '/product/list-brand?product_category_num=' + item.product_category_num}).append($("<p/>")).append($("<img/>",{style:'margin-left:10px;height:80%', src: '/file/display?fileName=/' + fileCallPath})))
						.append($("<a/>", {href: '/product/list-brand?product_category_num=' + item.product_category_num}).append($("<p/>", {text: item.product_category_name})))
						.appendTo($("#third_large"));	
				});
			},
			error: function(err) {
				console.log(err)
			}
		}); //end ajax
		
	
	} else if (event.currentTarget.innerText == "WOMEN") {
		$("<div/>", { class: 'col-3' })
			.append(
				$("<ul/>")
					.append($("<li/>").append($("<a/>", { text: "TOP", href: "/product/list?product_category_num=2100" })))
					.append($("<li/>").append($("<a/>", { text: "BOTTOM", href: "/product/list?product_category_num=2200" })))
					.append($("<li/>").append($("<a/>", { text: "BAG", href: "/product/list?product_category_num=2300" })))
					.append($("<li/>").append($("<a/>", { text: "HANDWEAR", href: "/product/list?product_category_num=2400" })))
					.append(
						$("<li/>").append($("<a/>", { text: "ACCESSORIES", href: "/product/list?product_category_num=2500" }))
					)
					.append($("<li/>").append($("<a/>", { text: "SHOES", href: "/product/list?product_category_num=2600" })))
			)
			.appendTo($("#third_large"));
			
			
		$("<div/>", { class: 'col-3' })
			.appendTo($("#third_large"));
			
		//반복문. 2개의 여성브랜드 정보 가져와서 2번 반복하게 할 것. 
		$.ajax({
			type: 'post',
			url: '/product/getNavWomenProductCategoryDTO',
			dataType: 'json',
			success: function(data) {
				$.each(data, function(index,item){
					let fileCallPath = encodeURIComponent(item.fileList[0].uploadPath + "/" + item.fileList[0].uuid + "_" +  item.fileList[0].fileName);
					$("<div/>", { "id": "menuimage" + index, class: "col-3" })
						//.append($("<a/>").append($("<p/>")).append($("<img/>",{style:'margin-left:10px;height:80%', src: '/file/display?fileName=/' + fileCallPath})))
						.append($("<a/>", {href: '/product/list-brand?product_category_num=' + item.product_category_num}).append($("<p/>")).append($("<img/>",{style:'margin-left:10px;height:80%', src: '/file/display?fileName=/' + fileCallPath})))
						.append($("<a/>", {href: '/product/list-brand?product_category_num=' + item.product_category_num}).append($("<p/>", {text: item.product_category_name})))
						.appendTo($("#third_large"));	
				});
			},
			error: function(err) {
				console.log(err)
			}
		}); //end ajax
	
	/*} else if (event.currentTarget.innerText == "LIFE STYLE") {
		$("<div/>", { class: 'col-3' })
			.append(
				$("<ul/>")
					.append(
						$("<li/>").append($("<a/>", { text: "CRAFT PRACTISE", href: "/list?category=" }))
					)
					.append(
						$("<li/>").append($("<a/>", { text: "CROWCANYON", href: "/list?category=" }))
					)
					.append($("<li/>").append($("<a/>", { text: "HELINOX", href: "/list?category=" })))
					.append(
						$("<li/>").append($("<a/>", { text: "MAGAZINE B", href: "/list?category=" }))
					)
					.append(
						$("<li/>").append($("<a/>", { text: "NAG CHAMPA", href: "/list?category=" }))
					)
					.append(
						$("<li/>").append(
							$("<a/>", { text: "NTFU COLLECTABLES", href: "/list?category=" })
						)
					)
					.append(
						$("<li/>").append($("<a/>", { text: "SALT RAIN", href: "/list?category=" }))
					)
					.append(
						$("<li/>").append($("<a/>", { text: "XENIA TALER", href: "/list?category=" }))
					)
			)
			.appendTo($("#third_large"));

		$("<div/>", { class: 'col-3' })
			.appendTo($("#third_large"));
		$("<div/>", { "id": "menuimage5", class: "col-3" })
			.append($("<a/>").append($("<p/>")).append($("<img/>",{style:'margin-left:10px;height:80%'})))
			.appendTo($("#third_large"));
		$("<div/>", { "id": "menuimage6", class: "col-3" })
			.append($("<a/>").append($("<p/>")).append($("<img/>",{style:'margin-left:10px;height:80%'})))
			.appendTo($("#third_large"));
	} else if (event.currentTarget.innerText == "SALE") {
		$("<div/>", { class: 'col-3' })
			.append(
				$("<ul/>")
					.append(
						$("<li/>").append(
							$("<a/>", { text: "ALL SALE", href: "/list?category=" }).append(
								$("<span/>", {
									text: "UP TO 70%",
									style: "color:red;font-size:12px;margin-left:5px",
								})
							)
						)
					)
					.append($("<li/>").append($("<p/>")))
					.append(
						$("<li/>").append($("<a/>", { text: "BROWNYARD", href: "/list?category=" }))
					)
					.append(
						$("<li/>").append($("<a/>", { text: "CARHARTT WIP", href: "/list?category=" }))
					)
					.append($("<li/>").append($("<a/>", { text: "DEUS", href: "/list?category=" })))
					.append($("<li/>").append($("<a/>", { text: "GRAMICCI", href: "/list?category=" })))
					.append($("<li/>").append($("<a/>", { text: "LMC", href: "/list?category=" })))
					.append($("<li/>").append($("<a/>", { text: "MISCHIEF", href: "/list?category=" })))
					.append($("<li/>").append($("<a/>", { text: "OBEY", href: "/list?category=" })))
					.append($("<li/>").append($("<a/>", { text: "POLAR", href: "/list?category=" })))
					.append(
						$("<li/>").append($("<a/>", { text: "THISISNEVERTHAT", href: "/list?category=" }))
					)
					.append(
						$("<li/>").append($("<a/>", { text: "UNAFFECTED", href: "/list?category=" }))
					)
					.append(
						$("<li/>").append($("<a/>", { text: "WHIDTHINGS", href: "/list?category=" }))
					)
			)
			.appendTo($("#third_large"));

		$("<div/>", { class: 'col-3' })
			.appendTo($("#third_large"));
		$("<div/>", { "id": "menuimage7", class: "col-3" })
			.append($("<a/>").append($("<p/>")).append($("<img/>",{style:'margin-left:10px;height:80%'})))
			.appendTo($("#third_large"));
		$("<div/>", { "id": "menuimage8", class: "col-3" })
			.append($("<a/>").append($("<p/>")).append($("<img/>",{style:'margin-left:10px;height:80%'})))
			.appendTo($("#third_large"));*/
	
	
	} else if (event.currentTarget.innerText == "BRANDS") {
		$("<div/>", { class: 'col-3', id:'navBrands'}).append($("<ul/>")).appendTo($("#third_large"));
			
		$.ajax({
			type: 'post',
			url: '/product/getNavBrandProductCategoryDTO',
			dataType: 'json',
			success: function(data) {
				console.log(data.brandCategory);
				
				$.each(data.brandCategory, function(index,item){
					$("#navBrands ul").
						append($("<li/>")
							.append($("<a/>", { text: item.product_category_name, href: "/product/list-brand?product_category_num=" + item.product_category_num}))
					)
				});
				$("#navBrands").appendTo($("#third_large"));
				
				
				$.each(data.threeProductCategoryDTO, function(index,item){
					let fileCallPath = encodeURIComponent(item.fileList[0].uploadPath + "/" + item.fileList[0].uuid + "_" +  item.fileList[0].fileName);
					$("<div/>", { "id": "menuimage" + index, class: "col-3" })
						//.append($("<a/>").append($("<p/>")).append($("<img/>",{style:'margin-left:10px;height:80%', src: '/file/display?fileName=/' + fileCallPath})))
						.append($("<a/>", {href: '/product/list-brand?product_category_num=' + item.product_category_num}).append($("<p/>")).append($("<img/>",{style:'margin-left:10px;height:80%', src: '/file/display?fileName=/' + fileCallPath})))
						.append($("<a/>", {href: '/product/list-brand?product_category_num=' + item.product_category_num}).append($("<p/>", {text: item.product_category_name})))
						.appendTo($("#third_large"));	
				});
			},
			error: function(err) {
				console.log(err)
			}
		}); //end ajax
			
	} else if (event.currentTarget.innerText == "POST") {
		
		//반복문. 4개의 포스트 정보 가져와서 2번 반복하게 할 것. 
		$.ajax({
			type: 'post',
			url: '/board/getNavPostBoardDTO',
			dataType: 'json',
			success: function(data) {
				console.log(data);
				$.each(data, function(index,item){
					
					let fileCallPath = encodeURIComponent(item.fileList[0].uploadPath + "/" + item.fileList[0].uuid + "_" +  item.fileList[0].fileName);
					$("<div/>", { "id": "menuimage" + index, class: "col-3" })
						.append($("<a/>", {href: '/board/get?board_category_num=7&board_num=' + item.board_num}).append($("<p/>")).append($("<img/>",{style:'margin-left:10px;height:80%', src: '/file/display?fileName=/' + fileCallPath})))
						.append($("<a/>").append($("<p/>", {text: item.subject})))
						.appendTo($("#third_large"));	
				});
			},
			error: function(err) {
				console.log(err)
			}
		}); //end ajax
	}

	$("li a").mouseenter(function(event) {
		event.currentTarget.setAttribute(
			"style",
			"color:gray;text-decoration:underline"
		);
	});
	
	$("li a").mouseleave(function(event) {
		event.currentTarget.setAttribute("style", "color:black");
	});
	
	/*$.ajax({
		type: 'post',
		url: '/getNavImg',
		success: function(data) {
			$.each(data,function(index,item){
				if($('#'+item.menu).length!=0){
					$('#'+item.menu+' img').attr('src','/storage/menu/'+item.stored_thumbnail);
				}
			})
		},
		error: function(err) {
			console.log(err)
		}
	});*/
});

$("nav").mouseleave(function() {
	$("#third_large").attr("style", "display:none");
});


$(".search").click(function() {
	$("#fourth ").animate({ height: "toggle" }, 300, "linear");
});
$("#searchCloseBtn").click(function() {
	$("#fourth").animate({ height: "toggle" }, 200, "linear");
});


$(window).resize(function() {
	if (window.innerWidth < 810) {
		$('#second_large').hide();
		$('#second_small').show();
		$('#third_large').hide();
		$('#third_small').hide();
	} else {
		$('#second_large').show();
		$('#second_small').hide();
		$('#third_large').hide();
		$('#third_small').hide();
	}
});

$('#menu').hover(function() {
	$('#menu i').toggleClass("fa-bars fa-bars-staggered");
});
$("#menu").click(function() {
	$("#third_small").toggle();
});
$("#account").hover(function() {
	$("#account_drop").css("display", "block");
});
$("#account_drop").mouseleave(function() {
	$("#account_drop").css("display", "none");
});

//카카오로그아웃  
$('.logoutBtn').click(function() {
	kakaoLogout();
	$.ajax({
		type: 'post',
		url: '/member/logout',
		success: function() {
			Swal.fire({
				icon: 'success',
				title: '로그아웃 되었습니다',
				closeOnClickOutside: false
			}).then(function() {
				location.href = '/';
			});


		},

		error: function(err) {
			alert(err);
		}
	});
});

$('input[id="keyword"]').keydown(function(event) {
	//Javascript 키보드 키코드 값.. enter는 13이다. 
	if (event.keyCode === 13) {
		if ($('#keyword').val() === '') {
			event.preventDefault();
			Swal.fire({
				icon: 'warning',
				title: '검색어를 입력하세요!',
			});
		}
	};
});

$('.cart').click(function() {
	location.href = '/order/cart'
})

