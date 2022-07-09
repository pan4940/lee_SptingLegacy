<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>Add Product - Dashboard HTML Template</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:400,700" />
<!-- https://fonts.google.com/specimen/Roboto -->
<link rel="stylesheet" href="/resources/admin/css/fontawesome.min.css" />
<!-- https://fontawesome.com/ -->
<link rel="stylesheet"
	href="/resources/admin/jquery-ui-datepicker/jquery-ui.min.css"
	type="text/css" />
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
							<h2 class="tm-block-title d-inline-block">상품 등록</h2>
						</div>
					</div>
					<form id="registerBrandCategoryForm" method="post" action=""
						class="tm-edit-product-form">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<div class="row tm-edit-product-row">
							<div class="col-xl-6 col-lg-6 col-md-12">
								<form action="" class="tm-edit-product-form">
									<div class="form-group mb-3">
										<label for="name">상품명</label> 
										<input id="name" name="name" type="text" class="form-control validate" />
									</div>
									<div class="form-group mb-3">
										<label for="description">상품 설명</label>
										<textarea class="form-control validate" rows="3"></textarea>
									</div>
									<div class="form-group mb-3">
										<label for="category">카테고리1</label> 
										<select class="custom-select tm-select-accounts" id="cateCode1" name="cateCode1">
											<option selected value="">Select category</option>
										</select>
									</div>

									<div class="form-group mb-3">
										<label for="category">카테고리2</label> 
										<select class="custom-select tm-select-accounts" id="cateCode2" name="cateCode2">
										</select>
									</div>

									<div class="form-group mb-3">
										<label for="category">카테고리3</label> 
										<select class="custom-select tm-select-accounts" id="cateCode3" name="cateCode3">
										</select>
									</div>

									<div class="form-group mb-3">
										<label for="category">브랜드 카테고리</label> 
										<select class="custom-select tm-select-accounts" id="category">
											<option selected value="">Select category</option>
											<c:forEach items="${list}" var="productCategoryDTO">
												<option value="${productCategoryDTO.product_category_num}">${productCategoryDTO.product_category_name}</option>
											</c:forEach>
										</select>
									</div>
									<div class="row">
										<div class="form-group mb-3 col-xs-12 col-sm-6">
											<label for="expire_date">Expire Date</label> <input
												id="expire_date" name="expire_date" type="text"
												class="form-control validate" data-large-mode="true" />
										</div>
										<div class="form-group mb-3 col-xs-12 col-sm-6">
											<label for="stock">Units In Stock </label> <input id="stock"
												name="stock" type="text" class="form-control validate" />
										</div>
									</div>
							</div>
							<div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4">
								<div class="tm-product-img-dummy mx-auto">
									<i class="fas fa-cloud-upload-alt tm-upload-icon"
										onclick="document.getElementById('fileInput').click();"></i>
								</div>
								<div class="custom-file mt-3 mb-3">
									<input id="fileInput" type="file" style="display: none;" /> <input
										type="button" class="btn btn-primary btn-block mx-auto"
										value="UPLOAD PRODUCT IMAGE"
										onclick="document.getElementById('fileInput').click();" />
								</div>
							</div>
							<div class="col-12">
								<button type="submit"
									class="btn btn-primary btn-block text-uppercase">Add
									Product Now</button>
							</div>
					</form>
				</div>
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

let ProductsCategoryList;
var cate1Arr = new Array();
var cate1Obj = new Object();


$(function() {
	$.ajax({
		type: 'post',
		headers: {"X-CSRF-TOKEN": $("input[name='_csrf']").val()},
		url: '/product/getProductCategoryList',
		dataType: 'json',
		success: function(result){
			ProductsCategoryList = result;
			getBrandCategory(ProductsCategoryList);
		},
	});
 
});

$(document).on("change", "select#cateCode1", function(){
	change1();
});

$(document).on("change", "select#cateCode2", function(){
	change2();
});

