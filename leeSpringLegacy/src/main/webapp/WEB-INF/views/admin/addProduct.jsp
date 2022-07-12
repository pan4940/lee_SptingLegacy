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
					<form id="registerProductForm" method="post" action=""
						class="tm-edit-product-form">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<div class="row tm-edit-product-row">
							<div class="col-xl-6 col-lg-6 col-md-12">
								<form action="" class="tm-edit-product-form">
									<div class="form-group mb-3">
										<label for="name">상품명</label> 
										<input id="product_name" name="product_name" type="text" class="form-control validate" />
										<input type="hidden" id="brand_name" name="brand_name" value="">
									</div>
									<div class="form-group mb-3">
										<label for="name">가격</label> 
										<input id="product_price" name="product_price" type="text" class="form-control validate" />
									</div>
									<div class="form-group mb-3">
										<label for="description">상품 설명</label>
										<textarea name="product_descrip" class="form-control validate" rows="3"></textarea>
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
										<select class="custom-select tm-select-accounts" id="brandCategory" name="brandCategory">
											<option selected value="">Select category</option>
											<c:forEach items="${list}" var="productCategoryDTO">
												<option value="${productCategoryDTO.product_category_num}">${productCategoryDTO.product_category_name}</option>
											</c:forEach>
										</select>
									</div>
									<!-- <div class="row">
										<div class="form-group mb-3 col-xs-12 col-sm-6">
											<label for="expire_date">Expire Date</label> <input
												id="expire_date" name="expire_date" type="text"
												class="form-control validate" data-large-mode="true" />
										</div>
										<div class="form-group mb-3 col-xs-12 col-sm-6">
											<label for="stock">Units In Stock </label> <input id="stock"
												name="stock" type="text" class="form-control validate" />
										</div>
									</div> -->
							</div>
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
								<div class="form-group mb-3">
									<label for="name">사이즈 정보</label> 
								</div>
								<div class="tm-product-table-container">
									<!-- 상의 상품 -->
									<table class="table table-hover tm-table-small tm-product-table top">
										<thead>
											<tr>
												<th scope="col">사이즈명</th>
												<th scope="col">기장</th>
												<th scope="col">어깨</th>
												<th scope="col">가슴</th>
												<th scope="col">소메</th>
												<th scope="col">수량(개)</th>
												<th scope="col"></th>
												<th scope="col"></th>
											</tr>
										</thead>
										
										<tbody id="searchResultTop">
											<tr>
												<td><input type="text" id="product_size" name="productSizeList[0].product_size" value="" style="width:85%"></td>
												<td><input type="text" id="product_top_length" name="productSizeList[0].product_top_length" value="" style="width:85%"></td>
												<td><input type="text" id="product_shoulder" name="productSizeList[0].product_shoulder" value="" style="width:85%"></td>
												<td><input type="text" id="product_chest" name="productSizeList[0].product_chest" value="" style="width:85%"></td>
												<td><input type="text" id="product_sleeve" name="productSizeList[0].product_sleeve" value="" style="width:85%"></td>
												<td><input type="productAmount" id="productAmount" name="productAmount" value="" style="width:85%"></td>
												<td><button type="button" class="btn btn-default btn-sm" onclick="addSearchKey('Top')"> 
										        	행추가
										        </button></td>
										        <td><button type="button" class="btn btn-default btn-sm" onclick="delSearchKey(this)">
										          	행삭제
										        </button></td>
											</tr>
										</tbody>
									</table>
									
									<!-- 하의 상픔  -->
									<table class="table table-hover tm-table-small tm-product-table bottom">
										<thead>
											<tr>
												<th scope="col">사이즈명</th>
												<th scope="col">허리</th>
												<th scope="col">허벅지</th>
												<th scope="col">기장</th>
												<th scope="col">밑단</th>
												<th scope="col">밑위</th>
												<th scope="col">수량(개)</th>
												<th scope="col"></th>
												<th scope="col"></th>
											</tr>
										</thead>
										
										<tbody id="searchResultBottom">
											<tr>
												<td><input type="text" id="product_size" name="productSizeList[0].product_size" value="" style="width:85%"></td>
												<td><input type="text" id="product_waist_width" name="productSizeList[0].product_waist_width" value="" style="width:85%"></td>
												<td><input type="text" id="product_thigh_width" name="productSizeList[0].product_thigh_width" value="" style="width:85%"></td>
												<td><input type="text" id="product_bottom_length" name="productSizeList[0].product_bottom_length" value="" style="width:85%"></td>
												<td><input type="text" id="product_ankle_circumference" name="productSizeList[0].product_ankle_circumference" value="" style="width:85%"></td>
												<td><input type="text" id="product_front_rise" name="productSizeList[0].product_front_rise" value="" style="width:85%"></td>
												<td><input type="text" id="productAmount" name="productAmount" value="" style="width:85%"></td>
												<td><button type="button" class="btn btn-default btn-sm" onclick="addSearchKey('Bottom')"> 
										        	행추가
										        </button></td>
										        <td><button type="button" class="btn btn-default btn-sm" onclick="delSearchKey(this)">
										          	행삭제
										        </button></td>
											</tr>
										</tbody>
									</table>
									
									
									<!-- 모자 상품  -->
									<table class="table table-hover tm-table-small tm-product-table cap">
										<thead>
											<tr>
												<th scope="col">사이즈명</th>
												<th scope="col">챙길이</th>
												<th scope="col">챙둘레</th>
												<th scope="col">깊이</th>
												<th scope="col">수량(개)</th>
												<th scope="col"></th>
												<th scope="col"></th>
											</tr>
										</thead>
										
										<tbody id="searchResultCap">
											<tr>
												<td><input type="text" id="product_size" name="productSizeList[0].product_size" value="" style="width:85%"></td>
												<td><input type="text" id="product_cap_length" name="productSizeList[0].product_cap_length" value="" style="width:85%"></td>
												<td><input type="text" id="product_cap_circumference" name="productSizeList[0].product_cap_circumference" value="" style="width:85%"></td>
												<td><input type="text" id="product_cap_depth" name="productSizeList[0].product_cap_depth" value="" style="width:85%"></td>
												<td><input type="text" id="productAmount" name="productAmount" value="" style="width:85%"></td>
												<td><button type="button" class="btn btn-default btn-sm" onclick="addSearchKey('Top')"> 
										        	행추가
										        </button></td>
										        <td><button type="button" class="btn btn-default btn-sm" onclick="delSearchKey(this)">
										          	행삭제
										        </button></td>
											</tr>
										</tbody>
									</table>
									
									
									<!-- 기타 상품  -->
									<table class="table table-hover tm-table-small tm-product-table etc">
										<thead>
											<tr>
												<th scope="col">사이즈명</th>
												<th scope="col">수량(개)</th>
												<th scope="col"></th>
												<th scope="col"></th>
											</tr>
										</thead>
										
										<tbody id="searchResultETC">
											<tr>
												<td><input type="text" id="productSizeList[0].product_size" name="product_size" value="" style="width:100%"></td>
												<td><input type="text" id="productAmount" name="productAmount" value="" style="width:85%"></td>
												<td><button type="button" class="btn btn-default btn-sm" onclick="addSearchKey('ETC')"> 
										        	행추가
										        </button></td>
										        <td><button type="button" class="btn btn-default btn-sm" onclick="delSearchKey(this)">
										          	행삭제
										        </button></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="col-12">
								<button type="submit" class="btn btn-primary btn-block text-uppercase">상품 추가</button>
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
var regExpNum = /[^0-9]/gi;
$("#product_price").keyup(function(){ numCheck($(this)); });

