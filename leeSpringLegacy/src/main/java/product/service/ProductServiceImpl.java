package product.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import file.bean.BoardFileDTO;
import file.bean.ProductFileDTO;
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
		productMapper.productRegisterCategory_link(productDTO);
		
		
		productDTO.getFileList().forEach(t -> {
			t.setProduct_num(productDTO.getProduct_num());
			System.out.println("productDTO : " + t);
			fileMapper.productFileInsert(t);
		});
		
		System.out.println("after productDTO : " + productDTO);
		
	}
	
	@Override
	public ProductDTO getProduct(int product_num) {
		
		return productMapper.getProduct(product_num);
	}
	
	
	@Override
	public ProductDTO searchProductName(String product_name) {
		return productMapper.searchProductName(product_name);
	}
	
	@Override
	public List<ProductDTO> getProductByCategory(Map<String, String> map) {
		
		List<ProductDTO> list = productMapper.getProductByCategory(map);
		
		return list;
	}
	
	@Override
	public ProductDTO getProductByProductNum(String product_num) {
		return productMapper.getProductByProductNum(product_num);
	}
	
	@Override
	public List<ProductFileDTO> getFileList(int product_num) {
		return fileMapper.findByProductNum(product_num);
	}
	
	
	@Override
	@Transactional
	public void modify(ProductDTO productDTO) {
		
		
		if (productDTO.getFileList() == null || productDTO.getFileList().size() <= 0) {
			return;
		}
		
		String brand_name = productMapper.findBrandNameByBrandCategory(productDTO.getBrandCategory());
		productDTO.setBrand_name(brand_name);
		
		if (productDTO.getCateCode2() == productDTO.getCateCode3()) {
			System.out.println("3번 카테고리 없음");
			productDTO.setCateCode3(0);
		}

		fileMapper.productFileDeleteAll(productDTO.getProduct_num());
		
		productDTO.getFileList().forEach(t -> {
			t.setProduct_num(productDTO.getProduct_num());
			System.out.println("productDTO : " + t);
			fileMapper.productFileInsert(t);
		});
		
		System.out.println(productDTO);
		productMapper.modify(productDTO);
	}
}
