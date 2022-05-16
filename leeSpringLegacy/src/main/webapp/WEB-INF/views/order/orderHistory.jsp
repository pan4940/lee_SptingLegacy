<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/orderHistory.css" />
    <div id="orderHistoryDiv">
      <h3><center>ORDER HISTORY</center></h3>
      <button id="totalOrderBtn">Total Order(0)</button>
      <!-- <button>Canceled & Returns (0)</button> -->
      <div id="orderlist">No order.</div>
      <div id="paging">
        <!-- Div-->
      </div>
    </div>
    
<script type="text/javascript">
	$(function(){
		$.ajax({
			url:'/getOrderHistory',
			type:'post',
			success:function(data){
				console.log(data)
				if(data.length>0){
					$('#totalOrderBtn').text("Total Order ("+data.length+")")
					$('#orderlist').empty();
					$('<table/>',{class:'col-12',id:'orderHistoryTable'}).append(
						$('<tr/>').append(
							$('<th/>',{class:'col-2',text:'Date'})	
						).append(
							$('<th/>',{class:'col-6',text:'Order Product'})	
						).append(
							$('<th/>',{class:'col-2',text:'Total Price'})
						).append(
							$('<th/>',{class:'col-2',text:'Status'})
						)		
					).appendTo($('#orderlist'));
					$.each(data,function(index,item){
						$('<tr/>').append(
							$('<td/>',{text:item.orderdate.split('T')[0]})	
						).append(
							$('<td/>',{text:item.order_name})	
						).append(
							$('<td/>',{text:item.finalTotalPrice.toLocaleString()+' 원'})
						).append(
							$('<td/>',{text:item.status})
						).appendTo($('#orderHistoryTable'))		
					})
				}
			},
			error:function(err){
				console.log(err);
			}
		})
	})
	

</script>
  