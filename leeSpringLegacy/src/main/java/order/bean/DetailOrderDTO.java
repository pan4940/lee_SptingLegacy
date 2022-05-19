package order.bean;


import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;
import product.bean.DetailProductDTO;

@Component
@Data
public class DetailOrderDTO {
	private int detail_order_id;
	private int order_id;
	private int detail_product_id;
	private int product_price;
	private Date legDate; 
	private Date updateDate;
	
	
	private DetailProductDTO detailProductDTO;
}
