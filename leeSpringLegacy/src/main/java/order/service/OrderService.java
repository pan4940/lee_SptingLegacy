package order.service;

import java.util.List;

import order.bean.CartDTO;
import product.bean.ProductDTO;

public interface OrderService {

	public List<ProductDTO> getCartList(String member_id);

	public void addCart(String member_id, String product_size_id);

}
