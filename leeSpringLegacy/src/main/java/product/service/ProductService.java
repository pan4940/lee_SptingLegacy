package product.service;

import java.util.List;
import java.util.Map;

import file.bean.FileDTO;
import product.bean.ProductCategoryDTO;
import product.bean.ProductDTO;
import product.bean.ProductSizeDTO;

public interface ProductService {

	public List<ProductCategoryDTO> getProductCategoryList();

	public List<ProductCategoryDTO> getBrandsCategoryList();

	public void createBrandCategorySelectKey(ProductCategoryDTO productCategoryDTO);

	public void productRegister(ProductDTO productDTO);

	public ProductDTO getProductDTO(int product_num);

	public ProductDTO searchProductName(String product_name);

	public List<ProductDTO> getProductByCategory(Map<String, String> map);

	public ProductDTO getProductByProductNum(String product_num);

	public List<FileDTO> getProductFileList(int product_num);

	public void modify(ProductDTO productDTO);

	public void delete(int parseInt);

	public ProductCategoryDTO getProductCategoryDTO(int product_category_num);

	public List<FileDTO> getBrandFileList(int brand_num);

	public void modifyBrandCategory(ProductCategoryDTO productCategoryDTO);

	public List<ProductDTO> getProductsByBrandCategory(int brandCategory);

	public String getBrandnameByBrandcategory(int brandCategory);

	public void registerProductSize(ProductSizeDTO productSizeDTO);
	
}
