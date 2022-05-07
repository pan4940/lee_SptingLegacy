package file.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import file.bean.BoardFileDTO;
import file.bean.BrandFileDTO;
import file.bean.ProductFileDTO;


@Mapper
public interface FileMapper {
	
	public void boardFileInsert(BoardFileDTO fileDTO);
	
	public void boardFileDelete(String uuid);
	
	public void boardFileDeleteAll(int Board_Num);
	
	public List<BoardFileDTO> findByBoardNum(int board_Num);

	
	public void productFileInsert(ProductFileDTO t);

	public List<ProductFileDTO> findByProductNum(int product_num);

	public void productFileDeleteAll(int product_num);

	public void brandFileInsert(BrandFileDTO t);

	public List<BrandFileDTO> findByBrandNum(int product_category_num);

	public void brandFileDeleteAll(int product_category_num);

	
}
