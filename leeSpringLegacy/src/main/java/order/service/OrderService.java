package order.service;

import java.util.List;

import product.bean.ProductDTO;

public interface OrderService {

	public List<ProductDTO> getCartList(String member_id);

}
