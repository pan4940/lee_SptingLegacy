package product.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import file.bean.FileDTO;
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
	public void createBrandCategorySelectKey(ProductCategoryDTO productCategoryDTO) {
		
		System.out.println("before productCategoryDTO : " + productCategoryDTO);
		productMapper.createBrandCategorySelectKey(productCategoryDTO);
		
		productCategoryDTO.getFileList().forEach(t -> {
			t.setLinked_num(productCategoryDTO.getProduct_category_num());
			System.out.println("productCategoryDTO : " + t);
			fileMapper.brandFileInsert(t);
		});
		
		System.out.println("after productCategoryDTO : " + productCategoryDTO);
		
	}
	
	@Override
	public List<ProductCategoryDTO> getBrandsCategoryList() {
		List<ProductCategoryDTO> list = productMapper.getBrandsCategoryList();
		for (ProductCategoryDTO productCategoryDTO : list) {
			productCategoryDTO.setFileList(fileMapper.findByBrandNum(productCategoryDTO.getProduct_category_num()));
		}
		return list; 
	}
	
	@Override
	public List<ProductCategoryDTO> getProductCategoryList() {
		return productMapper.getProductCategoryList();
	}
	
	
	@Transactional
	@Override
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
			t.setLinked_num(productDTO.getProduct_num());
			System.out.println("productDTO : " + t);
			fileMapper.productFileInsert(t);
		});
		
		System.out.println("after productDTO : " + productDTO);
		
	}
	
	@Override
	public ProductDTO getProductDTO(int product_num) {
		ProductDTO productDTO = productMapper.getProductDTO(product_num);
		productDTO.setFileList(fileMapper.findByProductNum(product_num));
		return productDTO;
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
	public List<FileDTO> getProductFileList(int product_num) {
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
			t.setLinked_num(productDTO.getProduct_num());
			System.out.println("productDTO : " + t);
			fileMapper.productFileInsert(t);
		});
		
		System.out.println(productDTO);
		productMapper.modifyProduct(productDTO);
	}
	
	
	@Transactional
	@Override
	public void delete(int product_num) {
		fileMapper.productFileDeleteAll(product_num);
		productMapper.productDeleteCategory_link(product_num);
		productMapper.deleteProduct(product_num);
	}
	
	@Override
	public ProductCategoryDTO getProductCategoryDTO(int product_category_num) {
		
		ProductCategoryDTO productCategoryDTO = productMapper.getProductCategoryDTO(product_category_num);
		
		List<FileDTO> brandFileDTOList = getBrandFileList(product_category_num);
		System.out.println("brandFileDTOList : " + brandFileDTOList);
		productCategoryDTO.setFileList(brandFileDTOList);
		
		return productCategoryDTO;
	}
	
	@Override
	public List<FileDTO> getBrandFileList(int product_category_num) {
		List<FileDTO> list = fileMapper.findByBrandNum(product_category_num);
		System.out.println("list : " + fileMapper.findByBrandNum(product_category_num));
		return list;
	}
	
	@Transactional
	@Override
	public void modifyBrandCategory(ProductCategoryDTO productCategoryDTO) {
		if (productCategoryDTO.getFileList() == null || productCategoryDTO.getFileList().size() <= 0) {
			return;
		}
		
		System.out.println("modify productCategoryDTO : " + productCategoryDTO);
		fileMapper.brandFileDeleteAll(productCategoryDTO.getProduct_category_num());
		
		productCategoryDTO.getFileList().forEach(t -> {
			t.setLinked_num(productCategoryDTO.getProduct_category_num());
			System.out.println("BrandFileDTO : " + t);
			fileMapper.brandFileInsert(t);
		});
		
		System.out.println(productCategoryDTO);
		productMapper.modifyBrandCategory(productCategoryDTO);
	}
	
	@Override
	public List<ProductDTO> getProductsByBrandCategory(int brandCategory) {
		List<ProductDTO> list = productMapper.getProductsByBrandCategory(brandCategory);
		for (ProductDTO productDTO : list) {
			productDTO.setFileList(fileMapper.findByProductNum(productDTO.getProduct_num()));
		}
		return list;
	}
	
	
	@Override
	public String getBrandnameByBrandcategory(int brandCategory) {
		return productMapper.getBrandnameByBrandcategory(brandCategory);
	}
}
