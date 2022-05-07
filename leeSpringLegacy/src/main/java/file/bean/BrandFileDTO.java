package file.bean;

import lombok.Data;

@Data
public class BrandFileDTO {
	private int brandfile_id;
	private String fileName;
	private String uploadPath;
	private String uuid;
	private int brand_num;
}
