package file.service;

import java.util.List;

import file.bean.BoardFileDTO;


public interface FileService {
	public void boardFileInsert(BoardFileDTO fileDTO);
	
	public void boardFiledelete(String uuid);
	
	public void boardFiledeleteAll(int Board_Num);
	
	public List<BoardFileDTO> findByBoardNum(int Board_Num);
}
