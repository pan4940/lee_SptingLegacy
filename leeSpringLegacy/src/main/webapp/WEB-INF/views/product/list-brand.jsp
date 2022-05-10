<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>    

<!-- <input id="categoryInput" type="hidden" value=${param.category}>
<input id="pgInput" type="hidden" value=${param.pg}> -->
<div class="col-12" style="display: grid;
grid-template-columns: 200px;
padding: 20px;
grid-template-rows: 50px auto 50px;"
>

	<input id="brand_num" type="hidden" value="${product_category_num}">
    <div id="categoryNameDiv">
	    <div></div>
	    <div></div>
    </div>
    <div id="categoryListDiv">
    	<ul id="categoryName">
    	</ul>
    </div>
    
    <div id="productListDiv"></div>
    <div id="pagingDiv"></div>
</div>

<script type="text/javascript">

$(document).ready(function(){
    $.ajax({
        url: '/product/getProductsByBrandCategory',
        type: 'POST',
        dataType: 'json',
        data: 'product_category_num=' + $("#brand_num").val(),
        success: function(result) {
        	let str = "";
        	$.each(result, function(index, items) {
        		console.log(items);
        		let fileCallPath = encodeURIComponent(items.fileList[0].uploadPath + "/" +items.fileList[0].uuid + "_" + items.fileList[0].fileName);
                //str += "<div class='thumbnail-image image-is-load'>";
                str += "<div class='col-12 col-md-6 col-lg-3', style: 'border:none;padding:10px' >";
                    str += "<a href='/product/detail?product_num=" + items.product_num + "&brandCategory=" + items.brandCategory + "' class='noborder'>";    
                        str += "<img src='/file/display?fileName=/" +  fileCallPath  +  "' class='thumb-img'>";
                        str += "&nbsp";
                        str += "<div class='thumbnail-soldout'><span class='displaynone'></span></div>";

                    str += "</a>";
                

                str += "<div class='thumbnail-info'>";
                    str += "<p class='brand'>" + items.brand_name + "</p>";
                    str += "<p class='name'>";
                    str += "<a href='/product/detail?product_num='>"
                        str += "<span style='font-size:12px;color:#555555;'>" + items.product_name + "</span>";
                    str += "</a>";
                    str += "</p>";
                    str += "<div class='price'>"
                        str += "<div>" + items.product_price + "원"; 
                            str += "<span class='product-custom displaynone'></span>";
                        str += "</div>";
                            str += "<div></div>";
                    str += "</div>";    
                    str += "<p class='desc'></p>"
                str += "</div>";
                
                str += "</div>";
			});
        	
        	$("#productListDiv").append(str);
        },
    });
    
    $.ajax({
        url: '/product/getBrandsCategoryList',
        type: 'POST',
        dataType: 'json',
        success: function(result) {
            let str = "";
            
            $(result).each(function(i, obj) {
            	
                str += "<li>";
                str += "<a href='/product/list-brand?product_category_num=" + obj.product_category_num + "'</a>"  + obj.product_category_name +  "</li>";
            });
            
            $("#categoryName").append(str);
        },
    });
    

});

</script>


