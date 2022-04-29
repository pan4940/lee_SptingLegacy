package file.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import file.bean.BoardFileDTO;
import file.bean.ProductFileDTO;


@Mapper
public interface FileMapper {
	
	public void boardFileInsert(BoardFileDTO fileDTO);
	
	public void boardFiledelete(String uuid);
	
	public void boardFiledeleteAll(int Board_Num);
	
	public List<BoardFileDTO> findByBoardNum(int board_Num);

	
	public void productFileInsert(ProductFileDTO t);

	public List<ProductFileDTO> findByProductNum(int product_number);

	
}
