package admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import admin.bean.GoodsCategoryDTO;
import admin.mapper.AdminMapper;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminMapper adminMapper;
	
	@Override
	public List<GoodsCategoryDTO> getGoodsCategoryList() {
		return adminMapper.getGoodsCategoryList();
	}
	
	@Override
	public void createbrandCategory(String product_category_name) {
		adminMapper.createbrandCategory(product_category_name);
	}
	
	@Override
	public List<GoodsCategoryDTO> getBrandsCategoryList() {
		return adminMapper.getBrandsCategoryList();
	}
}
