
package product.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import file.bean.BoardFileDTO;
import product.bean.ProductCategoryDTO;
import product.bean.ProductDTO;

@Mapper
public interface ProductMapper {


	public void createBrandCategory(String product_category_name);

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

	public List<BoardFileDTO> getFileList(int product_num);

	public void modifyProduct(ProductDTO productDTO);

	public void productDeleteCategory_link(int product_num);

	public void deleteProduct(int product_num);

}
