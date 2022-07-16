<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>브랜드 카테고리 추가</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700" />
<!-- https://fonts.google.com/specimen/Roboto -->
<link rel="stylesheet" href="/resources/admin/css/fontawesome.min.css" />
<!-- https://fontawesome.com/ -->
<link rel="stylesheet" href="/resources/admin/jquery-ui-datepicker/jquery-ui.min.css" type="text/css" />
<!-- http://api.jqueryui.com/datepicker/ -->
<link rel="stylesheet" href="/resources/admin/css/bootstrap.min.css" />
<!-- https://getbootstrap.com/ -->
<link rel="stylesheet" href="/resources/admin/css/templatemo-style.css">
<!--
	Product Admin CSS Template
	https://templatemo.com/tm-524-product-admin
	-->
</head>

<body>
	<jsp:include page="/WEB-INF/views/admin/nav.jsp"/>
	<div class="container tm-mt-big tm-mb-big">
		<div class="row">
			<div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
				<div class="tm-bg-primary-dark tm-block tm-block-h-auto">
					<div class="row">
						<div class="col-12">
							<h2 class="tm-block-title d-inline-block">브랜드 카테고리 추가</h2>
						</div>
					</div>
					<form id="registerBrandCategoryForm" method="post" action="" class="tm-edit-product-form">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<div class="row tm-edit-product-row">
						<div class="col-xl-6 col-lg-6 col-md-12">
								<div class="form-group mb-3">
									<label for="name">브랜드명</label> 
									<input id="product_category_name" name="product_category_name" type="text" class="form-control validate" required />
									<input id="product_category_num_ref" name="product_category_num_ref" type="hidden" value="10000"/>
								</div>
								<div class="form-group mb-3">
									<label for="description">설명</label>
									<textarea class="form-control validate"
										id="product_category_descrip" name="product_category_descrip"
										rows="3" required></textarea>
								</div>
						</div>

						<!-- 이미지 업로드 부분 -->
						<div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4">
							<div class="tm-product-img-dummy mx-auto">
								<i class="fas fa-cloud-upload-alt tm-upload-icon"
									onclick="document.getElementById('fileInput').click();"></i>
							</div>



							<div class="custom-file mt-3 mb-3 uploadDiv">
								<input id="fileInput" name="uploadFile" type="file" style="display: none;" multiple /> 
								<input type="button" class="btn btn-primary btn-block mx-auto" value="이미지 업로드" onclick="document.getElementById('fileInput').click();" />
							</div>
							<div class="custom-file mb-3 uploadResult" style="height:100px">
								<ul>
								</ul>
							</div>

							<div class="bigPictureWrapper">
								<div class="bigPicture"></div>
							</div>
						</div>
						<div class="col-12">
							<button type="submit" class="btn btn-primary btn-block text-uppercase">브랜드 카테고리 추가</button>
						</div>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<footer class="tm-footer row tm-mt-small">
		<div class="col-12 font-weight-light">
			<p class="text-center text-white mb-0 px-4 small">
				Copyright &copy; <b>2018</b> All rights reserved. Design: <a
					rel="nofollow noopener" href="https://templatemo.com"
					class="tm-footer-link">Template Mo</a>
			</p>
		</div>
	</footer>

	<script src="/resources/admin/js/jquery-3.3.1.min.js"></script>
	<!-- https://jquery.com/download/ -->
	<script src="/resources/admin/jquery-ui-datepicker/jquery-ui.min.js"></script>
	<!-- https://jqueryui.com/download/ -->
	<script src="/resources/admin/js/bootstrap.min.js"></script>
	<!-- https://getbootstrap.com/ -->
<script>
$(function() {
	$("#expire_date").datepicker();
});

//파일 업로드 관련
//글쓰기 버튼 클릭시 이벤트
$("button[type='submit']").on("click", function(e){
	e.preventDefault();
	console.log("product category register......");
 	let str = ""
 	
 	$(".uploadResult ul li").each(function(i, obj) {
    	let jobj = $(obj);
    	console.log(jobj);

    	str += "<input type='hidden' name='fileList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
     	str += "<input type='hidden' name='fileList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
     	str += "<input type='hidden' name='fileList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
     	console.log(str);
 	});
 
 	$("#registerBrandCategoryForm").append(str);
 
 	$.ajax({
		type:'post',
		url:'/admin/registerBrandCategory',
		headers: {"X-CSRF-TOKEN": $("input[name='_csrf']").val()},
		data: $('#registerBrandCategoryForm').serialize(),
		//success: function() {	
		success: function() {
			alert("브랜드 카테고리 등록");
			location.href = "/admin/addCategory";
	    },
    	error: function(err) {
        	 console.log(err);
     	},
	}); //end ajax 
});


