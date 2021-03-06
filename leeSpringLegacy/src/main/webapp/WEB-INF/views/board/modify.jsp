<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>



<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src="https://kit.fontawesome.com/cd631a71a1.js" crossorigin="anonymous"></script>
<title>modify</title>
</head>

<body>
<style>

#QNA{
   width:60%;
   margin:auto;
}

ul {
	margin: 0px;
	font-size: 0.8rem;
	font-weight: bold;
}


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

.prvBtn{
	width:80px;
	border:2px solid black;
	display:inline-block;
	padding:3px;
}

.modBtn{
	background-color: white;
	border:2px solid black;
}

#updateFile{
	background-color: white;
}

#subject{
   width:100%;
   height:30px;
}

.form-submit-board label{
   color:gray;
   margin-bottom:5px;
}
</style>

	<div id="empty"></div>
	<div id="help_main">
		<div id="QNA">
			<c:if test="${map.board_category_num eq '1'}">
				<h3 class="QNA_board_title">??????</h3>
			</c:if>
			<c:if test="${map.board_category_num eq '2'}">
				<h3 class="QNA_board_title">2</h3>
			</c:if>
			<c:if test="${map.board_category_num eq '3'}">
				<h3 class="QNA_board_title">3</h3>
			</c:if>
			<c:if test="${map.board_category_num eq '4'}">
				<h3 class="QNA_board_title">??????</h3>
			</c:if>
			<c:if test="${map.board_category_num eq '5'}">
				<h3 class="QNA_board_title">?????? Q&A</h3>
			</c:if>
			<c:if test="${map.board_category_num eq '6'}">
				<h3 class="QNA_board_title">Q&A</h3>
			</c:if>

			<c:choose>
				<c:when test="${map.board_category_num eq '7'}">
					
					<form id="boardModifyForm" action="/board/modify" method="post">
						<input type="hidden" id="board_num" name="board_num" value="${boardDTO.board_num}">
						<input type="hidden" name="board_category_num" value="${boardDTO.board_category_num}"> 
						<input type="hidden" name="member_name" value="${boardDTO.member_name}">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<div>
							<ul class="form-submit-board">
								<li>
									
									<label>subject</label> 
										<input type="text" id="subject" name="subject" value="${boardDTO.subject}">
									<span class="label-box"></span>
								</li>
								
								<li>
									
									<span class="label-box"></span>
								</li>
								<li>
									<label>Content</label>
									<div id="content">
										<textarea id="summernote"  style="width:100%;" name="content" rows="40" >${boardDTO.content}</textarea>
									</div>
								</li>
							</ul>
							
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
							
							
							<div id="botton box">
								<span class=""> 
									<a class="prvBtn" style="border:1px solid black;" href="/page/help">????????????</a>
								</span> 
								<span>
									<button class="modBtn" style="background-color: write;" type="submit" formmethod="post">????????????</button>
								</span>
							</div>
						</div>
					</form>
				</c:when>


				
				<c:otherwise>
					<form id="boardModifyForm" action="/board/modify" method="post">
						
						<input type="hidden" name="board_category_num" value="${map.board_category_num}"> 
						<input type="hidden" id="board_num" name="board_num" value="${map.board_num}" >
						<input type="hidden" name="pageNum" value="${map.pageNum}">
						<input type="hidden" name="amount" value="${map.amount}">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<div>
							<ul class="form-submit-board">
								<li>
									<label>subject</label>
									<select id="subject" name="subject">
										<option value="????????????????????????.">????????????????????????.</option>
										<option value="?????????????????????.">?????????????????????.</option>
										<option value="?????????????????????.">?????????????????????.</option>
										<option value="????????????????????????.">????????????????????????.</option>
										<option value="?????????????????????.">?????????????????????.</option>
									</select>
									<span class="label-box"></span>
								</li>
								<li>
									<label>member_name</label>
									<input type="hidden" id="member_name" name="member_name" value="${boardDTO.member_name}">
									<input type="hidden" name="member_id" value="<sec:authentication property="principal.memberDTO.member_id"/>">
									<span class="label-box"></span>
								</li>
								<li>
									<label>Content</label>
									<div id="content">
										<textarea id="summernote" name="content" style="width:100%;">${boardDTO.content}</textarea>
									</div>
								</li>
							</ul>
							<div id="botton box">
								<span class="" >
									<a class="prvBtn" style="border:1px solid black;" href="/page/help">????????????</a>
								</span>
								<span>
									<button class="modBtn" style="background-color: write;" type="submit" formmethod="post">????????????</button>
								</span>
							</div>
						</div>
					</form>
				</c:otherwise>
			</c:choose>
		</div>

	</div> <%-- end #help_main --%>
	
	
</body>



