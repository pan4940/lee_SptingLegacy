package product.service;

import java.util.List;
import java.util.Map;

import file.bean.BoardFileDTO;
import file.bean.ProductFileDTO;
import product.bean.ProductCategoryDTO;
import product.bean.ProductDTO;

public interface ProductService {

	public List<ProductCategoryDTO> getProductCategoryList();

	public List<ProductCategoryDTO> getBrandsCategoryList();

	public void createBrandCategory(String product_category_name);

	public void productRegister(ProductDTO productDTO);

	public ProductDTO getProduct(int product_num);

	public ProductDTO searchProductName(String product_name);

	public List<ProductDTO> getProductByCategory(Map<String, String> map);

	public ProductDTO getProductByProductNum(String product_num);

	public List<ProductFileDTO> getFileList(int product_num);

	public void modify(ProductDTO productDTO);



}
