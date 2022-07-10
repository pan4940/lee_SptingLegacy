<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>Product Page - Admin HTML Template</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700" />
<!-- https://fonts.google.com/specimen/Roboto -->
<link rel="stylesheet" href="/resources/admin/css/fontawesome.min.css" />
<!-- https://fontawesome.com/ -->
<link rel="stylesheet" href="/resources/admin/css/bootstrap.min.css" />
<!-- https://getbootstrap.com/ -->
<link rel="stylesheet" href="/resources/admin/css/templatemo-style.css">
<!--
	Product Admin CSS Template
	https://templatemo.com/tm-524-product-admin
	-->
</head>

<body id="reportsPage">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<jsp:include page="/WEB-INF/views/admin/nav.jsp"/>
	
	<div class="container mt-5">
		<div class="row tm-content-row">
			<div class="col-sm-12 col-md-12 col-lg-8 col-xl-8 tm-block-col">
				<div class="tm-bg-primary-dark tm-block tm-block-products">

					<!-- 검색부 -->
					<form id="searchForm">
					<div class="form-group mb-3">
							<div class="form-group mb-3">
								
								<label for="category">카테고리1</label> 
									<select class="custom-select tm-select-accounts" id="cateCode1" name="cateCode1">
									<option selected value="">Select category</option>
								</select>
							</div>
	
							<div class="form-group mb-3">
								<label for="category">카테고리2</label> 
								<select
									class="custom-select tm-select-accounts" id="cateCode2" name="cateCode2">
									<option selected value="0">Select category</option>
								</select>
							</div>
	
							<div class="form-group mb-3">
								<label for="category">카테고리3</label> 
								<select
									class="custom-select tm-select-accounts" id="cateCode3" name="cateCode3">
									<option selected value="0">Select category</option>
								</select>
							</div>
	
							<div class="form-group mb-3">
								<label for="category">브랜드 카테고리</label> <select
									class="custom-select tm-select-accounts" id="brandCategory" name="brandCategory">
									<option selected value="0">Select category</option>
									<c:forEach items="${list}" var="productCategoryDTO">
										<option value="${productCategoryDTO.product_category_num}">${productCategoryDTO.product_category_name}</option>
									</c:forEach>
									
								</select>
							</div>
						<button id="search_Btn" class="btn btn-primary btn-block text-uppercase">상품 검색</button>

					</div>
					</form>
					
					<!-- 검색 결과창 -->
					<form id="deleteProducts">
					<div class="tm-product-table-container">

						<table class="table table-hover tm-table-small tm-product-table">
							<thead>
								<tr>
									<th scope="col">&nbsp;</th>
									<th scope="col">상품명</th>
									<th scope="col">브랜드명</th>
									<th scope="col">가격</th>
									<th scope="col">입고일</th>
									<th scope="col">&nbsp;</th>
								</tr>
							</thead>
							
								<tbody id="searchResult">
								
								</tbody>
						</table>
					</div>
					</form>
					<!-- table container -->
					<a href="/admin/addProduct" class="btn btn-primary btn-block text-uppercase mb-3">새 상품 등록</a>
					<button id="delete_Btn" class="btn btn-primary btn-block text-uppercase">선택 상품 삭제</button>
				</div>
			</div>
			<div class="col-sm-12 col-md-12 col-lg-4 col-xl-4 tm-block-col">
				<div class="tm-bg-primary-dark tm-block tm-block-product-categories">
					<h2 class="tm-block-title">브랜드 카테고리</h2>
					<div class="tm-product-table-container">
						<table class="table tm-table-small tm-product-table">
							<tbody id="brandList">
								<c:forEach items="${list}" var="productCategoryDTO">
									<tr>
										<td class="tm-brand-name"
											data-id="${productCategoryDTO.product_category_num}">
											${productCategoryDTO.product_category_name}</td>
										<td class="text-center"><a
											href="/admin/deleteCategory?product_category_num=${productCategoryDTO.product_category_num}"
											class="tm-product-delete-link"> <i
												class="far fa-trash-alt tm-product-delete-icon"></i>
										</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- table container -->

					<a href="/admin/addCategory"
						class="btn btn-primary btn-block text-uppercase mb-3">Add new
						category</a>

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
	
	$(".tm-brand-name").on("click", function(e) {
		e.preventDefault();
		console.log(this.id);
		window.location.href = "/admin/editProduct?product_category_num=" + this.dataset.id;
	});
	
	
});

$("#search_Btn").on("click", function(e){
	e.preventDefault();
	console.log($("#searchForm").serialize())
	$.ajax({
		type: 'post',
		headers: {"X-CSRF-TOKEN": $("input[name='_csrf']").val()},
		data: $("#searchForm").serialize(),
		url: '/admin/getProductByCategory',
		dataType: 'json',
		success: function(result){
			productList = result;
			console.log(productList);
			if (productList.length === 0) {
				alert("검색된 상품이 없습니다.");
				window.location.href = "/admin/products";
			}
			$("#searchResult").children().remove();
			
			$.each(result, function(index, item){
				$("#searchResult").append(
					"<tr>" + 
					"<th scope='row'><input type='checkbox' id='checkProduct_num' name='product_num' value='" + item.product_num + "'/></th>" + 
					"<td class='tm-product-name'><a class='move' href='" + item.product_num +"'>" + item.product_name + "</a></td>"+
					"<td>" + item.brand_name + "</td>"+
					"<td>" + item.brandCategory + "</td>"+
					"<td>" + item.regDate + "</td>"+
					"<td><a href='/admin/deleteProduct?product_num=" + item.product_num + "' class='tm-product-delete-link'><i class='far fa-trash-alt tm-product-delete-icon'></i></a></td>" +
					"</tr>"
				);
			});
		},
		error: function(e) {
			console.log(e);
		}
	});
});

$("#delete_Btn").on("click", function(e){
	e.preventDefault();
	console.log($("#deleteProducts").serialize());
	$.ajax({
		type: 'post',
		headers: {"X-CSRF-TOKEN": $("input[name='_csrf']").val()},
		data: $("#deleteProducts").serialize(),
		url: '/admin/deleteProducts',
		dataType: 'json',
		success: function(){
			
		},
		error: function(e) {
			console.log(e);
		}
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
		
		cate2Select.append("<option selected value='0'>Select category</option>");
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
 	
	cate3Select.append("<option selected value='0'>Select category</option>");
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