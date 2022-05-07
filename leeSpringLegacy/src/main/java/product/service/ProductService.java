package product.service;

import java.util.List;
import java.util.Map;

import file.bean.BoardFileDTO;
import file.bean.BrandFileDTO;
import file.bean.ProductFileDTO;
import product.bean.ProductCategoryDTO;
import product.bean.ProductDTO;

public interface ProductService {

	public List<ProductCategoryDTO> getProductCategoryList();

	public List<ProductCategoryDTO> getBrandsCategoryList();

	public void createBrandCategorySelectKey(ProductCategoryDTO productCategoryDTO);

	public void productRegister(ProductDTO productDTO);

	public ProductDTO getProduct(int product_num);

	public ProductDTO searchProductName(String product_name);

	public List<ProductDTO> getProductByCategory(Map<String, String> map);

	public ProductDTO getProductByProductNum(String product_num);

	public List<ProductFileDTO> getProductFileList(int product_num);

	public void modify(ProductDTO productDTO);

	public void delete(int parseInt);

	public ProductCategoryDTO getProductCategoryDTO(int product_category_num);

	public List<BrandFileDTO> getBrandFileList(int brand_num);

	public void modifyBrandCategory(ProductCategoryDTO productCategoryDTO);




}
