package com.lee.thec.order.bean;


import java.util.Date;

import org.springframework.stereotype.Component;

import com.lee.thec.product.bean.DetailProductDTO;

import lombok.Data;

@Component
@Data
public class DetailOrderDTO {
	private int detail_order_id;
	private String order_id;
	private int detail_product_id;
	private int product_price;
	private Date legDate; 
	private Date updateDate;
	
	
	private DetailProductDTO detailProductDTO;
}
