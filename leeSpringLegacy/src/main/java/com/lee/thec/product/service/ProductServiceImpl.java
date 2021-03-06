package com.lee.thec.product.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.lee.thec.file.bean.FileDTO;
import com.lee.thec.file.mapper.FileMapper;
import com.lee.thec.product.bean.DetailProductDTO;
import com.lee.thec.product.bean.ProductCategoryDTO;
import com.lee.thec.product.bean.ProductDTO;
import com.lee.thec.product.bean.ProductSizeDTO;
import com.lee.thec.product.mapper.ProductMapper;


@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductMapper productMapper;
	
	@Autowired
	private FileMapper fileMapper;
	
	@Override
	public void createBrandCategorySelectKey(ProductCategoryDTO productCategoryDTO) {
		
		productMapper.createBrandCategorySelectKey(productCategoryDTO);
		
		productCategoryDTO.getFileList().forEach(t -> {
			t.setLinked_num(productCategoryDTO.getProduct_category_num());
			fileMapper.brandFileInsert(t);
		});
		
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
	
	
	@Transactional(rollbackFor = RuntimeException.class)
	@Override
	public void productRegister(ProductDTO productDTO){
		if (productDTO.getFileList() == null || productDTO.getFileList().size() <= 0) {
			return;
		}
		
		if (productDTO.getCateCode2() == productDTO.getCateCode3()) {
			productDTO.setCateCode3(0);
		}
		
		productMapper.productRegisterSelectKey(productDTO);
		productMapper.productRegisterCategory_link(productDTO);
		System.out.println("select : " + productDTO);
		productDTO.getFileList().forEach(t -> {
			t.setLinked_num(productDTO.getProduct_num());
			fileMapper.productFileInsert(t);
		});
		 
		registerProductSize(productDTO);
	}
	
	
	@Override
	public void registerProductSize(ProductDTO productDTO) throws RuntimeException{
		System.out.println("?????????");
		System.out.println(productDTO);
		
		for (ProductSizeDTO productSizeDTO : productDTO.getProductSizeList()) {
			productSizeDTO.setProduct_num(productDTO.getProduct_num());
			System.out.println(productSizeDTO);
			if (productDTO.getCateCode2() == 1100 || productDTO.getCateCode2() == 2100) {
				productMapper.registerTopProductSize(productSizeDTO);
				
			} else if (productDTO.getCateCode2() == 1200 || productDTO.getCateCode2() == 2100) {
				productMapper.registerBottomProductSize(productSizeDTO);
			} else if (productDTO.getCateCode2() == 1400 || productDTO.getCateCode2() == 2400) {
				productMapper.registerCapProductSize(productSizeDTO);
			} else {
				productMapper.registerOneSizeProductSize(productSizeDTO);
			}
		}
	}
	
	
	
	@Override
	public void addDetailProduct(DetailProductDTO detailProductDTO) {
		
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
	@Transactional(rollbackFor = RuntimeException.class)
	public void modify(ProductDTO productDTO) {
		
		if (productDTO.getFileList() == null || productDTO.getFileList().size() <= 0) {
			return;
		}
		
		String brand_name = productMapper.findBrandNameByBrandCategory(productDTO.getBrandCategory());
		productDTO.setBrand_name(brand_name);
		
		if (productDTO.getCateCode2() == productDTO.getCateCode3()) {
			productDTO.setCateCode3(0);
		}

		fileMapper.productFileDeleteAll(productDTO.getProduct_num());
		
		productDTO.getFileList().forEach(t -> {
			t.setLinked_num(productDTO.getProduct_num());
			fileMapper.productFileInsert(t);
		});
		
		productMapper.modifyProduct(productDTO);
	}
	
	
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
		productCategoryDTO.setFileList(brandFileDTOList);
		
		return productCategoryDTO;
	}
	
	@Override
	public List<FileDTO> getBrandFileList(int product_category_num) {
		List<FileDTO> list = fileMapper.findByBrandNum(product_category_num);
		return list;
	}
	
	@Transactional(rollbackFor = {Exception.class})
	@Override
	public void modifyBrandCategory(ProductCategoryDTO productCategoryDTO) {
		if (productCategoryDTO.getFileList() == null || productCategoryDTO.getFileList().size() <= 0) {
			return;
		}
		
		fileMapper.brandFileDeleteAll(productCategoryDTO.getProduct_category_num());
		
		productCategoryDTO.getFileList().forEach(t -> {
			t.setLinked_num(productCategoryDTO.getProduct_category_num());
			fileMapper.brandFileInsert(t);
		});
		
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
	
	
	@Override
	public void modifyProductSize(ProductSizeDTO productSizeDTO) {
		ProductDTO productDTO = productMapper.getProductByProductNum(productSizeDTO.getProduct_num() + "");
		
		if (productDTO.getCateCode2() == 1100 || productDTO.getCateCode2() == 2100) {
			productMapper.modifyTopProductSize(productSizeDTO);
		} else if (productDTO.getCateCode2() == 1200 || productDTO.getCateCode2() == 2100) {
			productMapper.modifyBottomProductSize(productSizeDTO);
		} else if (productDTO.getCateCode2() == 1400 || productDTO.getCateCode2() == 2400) {
			productMapper.modifyCapProductSize(productSizeDTO);
		} else {
			productMapper.modifyOneSizeProductSize(productSizeDTO);
		}
	}
	
	
	@Override
	public List<ProductSizeDTO> getProductByProductSize(int product_num) {
		return productMapper.getProductByProductSize(product_num);
	}
	
	@Override
	public ProductSizeDTO getProductSizeByProductSizeId(int product_size_id) {
		ProductSizeDTO productSizeDTO = productMapper.getProductSizeByProductSizeId(product_size_id);
		return productSizeDTO;
	}
	
	@Override
	public void deleteProductSize(int product_size_id) {
		productMapper.deleteProductSize(product_size_id);
	}
	
	@Override
	public List<DetailProductDTO> getDetailProductListByProductSizeId(int product_size_id) {
		return productMapper.getDetailProductListByProductSizeId(product_size_id);
	}
	
	
	
	@Override
	public void deleteDetailProductByDetailProductID(int detail_product_id) {
		productMapper.deleteDetailProductByDetailProductID(detail_product_id);
	}
	
	@Override
	public List<ProductCategoryDTO> recommendBrand() {
		List<ProductCategoryDTO> list = productMapper.recommendBrand();
		
		for (ProductCategoryDTO productCategoryDTO : list) {
			productCategoryDTO.setFileList(fileMapper.findByBrandNum(productCategoryDTO.getProduct_category_num()));
		}
		return list;
	}
	
	
	@Override
	public List<ProductDTO> recommendShoesBrand() {
		List<ProductDTO> list = productMapper.recommendShoesBrand();
		for (ProductDTO productDTO : list) {
			productDTO.setFileList(fileMapper.findByProductNum(productDTO.getProduct_num()));
		}
		return list;
	}
	
	
	@Override
	public List<ProductDTO> getProductsByProductName(String product_name) {
		List<ProductDTO> list = productMapper.getProductsByProductName(product_name);
		for (ProductDTO productDTO : list) {
			productDTO.setFileList(fileMapper.findByProductNum(productDTO.getProduct_num()));
		}
		return list;
	}
	
	@Override
	public List<ProductCategoryDTO> getNavMenProductCategoryDTO() {
		List<ProductCategoryDTO> list = new ArrayList<>();
		int[] arr = {10158, 10160};
		
		for (int product_category_num : arr) {
			ProductCategoryDTO productCategoryDTO = productMapper.getProductCategoryDTO(product_category_num);
			list.add(productCategoryDTO);
			productCategoryDTO.setFileList(fileMapper.findByBrandNum(product_category_num));
		}
		
		return list;
	}
	
	
	@Override
	public List<ProductCategoryDTO> getNavWomenProductCategoryDTO() {
		List<ProductCategoryDTO> list = new ArrayList<>();
		int[] arr = {10162, 10164};
		
		for (int product_category_num : arr) {
			ProductCategoryDTO productCategoryDTO = productMapper.getProductCategoryDTO(product_category_num);
			list.add(productCategoryDTO);
			productCategoryDTO.setFileList(fileMapper.findByBrandNum(product_category_num));
		}
		
		return list;
	}
	
	@Override
	public Map<String, Object> getNavBrandProductCategoryDTO() {
		List<ProductCategoryDTO> threeProductCategoryDTO = new ArrayList<>();
		int[] arr = {10158, 10163, 10164};
		
		for (int product_category_num : arr) {
			ProductCategoryDTO productCategoryDTO = productMapper.getProductCategoryDTO(product_category_num);
			threeProductCategoryDTO.add(productCategoryDTO);
			productCategoryDTO.setFileList(fileMapper.findByBrandNum(product_category_num));
		}
		Map<String, Object> map = new HashMap<>();
		map.put("threeProductCategoryDTO", threeProductCategoryDTO);
		
		List<ProductCategoryDTO> brandCategory = productMapper.getNavBrandProductCategoryDTO();
		
		map.put("brandCategory", brandCategory);
		
		return map;
	}
	
	
	@Override
	public ProductCategoryDTO getProductCategoryByProductCategoryREF(int product_category_num) {
		
		if (1000 <= product_category_num && product_category_num < 2000) {
			ProductCategoryDTO firstCategory = productMapper.getProductCategoryDTO(1000);
			firstCategory.setProductCategoryList(productMapper.getProductCategoryByProductCategoryREF(firstCategory.getProduct_category_num()));
			
			for (ProductCategoryDTO productCategoryDTO : firstCategory.getProductCategoryList()) {
				productCategoryDTO.setProductCategoryList(productMapper.getProductCategoryByProductCategoryREF(productCategoryDTO.getProduct_category_num()));
			}
			
			return firstCategory;
		} else {
			ProductCategoryDTO firstCategory = productMapper.getProductCategoryDTO(2000);
			firstCategory.setProductCategoryList(productMapper.getProductCategoryByProductCategoryREF(firstCategory.getProduct_category_num()));
			
			for (ProductCategoryDTO productCategoryDTO : firstCategory.getProductCategoryList()) {
				productCategoryDTO.setProductCategoryList(productMapper.getProductCategoryByProductCategoryREF(productCategoryDTO.getProduct_category_num()));
			}
			return firstCategory;
		}
	}
	
	
	
	
	@Override
	public List<ProductDTO> getProductListByProductCategory(int product_category_num) {
		List<ProductDTO> list = productMapper.getProductListByProductCategory(product_category_num);
		for (ProductDTO productDTO : list) {
			productDTO.setFileList(fileMapper.findByProductNum(productDTO.getProduct_num()));
		}
		
		return list;
	}
	
	@Override
	public int getTotalCount(int product_category_num) {
		return productMapper.getTotalCount(product_category_num);
	}
	
	
	@Override
	public void deleteBrandCategory(int product_category_num) {
		fileMapper.brandFileDeleteAll(product_category_num);
		productMapper.deleteBrandCategory(product_category_num);
	}
	
	@Override
	public ProductCategoryDTO getBrandCategoryByProduct_category_num(String product_category_num) {
		return productMapper.getBrandCategoryByProduct_category_num(product_category_num);
	}
	
}	