function change1(){
	// 필요한 배열과 오브젝트 변수를 생성
	console.log("change cateCode1")
	var cate2Arr = new Array();
	var cate2Obj = new Object();
	
	// 2차 분류 셀렉트 박스에 삽입할 데이터 준비
	for(var i = 0; i < ProductsCategoryList.length; i++) {
		
		if(ProductsCategoryList[i].level == "2") {  // 레빌이 2인 데이터가 있다면
			cate2Obj = new Object();  // 초기화
			
			// cate2Obj에 cateCode, cateName, cateCodeRef를 저장
			cate2Obj.product_category_num = ProductsCategoryList[i].product_category_num;
			cate2Obj.product_category_name = ProductsCategoryList[i].product_category_name;
			cate2Obj.product_category_num_ref = ProductsCategoryList[i].product_category_num_ref;
			
			// cate2Obj에 저장된 값을 cate1Arr 배열에 저장
			cate2Arr.push(cate2Obj);
		} 
	}
	
	var cate1Select = $("#cateCode1");
	var cate2Select = $("#cateCode2");
	
	cate2Select.children().remove();
	// cate2Select의 값을 제거함(초기화)
 
	// cate1Select에서 선택한 값을 기준으로 cate2Select의 값을 조정
	$("option:selected", cate1Select).each(function(){
		var selectVal = cate1Select.val();  // 현재 선택한 cate1Select의 값을 저장
		//cate2Select.append("<option value='" + selectVal + "'>전체</option>");  // cate2Select의 '전체'에 현재 선택한 cate1Select와 같은 값 부여
		// cate2Arr의 데이터를 cate2Select에 추가
		
		cate2Select.append("<option selected value=''>Select category</option>");
		for(var i = 0; i < cate2Arr.length; i++) {
			// 현재 선택한 cate1Select의 값과 일치하는 cate2Arr의 데이터를 가져옴
			if(selectVal == cate2Arr[i].product_category_num_ref) {
				cate2Select.append("<option value='" + cate2Arr[i].product_category_num + "'>"
									+ cate2Arr[i].product_category_name + "</option>");
			}
		}		
	});
}

function change2(){
	console.log("change cateCode2")
	// 필요한 배열과 오브젝트 변수를 생성
	var cate3Arr = new Array();
	var cate3Obj = new Object();
	
	// 2차 분류 셀렉트 박스에 삽입할 데이터 준비
	for(var i = 0; i < ProductsCategoryList.length; i++) {
		
		if(ProductsCategoryList[i].level == "3") {  // 레빌이 2인 데이터가 있다면
			cate3Obj = new Object();  // 초기화
			
			// cate2Obj에 cateCode, cateName, cateCodeRef를 저장
			cate3Obj.product_category_num = ProductsCategoryList[i].product_category_num;
			cate3Obj.product_category_name = ProductsCategoryList[i].product_category_name;
			cate3Obj.product_category_num_ref = ProductsCategoryList[i].product_category_num_ref;
			
			// cate2Obj에 저장된 값을 cate1Arr 배열에 저장
			cate3Arr.push(cate3Obj);
		} 
	}
	
	var cate2Select = $("#cateCode2");
	var cate3Select = $("#cateCode3");
	
	// cate3Select의 값을 제거함(초기화)
	cate3Select.children().remove();
 	
	cate3Select.append("<option selected value=''>Select category</option>");
	$("option:selected", cate2Select).each(function(){
		var selectVal = cate2Select.val();  
	
		for(var i = 0; i < cate3Arr.length; i++) {
			if(selectVal == cate3Arr[i].product_category_num_ref) {
				cate3Select.append("<option value='" + cate3Arr[i].product_category_num + "'>"
									+ cate3Arr[i].product_category_name + "</option>");
			}
		}		
	});
}

function getBrandCategory(ProductsCategoryList){
	for(var i = 0; i < ProductsCategoryList.length; i++) {
		
		if(ProductsCategoryList[i].level == "1") {  // 레벨이 1인 데이터가 있다면 
			cate1Obj = new Object();  // 초기화
			
			// cate1Obj에 cateCode와 cateName를 저장
			cate1Obj.product_category_num = ProductsCategoryList[i].product_category_num; 
			cate1Obj.product_category_name = ProductsCategoryList[i].product_category_name;
			
			// cate1Obj에 저장된 값을 cate1Arr 배열에 저장
			cate1Arr.push(cate1Obj);
		}
	}

	// 1차 분류 셀렉트 박스에 데이터 삽입
	var cate1Select1 = $("#cateCode1");

	for(var i = 0; i < cate1Arr.length; i++) {

		// cate1Arr에 저장된 값을 cate1Select에 추가
		cate1Select1.append("<option value='" + cate1Arr[i].product_category_num + "'>"
							+ cate1Arr[i].product_category_name + "</option>");	
	}
	
	var cate1Select2 = $("select.cateCode1")

	for(var i = 0; i < cate1Arr.length; i++) {

		// cate1Arr에 저장된 값을 cate1Select에 추가
		cate1Select2.append("<option value='" + cate1Arr[i].product_category_num + "'>"
							+ cate1Arr[i].product_category_name + "</option>");	
	}
};
</script>
</body>
</html>
