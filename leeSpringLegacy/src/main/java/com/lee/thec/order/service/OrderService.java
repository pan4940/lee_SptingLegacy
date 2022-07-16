package com.lee.thec.order.service;

import java.util.List;

import com.lee.thec.order.bean.OrderDTO;
import com.lee.thec.product.bean.ProductDTO;

public interface OrderService {

	public List<ProductDTO> getCartList(String member_id);

	public void addCart(String member_id, String product_size_id);

	public void deleteDetailProductFromCart(int detail_product_id);


	public void registerOrderDTO(OrderDTO orderDTO);

	public List<OrderDTO> getOrderHistory(String member_id);

	public ProductDTO getQuickorder(int product_size_id);
	
}
