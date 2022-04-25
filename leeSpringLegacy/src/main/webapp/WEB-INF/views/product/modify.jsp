<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>kubg Admin</title>
	

<link rel="stylesheet" href="/resources/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="/resources/bootstrap/bootstrap-theme.min.css">
<script src="/resources/bootstrap/bootstrap.min.js"></script>

<script src="/resources/ckeditor/ckeditor.js"></script>
	
<style>
	body { font-family:'맑은 고딕', verdana; padding:0; margin:0; }
	ul { padding:0; margin:0; list-style:none;  }
 
	div#root { width:90%; margin:0 auto; }
	
	header#header { font-size:60px; padding:20px 0; }
	header#header h1 a { color:#000; font-weight:bold; }
	
	nav#nav { padding:10px; text-align:right; }
	nav#nav ul li { display:inline-block; margin-left:10px; }
 
 		section#container { padding:20px 0; border-top:2px solid #eee; border-bottom:2px solid #eee; }
	section#container::after { content:""; display:block; clear:both; }
	aside { float:left; width:200px; }
	div#container_box { float:right; width:calc(100% - 200px - 20px); }
	
	aside ul li { text-align:center; margin-bottom:10px; }
	aside ul li a { display:block; width:100%; padding:10px 0;}
	aside ul li a:hover { background:#eee; }
	
	footer#footer { background:#f9f9f9; padding:20px; }
	footer#footer ul li { display:inline-block; margin-right:10px; } 
</style>


<style>
.inputArea { margin:10px 0; }
select { width:100px; }
label { display:inline-block; width:70px; padding:5px; }
label[for='gdsDes'] { display:block; }
input { width:150px; }
textarea#gdsDes { width:400px; height:180px; }

.select_img img { width:500px; margin:20px 0; }

</style>

</head>
<body>
<div id="root">
	<header id="header">
		<div id="header_box">
			<%@ include file="../admin/include/header.jsp" %>
		</div>
	</header>

	<nav id="nav">
		<div id="nav_box">
			<%@ include file="../admin/include/nav.jsp" %>
		</div>
	</nav>
	
	<section id="container">
		<aside>
			<%@ include file="../admin/include/aside.jsp" %>
		</aside>
		
		<div id="container_box">
			<h2>상품 검색</h2>
			<form id="searchForm" method="post" autocomplete="off">
				<div class="searchInputArea">	
				<label>1차 분류</label>
				<select class="searchCategory1" name="cateCode1">
					<option value="">전체</option>
				</select>			
				<label>2차 분류</label>
				<select class="searchCategory2" name="cateCode2">
					<option value="">전체</option>
				</select>
				<label>3차 분류</label>
				<select class="searchCategory3" name="cateCode3">
					<option value="">전체</option>
				</select>
					
				<label>브랜드명</label>
				<select class="searchBrandCategory" name="brandCategory">
					<option value="">전체</option>
				</select>
				
				<button type="button" id="search_Btn" class="btn btn-primary">검색</button>
			</div>
			</form>
			
			<div class="searchResult">
				<input id="searchProduct" type="text" value="">
				<table border="1">
					<tr>
						<td>상품명</td>
						<td>브랜드명</td>
						<td>카테고리1</td>
						<td>카테고리2</td>
						<td>카테고리3</td>
						<td>카테고리4</td>
						<td>가격</td>
						<td>설명</td>
					</tr>
					<tr id="tr"></tr>
				</table>
			</div>
			
			
			<h2>상품 수정</h2>
			
			<form role="form" method="post" autocomplete="off" enctype="multipart/form-data">
			
			<input type="hidden" name="gdsNum" value="${goods.gdsNum}" />
			
			<div class="inputArea">
				<div id="category1">	
					<label>1차 분류</label>
					<select class="category1" name="cateCode1">
						<option value="">전체</option>
					</select>
				</div>
				
				<div id="category2">	
					<label>2차 분류</label>
					<select class="category2" name="cateCode2">
						<option value="">전체</option>
					</select>
				</div>
				<div id="category3">	
					<label>3차 분류</label>
					<select class="category3" name="cateCode3">
						<option value="">전체</option>
					</select>
				</div>
				
				<div id="category4">	
					<label>브랜드명</label>
					<select class="category4" name="brandCategory">
						<option value="">전체</option>
					</select>
				</div>
			</div>
			
			<div class="inputArea">
				<label for="gdsName">상품명</label>
				<input type="text" id="product_name" name="product_name" />
			</div>
			
			<div class="inputArea">
				<label for="gdsPrice">상품가격</label>
				<input type="text" id="product_price" name="product_price" />
			</div>
			
			<div class="inputArea">
				<label for="gdsStock">상품수량</label>
				<input type="text" id="gdsStock" name="gdsStock" />
			</div>
			
			<div class="inputArea">
				<label for="product_descrip">상품소개</label>
				<textarea rows="5" cols="50" id="product_descrip" name="product_descrip"></textarea>
				
				
			</div>
			
						
			<div class="uploadDiv">
				<input type="file" name="uploadFile" multiple>
			</div>   
			             
			<div class="uploadResult">
				<ul>
				</ul>
			</div>
			             
			<div class="bigPictureWrapper">
				<div class="bigPicture">
				</div>
			</div>
			
			<div class="inputArea">
				<button type="submit" id="update_Btn" class="btn btn-primary">완료</button>
				<button type="button" id="back_Btn" class="btn btn-warning">취소</button>			
			</div>
			
			</form>
			
		</div> 
	</section>


	<footer id="footer">
		<div id="footer_box">
			<%@ include file="../admin/include/footer.jsp" %>
		</div>		
	</footer>

</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script>
// 컨트롤러에서 데이터 받기
// 필요한 배열과 오브젝트 변수 생성
let ProductsCategoryList;
let BrandsCategoryList;
var cate1Arr = new Array();
var cate1Obj = new Object();

$(document).ready(function(){
	
	$.ajax({
		type: 'post',
		url: '/product/getProductCategoryList',
		dataType: 'json',
		success: function(result){
			ProductsCategoryList = result;
			createCate(ProductsCategoryList);
		},
	});

	$.ajax({
		type: 'post',
		url: '/product/getBrandsCategoryList',
		dataType: 'json',
		success: function(result){
			BrandsCategoryList = result;
			createBrandCategory(BrandsCategoryList);
		},
	});
	//jsonData = $("#list").val();
	//console.log(jsonData[0]);
}());

$("#back_Btn").click(function(){
	//history.back();
	console.log("back_Btn");
	//location.href = "/admin/goods/view?n=" + ${goods.gdsNum};
});		

//브랜드명 셀렉트 박스에 삽입할 데이터 준비
function createBrandCategory(jsonData){
	
	var brandCateArr = new Array();
	var brandCateObj = new Object();
	
	for(var i = 0; i < jsonData.length; i++) {
		
		if(jsonData[i].level == "2") {  // 레벨이 1인 데이터가 있다면 
			brandCateObj = new Object();  // 초기화
			
			// brandCateObj에 cateCode와 cateName를 저장
			brandCateObj.product_category_num = jsonData[i].product_category_num; 
			brandCateObj.product_category_name = jsonData[i].product_category_name;
			
			// brandCateObj에 저장된 값을 brandCateArr 배열에 저장
			brandCateArr.push(brandCateObj);
		}
	}
	//console.log(brandCateArr);

	// 브랜드명 셀렉트 박스에 데이터 삽입
	var brandSelect = $("select.searchBrandCategory")

	for(var i = 0; i < brandCateArr.length; i++) {

		// cate1Arr에 저장된 값을 cate1Select에 추가
		brandSelect.append("<option value='" + brandCateArr[i].product_category_num + "'>"
							+ brandCateArr[i].product_category_name + "</option>");	
	}
};


function createCate(ProductsCategoryList){
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
	console.log(cate1Arr);

	// 1차 분류 셀렉트 박스에 데이터 삽입
	var cate1Select = $("select.searchCategory1")

	for(var i = 0; i < cate1Arr.length; i++) {

		// cate1Arr에 저장된 값을 cate1Select에 추가
		cate1Select.append("<option value='" + cate1Arr[i].product_category_num + "'>"
							+ cate1Arr[i].product_category_name + "</option>");	
	}
};


//1차 분류 카테고리
// 클래스가 category1인 select변수의 값이 바뀌었을 때 실행
$(document).on("change", "select.searchCategory1", function(){
	// 필요한 배열과 오브젝트 변수를 생성
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
	
	console.log(cate2Arr);
	
	var cate2Select = $("select.searchCategory2");
	
	
	cate2Select.children().remove();
	
	
	// cate2Select의 값을 제거함(초기화)
 
	// cate1Select에서 선택한 값을 기준으로 cate2Select의 값을 조정
	$("option:selected", this).each(function(){
		var selectVal = $(this).val();  // 현재 선택한 cate1Select의 값을 저장
	
		//cate2Select.append("<option value='" + selectVal + "'>전체</option>");  // cate2Select의 '전체'에 현재 선택한 cate1Select와 같은 값 부여
		cate2Select.append("<option value='" + selectVal + "'>전체</option>");  // cate2Select의 '전체'에 현재 선택한 cate1Select와 같은 값 부여
		// cate2Arr의 데이터를 cate2Select에 추가
		for(var i = 0; i < cate2Arr.length; i++) {
			
			// 현재 선택한 cate1Select의 값과 일치하는 cate2Arr의 데이터를 가져옴
			if(selectVal == cate2Arr[i].product_category_num_ref) {
				cate2Select.append("<option value='" + cate2Arr[i].product_category_num + "'>"
									+ cate2Arr[i].product_category_name + "</option>");
			}
		}		
	});
});


$(document).on("change", "select.searchCategory2", function(){
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
	
	//console.log(cate3Arr);
	
	var cate3Select = $("select.searchCategory3");
	
	
	// cate3Select의 값을 제거함(초기화)
	cate3Select.children().remove();
	
	
 
	$("option:selected", this).each(function(){
		var selectVal = $(this).val();  
	
		cate3Select.append("<option value='" + selectVal + "'>전체</option>");  // cate3Select의 '전체'에 현재 선택한 cate2Select와 같은 값 부여
		
		for(var i = 0; i < cate3Arr.length; i++) {
			
			if(selectVal == cate3Arr[i].product_category_num_ref) {
				cate3Select.append("<option value='" + cate3Arr[i].product_category_num + "'>"
									+ cate3Arr[i].product_category_name + "</option>");
			}
		}		
	});
});


var regExp = /[^0-9]/gi;

$("#product_price").keyup(function(){ numCheck($(this)); });
$("#product_price").keyup(function(){ numCheck($(this)); });

function numCheck(selector) {
	var tempVal = selector.val();
	selector.val(tempVal.replace(regExp, ""));
}

//검색버튼 클릭

$("#search_Btn").on("click", function(){
	$.ajax({
		type: 'post',
		data: $("#searchForm").serialize(),
		url: '/product/getProductByCategory',
		dataType: 'json',
		success: function(result){
			console.log(result[0]);
			$("#tr").append("<td>" + result[0].product_name + "</td>"+
							"<td>" + result[0].brand_name + "</td>"+
							"<td>" + result[0].cateCode1 + "</td>"+
							"<td>" + result[0].cateCode2 + "</td>"+
							"<td>" + result[0].cateCode3 + "</td>"+
							"<td>" + result[0].brandCategory + "</td>"+
							"<td>" + result[0].product_price + "</td>"+
							"<td>" + result[0].product_descrip + "</td>"
			);
			
		},
		error: function(e) {
			console.log(e);
		}
	});
	
});
</script>


</body>
</html>