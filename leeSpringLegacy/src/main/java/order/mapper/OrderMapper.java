package order.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import order.bean.CartDTO;
import order.bean.OrderDTO;
import product.bean.ProductDTO;

@Mapper
public interface OrderMapper {

	public List<CartDTO> getCartList(String member_id);

	public void addCart(CartDTO cartDTO);

	public CartDTO getCartDtoByDetailProductId(int detail_product_id);

	public void deleteCart(int detail_product_id);

	public void registerOrderDTO(OrderDTO orderDTO);

}
