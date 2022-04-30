package file.service;

import java.util.List;

import file.bean.BoardFileDTO;


public interface FileService {
	public void boardFileInsert(BoardFileDTO fileDTO);
	
	public void boardFileDelete(String uuid);
	
	public void boardFileDeleteAll(int Board_Num);
	
	public List<BoardFileDTO> findByBoardNum(int Board_Num);
}
