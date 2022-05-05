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
	
.uploadResult {
width: 100%;
background-color: gray;
}

.uploadResult ul {
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}

.uploadResult ul li {
	list-style: none;
	padding: 10px;
}

.uploadResult ul li img {
	width: 100px;
}

.uploadResult ul li span {
	color: white;
}

.bigPictureWrapper{
	position: absolute;
	display: none;
	justify-content: center;
	align-items: center;
	top: 0%;
	width: 100%;
	height: 100%;
	background-color: gray;
	z-index: 100;
	background:rgba(255,255,255,0.5);
}

.bigPicture{
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
}

.bigPicture img{
	width: 600px;
}
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
			<h2>유저 검색</h2>
			<form id="searchForm" method="post" autocomplete="off">
				<div class="searchInputArea">	
					<div class="inputArea">
						<label for="member_id">회원ID</label>
						<input type="text" id="searchMember_id" name="member_id" style="width:300px"/>
					</div>
					<div class="inputArea">
						<label for="member_name">회원명</label>
						<input type="text" id="searchMember_name" name="member_name" style="width:300px"/>
					</div>		
				
				
				
				<button type="button" id="search_Btn" class="btn btn-primary">검색</button>
			</div>
			</form>
			
			<div class="searchResult">
				<input id="searchProduct" type="text" value="">
				<table id="tr" border="1">
					
				</table>
			</div>
			
			<form id="deleteMemberList" action="/product/delete" method="post">
			
			</form>
			
			
			<h2>회원 등급 수정</h2>
			
			<form id="productModifyForm" method="post" action="/product/modify" autocomplete="off">
			
			<input type="text" id="product_num" name="product_num" value="" />
			
			<div class="inputArea">
				
				<div class="inputArea">
					<label for="member_id">아이디</label>
					<input type="text" id="member_id" name="member_id" value="" style="width:300px"/>
				</div>
				
				<div class="inputArea">
					<label for="member_name">이름</label>
					<input type="text" id="member_name" name="member_name" value="" style="width:300px"/>
				</div>
				
				<div id="rank_num">	
					<label>회원등급</label>
					<select id="selectRank_num" class="rank_num" name="rank_num">
						<option value=""></option>
					</select>
				</div>
				
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
				<button type="button" id="delete_Btn" class="btn btn-primary">삭제</button>
				<button type="button" id="update_Btn" class="btn btn-primary">수정</button>
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

$("#back_Btn").click(function(){
	//history.back();
	console.log("back_Btn");
	//location.href = "/admin/goods/view?n=" + ${goods.gdsNum};
});		


//rank_num 목록 가져오기
function getRankNum() {
	
	$.ajax({
		type: 'post',
		url: '/member/getRankNum',
		dataType: 'json',
		
		success: function(rankList){
			
			let rankArr = new Array();
			let rankObj = new Object();
			
			for(var i = 0; i < rankList.length; i++) {
				
				rankObj = new Object();  // 초기화
				
				// rank에 rank_num와 rank_name를 저장
				rankObj.rank_num = rankList[i].rank_num; 
				rankObj.rank_name = rankList[i].rank_name;
				
				// rank에 저장된 값을 rankArr 배열에 저장
				rankArr.push(rankObj);
			}

			// 랭크 셀렉트 박스에 데이터 삽입
			let rankSelect = $("#selectRank_num")
			rankSelect.children().remove();

			for(let i = 0; i < rankArr.length; i++) {

				// rankArr에 저장된 값을 cate1Select에 추가
				rankSelect.append("<option value='" + rankArr[i].rank_num + "'>"
									+ rankArr[i].rank_name + "</option>");	
			}
			 
		},
		error: function(e) {
			console.log(e);
			
		}
	});
	
	
}



//검색버튼 클릭

let productList;

$("#search_Btn").on("click", function(){
	$.ajax({
		type: 'post',
		data: $("#searchForm").serialize(),
		url: '/member/getMember',
		dataType: 'json',
		success: function(MemberDTOList){
			console.log(MemberDTOList);
			
			$("#tr").children().remove();
			$("#tr").append("<tr>" +
					"<td>목록추가</td>" +
					"<td>ID</td>" +
					"<td>회원명</td>" +
					"<td>연락처</td>" +
					"</tr>");
			
			$.each(MemberDTOList, function(index, item){
				$("#tr").append(
								"<tr>" +
								"<td><input type='checkbox' id='checkMember_id' name='checkMember_id' value='" + item.member_id + "'></td>" +
								"<td><a class='move' href='" + item.member_id +"' value='" + item.member_name + "'>" + item.member_id + "</a></td>"+
								"<td>" + item.member_name + "</td>"+
								"<td>" + item.tel1 + "-" + item.tel2 + "-" + item.tel3 + "</td></tr>"
				);
			}); 
		},
		error: function(e) {
			console.log(e);
			
		}
	});
});


$(document).on("click", "a.move", function(e){
	e.preventDefault();
	console.log(e);
	
	$("#member_id").val('');
	$("#member_name").val('');
	$("#selectRank_num").val('');
	
	getRankNum();
	$.ajax({
		url: '/member/getMember',
		type: 'post',
		data: {
			'member_id' : $(".move").attr("href"),
			'member_name' : $(".move").attr("value"),
		},
		dataType: 'json',
		success: function(result){
			console.log(result);
			
			$("#member_id").val(result[0].member_id);
			$("#member_name").val(result[0].member_name);
			$("#selectRank_num").val(result[0].rank_num);
		},
		
		error: function(e) {
			console.log(e);
		}
	});
});


</script>

<script type="text/javascript">
//수정 버튼 클릭시 이벤트
$("#update_Btn").on("click", function(e){
   e.preventDefault();
   console.log("product register......");
   let str = ""
   $(".uploadResult ul li").each(function(i, obj) {
      let jobj = $(obj);
      console.log($(obj).html());
      //console.log(jobj.data("filename"));

      str += "<input type='hidden' name='fileList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
      str += "<input type='hidden' name='fileList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
      str += "<input type='hidden' name='fileList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
      str += "<input type='hidden' name='fileList["+i+"].product_num' value='"+jobj.data("product_num")+"'>";
      //console.log(str);
   });
   
   
   $("#productModifyForm").append(str).submit();
   //$("#productModifyForm").append(str);
});


function getDeleteProductList(){
    let obj = $("[name=checkProduct_num]");
    let deleteProductArray = new Array(); // 배열 선언

    $('input:checkbox[name=checkProduct_num]:checked').each(function() { // 체크된 체크박스의 value 값을 가지고 온다.
    	deleteProductArray.push(this.value);
    });
    
    return deleteProductArray;
}



//회원 휴면 처리
$("#delete_Btn").on("click", function(e) {
	e.preventDefault();
	deleteProductList = $("#deleteProductList");
	
	let str = ""
	let deleteArray = new Array();
	deleteArray = getDeleteProductList();
	
	
	str += "<input type='text' name='checkProduct_num' value='" + deleteArray + "'>"; 
	
	deleteProductList.append(str);
	
	$.ajax({
		url : '/product/delete',
		type: 'post',
		data: deleteProductList.serialize(),
		//contentType: "application/json; charset=UTF-8;",
		success: function(){
			console.log("성공");
			alert("상품을 삭제했습니다.");
			location.href="modifyForm";
		},
		
	});
	
	
});
</script>


</body>
</html>