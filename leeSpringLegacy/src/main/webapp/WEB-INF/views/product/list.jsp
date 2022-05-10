<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>    
<input id="categoryInput" type="hidden" value=${param.category}>
<input id="pgInput" type="hidden" value=${param.pg}>
<div class="col-12" style="display: grid;
grid-template-columns: 200px;
padding: 20px;
grid-template-rows: 50px auto 50px;"
>
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


<script type="text/javascript" src="/resources/js/list.js"></script>