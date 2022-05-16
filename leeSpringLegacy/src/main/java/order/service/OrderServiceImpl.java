package order.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import file.mapper.FileMapper;
import order.bean.CartDTO;
import order.mapper.OrderMapper;
import product.bean.DetailProductDTO;
import product.bean.ProductDTO;
import product.mapper.ProductMapper;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderMapper orderMapper;
	
	@Autowired
	private ProductMapper productMapper;
	
	@Autowired
	private FileMapper fileMapper;
	
	@Override
	public List<ProductDTO> getCartList(String member_id) {
		//해당 아이디로 추가한 장바구니항목을 가져온다. Cart테이블. DETAIL_PRODUCT와 1:1관계이고, DETAIL_PRODUCT_ID를 외래키로 가짐
		List<CartDTO> cartDTOList = orderMapper.getCartList(member_id);
		List<DetailProductDTO> detailProductDTOList = new ArrayList<DetailProductDTO>();
		for (CartDTO cartDTO : cartDTOList) {
			DetailProductDTO detailProductDTO = productMapper.getDetailProductByDetailProductId(cartDTO.getDetail_product_id());		
			detailProductDTOList.add(detailProductDTO);
		}
		
		List<ProductDTO> productDTOList = new ArrayList<ProductDTO>();
		for (DetailProductDTO detailProductDTO : detailProductDTOList) {
			ProductDTO productDTO = productMapper.getProductByProductNum(detailProductDTO.getProduct_num() + "");
			productDTO.setFileList(fileMapper.findByProductNum(productDTO.getProduct_num()));
			productDTO.setProductSizeList(productMapper.getProductByProductSize(productDTO.getProduct_num()));
			
			System.out.println(productDTO);
			productDTOList.add(productDTO);
		}
		
		return productDTOList;
	}
}
