package com.lee.thec.file.service;

import java.util.List;

import com.lee.thec.file.bean.FileDTO;

public interface FileService {
	public void boardFileInsert(FileDTO fileDTO);
	
	public void boardFileDelete(String uuid);
	
	public void boardFileDeleteAll(int Board_Num);
	
	public List<FileDTO> findByBoardNum(int Board_Num);
}