function numCheck(selector) {
	var tempVal = selector.val();
	selector.val(tempVal.replace(regExpNum, ""));
}

let i = 1;

function addSearchKey(key){
	console.log(key);
	
	let str;
	if (key === 'Top') {
		str += "<tr>";
		str += "<td><input type='text' id='product_size' name='productSizeList[" + i + "].product_size' value='' style='width:85%'></td>";
		str += "<td><input type='text' id='product_top_length' name='productSizeList[" + i + "].product_top_length' value='' style='width:85%'></td>";
		str += "<td><input type='text' id='product_shoulder' name='productSizeList[" + i + "].product_shoulder' value='' style='width:85%'></td>";
		str += "<td><input type='text' id='product_chest' name='productSizeList[" + i + "].product_chest' value='' style='width:85%'></td>";
		str += "<td><input type='text' id='product_sleeve' name='productSizeList[" + i + "].product_sleeve' value='' style='width:85%'></td>";
		str += "<td><input type='text' id='productAmount' name='productAmount' value='' style='width:85%'></td>";
		str += "<td><button type='button' class='btn btn-default btn-sm' onclick='addSearchKey('" + "Top" + "')>행추가</button></td>"; 
		str += "<td><button type='button' class='btn btn-default btn-sm' onclick='delSearchKey(this)'>행삭제</button></td>";
		str += "</tr>";
	} else if (key === 'Bottom') {
		str += "<tr>";
	    str += "<td><input type='text' id='product_size' name='productSizeList.product_size' value='' style='width:85%'></td>";
	    str += "<td><input type='text' id='product_waist_width' name='productSizeList.product_waist_width' value='' style='width:85%'></td>";
	    str += "<td><input type='text' id='product_thigh_width' name='productSizeList.product_thigh_width' value='' style='width:85%'></td>";
	    str += "<td><input type='text' id='product_bottom_length' name='productSizeList.product_bottom_length' value='' style='width:85%'></td>";
	    str += "<td><input type='text' id='product_ankle_circumference' name='productSizeList.product_ankle_circumference' value='' style='width:85%'></td>";
	    str += "<td><input type='text' id='product_front_rise' name='productSizeList.product_front_rise' value='' style='width:85%'></td>";
	    str += "<td><input type='text' id='productAmount' name='productAmount' value='' style='width:85%'></td>";
	    str += "<td><button type='button' class='btn btn-default btn-sm' onclick='addSearchKey('" + "Bottom" + "')>행추가</button></td>"; 
	    str += "<td><button type='button' class='btn btn-default btn-sm' onclick='delSearchKey(this)'>행삭제</button></td>";
	    str += "</tr>";
	} else if (key === 'Cap') {
		str += "<tr>";
	    str += "<td><input type='text' id='product_size' name='productSizeList.product_size' value='' style='width:85%'></td>";
	    str += "<td><input type='text' id='product_cap_length' name='productSizeList.product_cap_length' value='' style='width:85%'></td>";
	    str += "<td><input type='text' id='product_cap_circumference' name='productSizeList.product_cap_circumference' value='' style='width:85%'></td>";
	    str += "<td><input type='text' id='product_cap_depth' name='productSizeList.product_cap_depth' value='' style='width:85%'></td>";
	    str += "<td><input type='text' id='productAmount' name='productAmount' value='' style='width:85%'></td>";
	    str += "<td><button type='button' class='btn btn-default btn-sm' onclick='addSearchKey('" + "Cap" + "')>행추가</button></td>"; 
	    str += "<td><button type='button' class='btn btn-default btn-sm' onclick='delSearchKey(this)'>행삭제</button></td>";
	    str += "</tr>";
	} else if (key === 'ETC') {
		str += "<tr>";
	    str += "<td><input type='text' id='product_size' name='productSizeList.product_size' value='' style='width:85%'></td>";
	    str += "<td><input type='text' id='productAmount' name='productAmount' value='' style='width:85%'></td>";
	    str += "<td><button type='button' class='btn btn-default btn-sm' onclick='addSearchKey('" + "ETC" + "')>행추가</button></td>"; 
	    str += "<td><button type='button' class='btn btn-default btn-sm' onclick='delSearchKey(this)'>행삭제</button></td>";
	    str += "</tr>";
	}  
	
	$('#searchResult' + key).append(str); // 동적으로 row를 추가한다.
	i++;
}

