package product.bean;

import lombok.Data;


@Data
public class ProductCategoryDTO {
	
	private int product_category_num;
	private String product_category_name;
	private int product_category_num_ref;
	private int level;
	
}
