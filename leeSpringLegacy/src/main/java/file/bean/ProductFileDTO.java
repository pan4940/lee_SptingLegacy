package file.bean;

import lombok.Data;

@Data
public class ProductFileDTO {
	private int productfile_id;
	private String fileName;
	private String uploadPath;
	private String uuid;
	private int product_num;
}
