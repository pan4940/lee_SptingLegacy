$(".bread_container ul li a").mouseover(function (event) {
	console.log(event.target.innerText);
	$('#img1').attr('src','');
	$('#img1').attr('src','/storage/'+event.target.innerText+'.jpg');
	$('#breadImg').css('display','block');
});
$(".bread_container ul li a").mouseleave(function () {
	$('#breadImg').css('display','none');
});


