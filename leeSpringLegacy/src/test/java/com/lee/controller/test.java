package com.lee.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import file.mapper.FileMapper;
import product.bean.ProductCategoryDTO;
import product.mapper.ProductMapper;

public class test {
	
	
	@Test
	public void test() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Date date = new Date();
		String str1 = sdf.format(date);
		//System.out.println(str);
		
		for (int i = 0; i < 100; i++) {
			int random = (int)(Math.random() * (100000));
			String str2 = String.format("%05d", random);
			
			System.out.println(str1 + str2);
		}
		//String random = (String)(Math.random() * 10000);
	}
	
	
}
