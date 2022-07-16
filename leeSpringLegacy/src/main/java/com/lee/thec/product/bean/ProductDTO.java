package com.lee.thec.product.bean;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.lee.thec.file.bean.FileDTO;

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
	@JsonFormat(pattern = "yyyy/MM/dd")
	private Date regDate;
	private Date updateDate;
	
	//private ProductSizeDTO productSizeDTO;
	private List<ProductSizeDTO> productSizeList;
	private List<FileDTO> fileList;
	
	
	//product, PRODUCT_CATEGORY_LINK, PRODUCTFILE
}