<script type="text/javascript">
$(function(){
   $('#summernote').summernote({
      placeholder: '????????? ??????????????????.',
       tabsize: 1,
       height: 300,
       toolbar: [
           ['fontname', ['fontname']],
          ['fontsize', ['fontsize']],
          ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
          ['color', ['forecolor','color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['height', ['height']]
        ],
           fontNames: ['?????? ??????','??????','?????????','??????','?????????','?????????'],
            fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
   });   
})

</script>

<script type="text/javascript">
$(document).ready(function(){
	let board_num = $("#board_num").val();
	console.log(board_num);
	(function(){
		$.ajax({
			type: 'post',
			url: '/board/getFileList',
			data: {board_num: $("#board_num").val()},
			dataType: 'json',
			success: function(arr){
				console.log(arr);
				showUploadedFile(arr);
			},
		});
	})();
});


//???????????? ?????? ????????? ?????????
$("button[type='submit']").on("click", function(e){
	e.preventDefault();
	console.log("submit cliecked");
	let str = ""
	$(".uploadResult ul li").each(function(i, obj) {
		let jobj = $(obj);
		console.log(jobj);

		str += "<input type='hidden' name='fileList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
	    str += "<input type='hidden' name='fileList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
	    str += "<input type='hidden' name='fileList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
	    str += "<input type='hidden' name='fileList["+i+"].board_num' value='"+jobj.data("board_num")+"'>";
	    console.log(str);
	});
	
	$("#boardModifyForm").append(str).submit();
});


//let regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
let regex = new RegExp("(.*?)\.(png|bmp|jpeg|jpg)$");
let maxSize = 1024 * 1024 * 5; //5MB

function checkExtension(fileName, fileSize) {
	if(fileSize >= maxSize){
		alert("?????? ????????? ??????");
		return false;
	}

	if (!regex.test(fileName)) {
		alert("?????? ????????? ????????? ????????? ??? ??? ????????????.");
		return false;
	}
	return true;
}

let cloneObj = $(".uploadDiv").clone();

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
	formData.append("board_num", $("#board_num").val());

	$.ajax({
		url: '/file/boardfileUploadAjax',
		processData: false, // data ??????????????? ????????? ???????????? Query String?????? ???????????? ??????. ????????????????????? ????????? ?????????
		contentType: false, // //contentType??? default??? application/x-www-form-urlencoded; charset=UTF-8, ????????????????????? false??? ????????? ???
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
		aaa = obj.uploadPath;
		let fileCallPath = encodeURIComponent(obj.uploadPath + "/" +obj.uuid + "_" + obj.fileName);
		let originPath = obj.uploadPath + "\\" +obj.uuid + "_" + obj.fileName;
		originPath = originPath.replace(new RegExp(/\\/g), "/");
		
		// "\"??? "/"?????? ?????? 
		aaa = aaa.replace(new RegExp(/\\/g), "/");
		console.log("fileCallPath : " + fileCallPath);
		console.log("originPath : " + originPath);
		console.log("aaa : " + aaa);
		//str +="<li data-path='" +  obj.uploadPath + "' data-uuid='" + obj.uuid + "'data-filename='" + obj.fileName + "'data-linked_num='" + obj.uploadPath +"'>";
		str +="<li data-path='" +  aaa + "' data-uuid='" + obj.uuid + "'data-filename='" + obj.fileName + "'data-board_num='" + $("#board_num").val() +"'>";
		str +="<div>"
			str +="<span>" + obj.fileName +"</span>"
			str +="<button type='button' data-file=\'" + fileCallPath + "\' data-type='image'> X </button><br>";
			str +="<a href=\"javascript:showImage(\'" + originPath + "\')\">"
				str +="<img src='/file/display?fileName=/" + fileCallPath + "'>";
			str +="</a>";
		str +="</div>"
	str +="</li>";
		console.log(str);
	});
	uploadResult.append(str);
}

//????????? ????????? ??????
function showImage(fileCallPath){
	console.log(fileCallPath)
	$(".bigPictureWrapper").css("display", "flex").show();
	$(".bigPicture").html("<img src='/file/display?fileName=/" + fileCallPath + "'>")
					.animate({width: '100%', height: '100%'}, 0);
}

//?????? ????????? ?????????
$(".bigPictureWrapper").on("click", function(e){
	$(".bigPicture").animate({width: '0%', height: '0%'}, 0);
	$(".bigPictureWrapper").hide();
});

//x???????????? ?????? ?????????
$(".uploadResult").on("click", "button", function(e){

	let targetFile = $(this).data("file");
	console.log("targetFile : " + targetFile);
	
	if(confirm("????????? ?????????????????????????")){
		let targetLi = $(this).closest("li");
		targetLi.remove();
	}
	
});
</script>

</html>