function delSearchKey(obj){
	//동적으로 생성된 삭제 버튼에서 div 요소를 제거한다.
	var div = $(obj).parent().parent();
	console.log(div);
	div.remove();
}

let ProductsCategoryList;
var cate1Arr = new Array();
var cate1Obj = new Object();



$(function() {
	
	$(".top").hide();
	$(".bottom").hide();
	$(".cap").hide();
	$(".etc").hide();
	
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

$(document).on("change", "select#brandCategory", function(){
	$("#brand_name").val($("#brandCategory option:selected").text());
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
		console.log(selectVal);
		for(var i = 0; i < cate3Arr.length; i++) {
			if(selectVal == cate3Arr[i].product_category_num_ref) {
				cate3Select.append("<option value='" + cate3Arr[i].product_category_num + "'>"
									+ cate3Arr[i].product_category_name + "</option>");
			}
		}
		
		if (selectVal == 1100 || selectVal == 2100) {
			$(".bottom").hide();
			$(".cap").hide();
			$(".etc").hide();
			$(".top").show();
		} else if (selectVal == 1200 || selectVal == 2200) {
			$(".top").hide();
			$(".cap").hide();
			$(".etc").hide();
			$(".bottom").show();
		} else if (selectVal == 1400 || selectVal == 2400) {
			$(".top").hide();
			$(".bottom").hide();
			$(".etc").hide();
			$(".cap").show();
		} else {
			$(".top").hide();
			$(".bottom").hide();
			$(".cap").hide();
			$(".etc").show();
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


//등록 버튼 클릭시 이벤트
$("button[type='submit']").on("click", function(e){
   e.preventDefault();
   console.log("product register......");
   let str = ""
   $(".uploadResult ul li").each(function(i, obj) {
      let jobj = $(obj);

      str += "<input type='hidden' name='fileList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
      str += "<input type='hidden' name='fileList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
      str += "<input type='hidden' name='fileList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
   });
   
   $("#registerProductForm").append(str);
   console.log($("#registerProductForm"));
   
   $.ajax({
		type:'post',
		url:'/admin/productRegister',
		headers: {"X-CSRF-TOKEN": $("input[name='_csrf']").val()},
		data: $('#registerProductForm').serialize(),
		success: function() {
			//alert("상품 등록");
			//location.href = "/product/register";
	    },
       error: function(err) {
           console.log(err);
       },
	}); //end ajax 
   
});


let regex = new RegExp("(.*?)\.(png|bmp|jpeg|jpg)$");
let maxSize = 1024 * 1024 * 10; //10MB


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

let cloneObj = $(".uploadDiv").clone();


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
      url: '/file/productfileUploadAjax',
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

function showUploadedFile(uploadResultArr){
   
   if(!uploadResultArr || uploadResultArr.length == 0) {return;}
   
   let str = "";
   
   $(uploadResultArr).each(function(i, obj){
      console.log(obj.uploadPath);
      console.log(obj.uuid);
      console.log(obj.fileName);
      filePath = obj.uploadPath;
      let fileFullName = encodeURIComponent(obj.uploadPath + "/" +obj.uuid + "_" + obj.fileName);
      let originPath = obj.uploadPath + "\\" +obj.uuid + "_" + obj.fileName;
      originPath = originPath.replace(new RegExp(/\\/g), "/");
      filePath = filePath.replace(new RegExp(/\\/g), "/");
      console.log("fileFullName : " + fileFullName);
      console.log("originPath : " + originPath);
      console.log("filePath : " + filePath);
      //str +="<li data-path='" +  obj.uploadPath + "' data-uuid='" + obj.uuid + "'data-filename='" + obj.fileName + "'data-linked_num='" + obj.uploadPath +"'>";
      str +="<li data-path='" +  filePath + "' data-uuid='" + obj.uuid + "'data-filename='" + obj.fileName + "'data-linked_num='" + obj.uploadPath +"'>";
      str +="<div>"
         str +="<span>" + obj.fileName +"</span>"
         str +="<button type='button' data-file=\'" + fileFullName + "\' data-type='image'> X </button><br>";
         str +="<a href=\"javascript:showImage(\'" + originPath + "\')\">"
            str +="<img src='/file/display?fileName=/" + fileFullName + "'>";
         str +="</a>";
      str +="</div>"
      str +="</li>";
      console.log(str);
   });
   uploadResult.append(str);
}
   

//이미지 클릭시 확대
function showImage(fileFullName){
   console.log(fileFullName)
   $(".bigPictureWrapper").css("display", "flex").show();
   $(".bigPicture").html("<img src='/file/display?fileName=/" + fileFullName + "'>")
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