//let regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
let regex = new RegExp("(.*?)\.(png|bmp|jpeg|jpg)$");
let maxSize = 1024 * 1024 * 5; //5MB

//파일 사이즈와 종류 확인
function checkExtension(fileName, fileSize) {
	if(fileSize >= maxSize){
		alert("파일 사이즈 초과");
    	return false;
 	}

 	if (!regex.test(fileName)) {
  		alert("해당 종류의 파일은 업로드 할 수 없습니다.");
 		return false;
	}
 	return true;
}

let cloneObj = $(".custom-file mt-3 mb-3 uploadDiv").clone();


//파일 업로드
$("input[type='file']").change(function(e){
	let formData = new FormData();
	let inputFile = $("input[name='uploadFile']");
 
	let files = inputFile[0].files;
 
 	//add file to formdata
 	for (let i = 0; i < files.length; i++) {
    	if(!checkExtension(files[i].name, files[i].size)){
       		return false;
    	}
    	formData.append("uploadFile", files[i]);
 	}
 
 	console.log(formData);
 	
 	$.ajax({
    	url: '/file/brandfileUploadAjax',
    	headers: {"X-CSRF-TOKEN": $("input[name='_csrf']").val()},
    	processData: false, // data 파라미터로 전달된 데이터를 Query String으로 변환하지 않음. 파일전송시에는 이렇게 해야함
    	contentType: false, // //contentType의 default는 application/x-www-form-urlencoded; charset=UTF-8, 파일전송시에는 false로 해줘야 함
    	data: formData,
    	type: 'post',
    	dataType: 'json',
	    success: function(result) {
    		console.log(result);
       		showUploadedFile(result);   
       		//$(".uploadDiv").html(cloneObj.html());
    	},
 	});
});


let uploadResult = $(".uploadResult ul");
console.log(uploadResult);
function showUploadedFile(uploadResultArr){
 
	if(!uploadResultArr || uploadResultArr.length == 0) {return;}
 
	let str = "";
 
 	$(uploadResultArr).each(function(i, obj){
	    /* console.log(obj.uploadPath);
	    console.log(obj.uuid);
	    console.log(obj.fileName); */
	    uploadPath = obj.uploadPath;
	    let fileCallPath = encodeURIComponent(obj.uploadPath + "/" +obj.uuid + "_" + obj.fileName);
	    let originPath = obj.uploadPath + "\\" +obj.uuid + "_" + obj.fileName;
	    originPath = originPath.replace(new RegExp(/\\/g), "/");
	    uploadPath = uploadPath.replace(new RegExp(/\\/g), "/");
	    console.log("fileCallPath : " + fileCallPath);
	    console.log("originPath : " + originPath);
	    console.log("uploadPath : " + uploadPath);
	    //str +="<li data-path='" +  obj.uploadPath + "' data-uuid='" + obj.uuid + "'data-filename='" + obj.fileName + "'data-linked_num='" + obj.uploadPath +"'>";
	    str +="<li data-path='" +  uploadPath + "' data-uuid='" + obj.uuid + "'data-filename='" + obj.fileName + "'data-linked_num='" + obj.uploadPath +"'>";
	    str +="<div>"
	    str +="<span>" + obj.fileName +"</span>"
        str +="<button type='button' data-file=\'" + fileCallPath + "\' data-type='image'> X </button><br>";
        str +="<a href=\"javascript:showImage(\'" + originPath + "\')\">"
        str +="<img src='/file/display?fileName=/" + fileCallPath + "'>";
        str +="</a>";
    	str +="</div>"
 		str +="</li>";
    	//console.log(str);
 	});
 	uploadResult.append(str);
}
 

//이미지 클릭시 확대
function showImage(fileCallPath){
 	console.log(fileCallPath)
 	$(".bigPictureWrapper").css("display", "flex").show();
	$(".bigPicture").html("<img src='/file/display?fileName=/" + fileCallPath + "'>")
		.animate({width: '100%', height: '100%'}, 0);
}

//확대 이미지 가리기
$(".bigPictureWrapper").on("click", function(e){
	$(".bigPicture").animate({width: '0%', height: '0%'}, 0);
 	$(".bigPictureWrapper").hide();
});


//X버튼 클릭시 이미지 삭제
$(".uploadResult").on("click", "button", function(e){

 	let targetFile = $(this).data("file");
	console.log("targetFile : " + targetFile);
		 
 	let targetLi = $(this).closest("li");
 
	$.ajax({
	    url: '/file/deleteFile',
	    headers: {"X-CSRF-TOKEN": $("input[name='_csrf']").val()},
	    data: {fileName: targetFile},
	    dataType: 'text',
	    type: 'POST',
	    success: function(result){
	       alert(result);
	       targetLi.remove();
	    },
	});
});

</script>
</body>
</html>
