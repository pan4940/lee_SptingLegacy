package product.bean;

import java.util.Date;
import java.util.List;

import file.bean.BoardFileDTO;
import file.bean.ProductFileDTO;
import lombok.Data;


@Data
public class ProductDTO {
	private int product_num;
	private String product_name;
	private String brand_name;
	private int cateCode1;
	private int cateCode2;
	private int cateCode3;
	private int brandCategory;
	private int product_price;
	private String product_descrip;
	private Date legDate;
	private Date updateDate;
	
	private List<ProductFileDTO> fileList;
	
	
	//product, PRODUCT_CATEGORY_LINK, PRODUCTFILE
}
