package com.lee.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.lee.thec.file.bean.FileDTO;
import com.lee.thec.product.bean.ProductDTO;
import com.lee.thec.product.bean.ProductSizeDTO;
import com.lee.thec.product.service.ProductService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@Log4j
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml", "file:src/main/webapp/WEB-INF/spring/security-context.xml"})
public class ProductTests {
	
	@Setter(onMethod_ = {@Autowired})
	private ProductService productService;
	
	@Test
	public void testRegProduct() throws IOException {
		ProductDTO productDTO = new ProductDTO();
		productDTO.setProduct_name("후드집업");
		productDTO.setBrand_name("AEAE");
		productDTO.setCateCode1(1000);
		productDTO.setCateCode2(1100);
		productDTO.setCateCode3(1101);
		productDTO.setBrandCategory(10158);
		productDTO.setProduct_price(50000);
		productDTO.setProduct_descrip("후드티입나더");
		
		List<ProductSizeDTO> productSizeList = new ArrayList();
		ProductSizeDTO productSizeDTO1 = new ProductSizeDTO();
		productSizeDTO1.setProduct_size("XL");
		productSizeDTO1.setProduct_top_length("80");
		productSizeDTO1.setProduct_shoulder("80");
		productSizeDTO1.setProduct_chest("70");
		productSizeDTO1.setProduct_sleeve("44");
		productSizeList.add(productSizeDTO1);
		
		
		List<FileDTO> fileList = new ArrayList();
		
		FileDTO fileDTO1 = new FileDTO();
		fileDTO1.setFileName("1.jpg");
		fileDTO1.setUploadPath("C:/thec/product/2022/07/16");
		fileDTO1.setUuid("79140f39-4d8c-4531-805c-d2763fd46f6b");
		fileDTO1.setLinked_num(0);
		
		FileDTO fileDTO2 = new FileDTO();
		fileDTO2.setFileName("1.jpg");
		fileDTO2.setUploadPath("C:/thec/product/2022/07/16");
		fileDTO2.setUuid("79140f39-4d8c-4531-805c-d2763fd46f6b");
		fileDTO2.setLinked_num(0);
		fileList.add(fileDTO1);
		fileList.add(fileDTO2);
		
		productDTO.setFileList(fileList);
		productDTO.setProductSizeList(productSizeList);
		
		log.info(productDTO);
		System.out.println("테스트 : " + productDTO);
		
		
		productService.productRegister(productDTO);
	}
	
	
}
