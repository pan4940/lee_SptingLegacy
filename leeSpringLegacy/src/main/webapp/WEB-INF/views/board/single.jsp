<%@page import="member.bean.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<!-- <meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="/component/nav.css" />
<link rel="stylesheet" href="/index.css" />
<link rel="stylesheet" href="help.css" /> -->
<script src="https://kit.fontawesome.com/cd631a71a1.js"
	crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>


<style>
div {
    display: block;
}

.row{
	list-style: none;
    position: relative;
    margin: 15px 0 0 0;
    border-top: 1px solid #d7d5d5;
    box-sizing: border-box;
    color: #353535;
    line-height: 140%;
}

.floatleft {
    float: left;
}

.col50 {
    width: 50%;
}

.single-content{
	margin:auto;
}

.col{
	padding:0px;
}
   
</style>

<% 
MemberDTO memberDTO = (MemberDTO)session.getAttribute("memberDTO");
%>

<body>


	<%-- <jsp:include page="/component/nav.jsp" /> --%>
	
	<c:if test="<%= memberDTO != null %>">
		
		<input id="rank_num" type="hidden" name='rank_num' value="<%= memberDTO.getRank_num()%>">
		<input id="member_id" type="hidden" name='member_id' value="<%= memberDTO.getMember_id()%>">
	</c:if>
	<div class="xans-element- xans-product xans-product-detail collection-single-wrap ">
		<div class="single-top">
			<input type="text" value="${map}">
			<%-- <input type="hidden" value="${boardDTO}"> --%>
			<p></p>
			<h1 style="margin:100px 20px">${boardDTO.subject}</h1>
		</div>
		<div class="single-content col-12 col-lg-9">
			<div data-empty="true" style="text-align: center;">${boardDTO.content}</div>
			<br>
			<div data-empty="true" style="text-align: center;">
				<br>
				<div class="row">
					<c:forEach items="${boardDTO.fileList}" var="fileDTO">
					
						<div class="col col-12 col-lg-6">
							<img alt="image" src="/file/display?fileName=/${fileDTO.uploadPath}/${fileDTO.uuid}_${fileDTO.fileName}">
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		
		<!-- 뭔지 파악안됨. 메인이미지인듯? -->
		
		<!-- <div
			class="xans-element- xans-product xans-product-addimage collection-single-images">
			<div class="slide-img displaynone xans-record-" 
				style="background-image: url(&quot;//thexshop.co.kr/web/product/small/202203/deaeb76c9efb25d8e32d8f2d22f1dd55.jpg&quot;);">
				<img
					src="//thexshop.co.kr/web/product/small/202203/deaeb76c9efb25d8e32d8f2d22f1dd55.jpg"
					class="ThumbImage" alt=""
					data-original="//thexshop.co.kr/web/product/small/202203/deaeb76c9efb25d8e32d8f2d22f1dd55.jpg">
			</div>
		</div>
		<div class="clearfix"></div>
		<div
			class="xans-element- xans-product xans-product-additional row product-related ">
		</div> -->
	</div>
	
	
	<c:if test="<%= memberDTO != null %>">
		<form id="postForm" action="" >
			<input type="hidden" name="board_category_num" value="${boardDTO.board_category_num}">
			<input type="hidden" name="board_num" value="${boardDTO.board_num}">
			<input type="hidden" name="member_id" value="${boardDTO.member_id}">	
		</form>
	</c:if>
	<button id="modifyBtn">수정</button>
	<button id="deleteBtn">삭제</button>
	
	
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script type="text/javascript">
let postForm = $("#postForm"); 


let moveWriteForm = $("#moveWriteForm");
let actionForm = $("#actionForm");

$(document).ready(function(){
	let member_id = $("#member_id").val();
	let rank_num = $("#rank_num").val();
	
	console.log(member_id);
	console.log(rank_num);	
	
	if(rank_num == 3){
		$("#modifyBtn").show();
		$("#deleteBtn").show();
	} else {
		$("#modifyBtn").hide();
		$("#deleteBtn").hide();
	}
	
});



$("#modifyBtn").on("click", function(e){
	e.preventDefault();
	postForm.attr("action", "/board/modifyForm");
	postForm.submit();
});

$("#deleteBtn").on("click", function(e){
	e.preventDefault();
	postForm.attr("action", "/board/delete");
	postForm.submit();
});

</script>
	

</body>
</html>