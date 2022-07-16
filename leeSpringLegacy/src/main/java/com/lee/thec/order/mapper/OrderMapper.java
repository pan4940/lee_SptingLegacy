package com.lee.thec.order.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lee.thec.order.bean.CartDTO;
import com.lee.thec.order.bean.DetailOrderDTO;
import com.lee.thec.order.bean.OrderDTO;

@Mapper
public interface OrderMapper {

	public List<CartDTO> getCartList(String member_id);

	public void addCart(CartDTO cartDTO);

	public CartDTO getCartDtoByDetailProductId(int detail_product_id);

	public void deleteDetailProductFromCart(int detail_product_id);

	public void registerOrderDTO(OrderDTO orderDTO);

	public void registerDetailOrderDTO(DetailOrderDTO detailOrderDTO);

	public void deleteCart(String member_id);

	public List<OrderDTO> getOrderHistory(String member_id);

	public List<DetailOrderDTO> getDetailOrderDtoByOrderId(String order_id);

	
}
