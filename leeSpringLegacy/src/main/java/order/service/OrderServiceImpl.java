package order.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import file.bean.FileDTO;
import file.mapper.FileMapper;
import order.bean.CartDTO;
import order.bean.OrderDTO;
import order.mapper.OrderMapper;
import product.bean.DetailProductDTO;
import product.bean.ProductDTO;
import product.bean.ProductSizeDTO;
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
		List<ProductDTO> productDTOList = new ArrayList<>();
		for (CartDTO cartDTO : cartDTOList) {
			DetailProductDTO detailProductDTO = productMapper.getDetailProductByDetailProductId(cartDTO.getDetail_product_id()); 
			ProductSizeDTO productSizeDTO = productMapper.getProductSizeByProductSizeId(detailProductDTO.getProduct_size_id());
			productSizeDTO.setDetailProductDTO(detailProductDTO);
			ProductDTO productDTO = productMapper.getProductByProductNum(productSizeDTO.getProduct_num() + "");
			List<FileDTO> fileDTOList = fileMapper.findByProductNum(productDTO.getProduct_num());
			
			productDTO.setFileList(fileDTOList);
			productDTO.setProductSizeDTO(productSizeDTO);
			productDTOList.add(productDTO);
		}
		
		
		return productDTOList;
	}
	
	
	@Override
	public void addCart(String member_id, String product_size_idd) {
		
		//사이즈id로 해당되는 모든 DetailProductDTO 가져옴
		int product_size_id = Integer.parseInt(product_size_idd);
		List<DetailProductDTO> detailProductDTOs = productMapper.getDetailProductListByProductSizeId(product_size_id);
		
		//for문 통해서 DetailProductDTO의 detail_product_id로 계속 조회...없으면 등록하자
		for (int i = 0; i < detailProductDTOs.size(); i++) {
			DetailProductDTO detailProductDTO = detailProductDTOs.get(i);
			CartDTO cartDTO = orderMapper.getCartDtoByDetailProductId(detailProductDTO.getDetail_product_id());
			
			if (cartDTO == null) {
				CartDTO cartDTO2 = new CartDTO();
				cartDTO2.setDetail_product_id(detailProductDTO.getDetail_product_id());
				cartDTO2.setMember_id(member_id);
				orderMapper.addCart(cartDTO2);
				break;
			}
		}
		
	}	
	
	@Override
	public void deleteCart(int detail_product_id) {
		orderMapper.deleteCart(detail_product_id);
	}
	
	@Override
	public void registerOrderDTO(OrderDTO orderDTO) {
		//먼저 orderDTO등록. selectKey
		//이후 orderDTO.getDetailOrderDTOList()로 리스트 받아와서 DetailOrderDTO 등록 반복문 필요
		orderMapper.registerOrderDTO(orderDTO);
	}
		
}
