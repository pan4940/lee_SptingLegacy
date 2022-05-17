package order.bean;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;

@Component
@Data
public class CartDTO {
	private String member_id;
	private int detail_product_id;
}
