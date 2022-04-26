package product.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import file.mapper.FileMapper;
import product.bean.ProductCategoryDTO;
import product.bean.ProductDTO;
import product.mapper.ProductMapper;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductMapper productMapper;
	
	@Autowired
	private FileMapper fileMapper;
	
	@Override
	public void createBrandCategory(String product_category_name) {
		productMapper.createBrandCategory(product_category_name);
	}
	
	@Override
	public List<ProductCategoryDTO> getBrandsCategoryList() {
		return productMapper.getBrandsCategoryList();
	}
	
	@Override
	public List<ProductCategoryDTO> getProductCategoryList() {
		return productMapper.getProductCategoryList();
	}
	
	
	@Override
	@Transactional
	public void productRegister(ProductDTO productDTO) {
		if (productDTO.getFileList() == null || productDTO.getFileList().size() <= 0) {
			return;
		}
		int brandCategory = productDTO.getBrandCategory();
		String brand_name = productMapper.findBrandNameByBrandCategory(brandCategory);
		productDTO.setBrand_name(brand_name);
		if (productDTO.getCateCode2() == productDTO.getCateCode3()) {
			System.out.println("3번 카테고리 없음");
			productDTO.setCateCode3(0);
		}
		System.out.println("before productDTO : " + productDTO);
		productMapper.productRegisterSelectKey(productDTO);
		System.out.println("after productDTO : " + productDTO);
		productMapper.productRegisterCategory_link(productDTO);
		
		
		productDTO.getFileList().forEach(t -> {
			t.setLinked_num(productDTO.getProduct_number());
			System.out.println("productDTO : " + t);
			fileMapper.productFileInsert(t);
		});
		
		
	}
	
	@Override
	public ProductDTO getProduct(int product_number) {
		
		return productMapper.getProduct(product_number);
	}
	
	
	@Override
	public ProductDTO searchProductName(String product_name) {
		return productMapper.searchProductName(product_name);
	}
	
	@Override
	public List<ProductDTO> getProductByCategory(Map<String, String> map) {
		return productMapper.getProductByCategory(map);
	}
	
	@Override
	public ProductDTO getProductByProductNum(String product_number) {
		return productMapper.getProductByProductNum(product_number);
	}
}
