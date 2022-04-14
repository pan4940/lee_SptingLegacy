package admin.service;

import java.util.List;

import admin.bean.GoodsCategoryDTO;

public interface AdminService {

	public List<GoodsCategoryDTO> getGoodsCategoryList();

	public void createbrandCategory(String product_category_name);

	public List<GoodsCategoryDTO> getBrandsCategoryList();

}
