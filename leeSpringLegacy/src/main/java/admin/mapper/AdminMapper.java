package admin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import admin.bean.GoodsCategoryDTO;

@Mapper
public interface AdminMapper {
	public List<GoodsCategoryDTO> getGoodsCategoryList();

	public void createbrandCategory(String product_category_name);

	public List<GoodsCategoryDTO> getBrandsCategoryList();

}
