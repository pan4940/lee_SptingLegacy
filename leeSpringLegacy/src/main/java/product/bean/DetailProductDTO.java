package product.bean;

import java.util.Date;
import java.util.List;

import file.bean.FileDTO;
import lombok.Data;


@Data
public class DetailProductDTO {
	private int detailProduct_num;
	private int product_num;
	private ProductSizeDTO productSizeDTO;
	private Date legDate;
	private Date updateDate;
	private int addProductsAmount;
	//product, PRODUCT_CATEGORY_LINK, PRODUCTFILE
}
