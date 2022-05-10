
package product.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import file.bean.FileDTO;
import product.bean.ProductCategoryDTO;
import product.bean.ProductDTO;

@Mapper
public interface ProductMapper {


	public void createBrandCategorySelectKey(ProductCategoryDTO productCategoryDTO);

	public List<ProductCategoryDTO> getBrandsCategoryList();

	public List<ProductCategoryDTO> getProductCategoryList();

	public void productRegister(ProductDTO productDTO);

	public void productRegisterSelectKey(ProductDTO productDTO);

	public ProductDTO getProduct(int product_num);

	public ProductDTO searchProductName(String product_name);

	public String findBrandNameByBrandCategory(int brandCategory);

	public void productRegisterCategory_link(ProductDTO productDTO);

	public List<ProductDTO> getProductByCategory(Map<String, String> map);

	public ProductDTO getProductByProductNum(String product_num);

	public List<FileDTO> getFileList(int product_num);

	public void modifyProduct(ProductDTO productDTO);

	public void productDeleteCategory_link(int product_num);

	public void deleteProduct(int product_num);

	public ProductCategoryDTO getProductCategoryDTO(int product_category_num);


	public void modifyBrandCategory(ProductCategoryDTO productCategoryDTO);

	public List<ProductDTO> getProductsByBrandCategory(int brandCategory);

	public String getBrandnameByBrandcategory(int brandCategory);

	public ProductDTO getProductDTO(int product_num);

}
