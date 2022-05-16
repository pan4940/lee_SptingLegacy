package order.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import order.bean.CartDTO;
import product.bean.ProductDTO;

@Mapper
public interface OrderMapper {

	public List<CartDTO> getCartList(String member_id);

}
