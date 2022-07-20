package com.lee.thec.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lee.thec.board.bean.BoardDTO;
import com.lee.thec.board.mapper.BoardMapper;
import com.lee.thec.file.bean.FileDTO;
import com.lee.thec.file.mapper.FileMapper;


@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardMapper boardMapper;
	
	@Autowired
	private FileMapper fileMapper;
	
	
	@Override
	public List<BoardDTO> getBoardList(Map<String, String> map) {
		return boardMapper.getListWithPaging(map);
	}
	
	
	@Override
	public List<BoardDTO> getPostList(int board_category_num) {
		return boardMapper.getPostList(board_category_num);
	}
	
	
	@Override
	@Transactional(rollbackFor = {Exception.class})
	public void write(BoardDTO boardDTO) {
		boardMapper.write(boardDTO);
		if (boardDTO.getFileList() != null || 0 <= boardDTO.getFileList().size()) {
			boardDTO.getFileList().forEach(t -> {
				t.setLinked_num(boardDTO.getBoard_num());
				fileMapper.boardFileInsert(t);
			});
		}
		
	}
	
	@Override
	@Transactional(rollbackFor = {Exception.class})
	public void modify(BoardDTO boardDTO) {
		fileMapper.boardFileDeleteAll(boardDTO.getBoard_num());
		boardMapper.modify(boardDTO);
		
		if (boardDTO.getFileList() != null) {
			
			boardDTO.getFileList().forEach(t -> {
				t.setLinked_num(boardDTO.getBoard_num());
				fileMapper.boardFileInsert(t);
			});
		}
	}
	
	@Override
	public BoardDTO getBoardDTOByBoard_num(int board_num) {
		return boardMapper.getBoardDTOByBoard_num(board_num);
	}
	
	@Override
	public void boardReplyWrite(BoardDTO boardDTO) {
		//원글
		boardMapper.boardReplyWrite(boardDTO);
	}
	
	@Override
	public int getTotalCount(int board_category_num) {
		return boardMapper.getTotalCount(board_category_num);
	}
	
	
	@Transactional(rollbackFor = {Exception.class})
	@Override
	public void delete(int board_num) {
		fileMapper.boardFileDeleteAll(board_num);
		boardMapper.delete(board_num);
	}
	

	@Override
	public List<FileDTO> getFileList(int board_num) {
		return fileMapper.findByBoardNum(board_num);
	}
	
	@Override
	public BoardDTO getNewPost() {
		BoardDTO boardDTO = boardMapper.getNewPost();
		boardDTO.setFileList(fileMapper.findByBoardNum(boardDTO.getBoard_num()));
		return boardDTO;
	}
	
	@Override
	public List<BoardDTO> getProductReview(int product_number) {
		
		return boardMapper.getProductReview(product_number);
	}
	
	
	@Override
	public List<BoardDTO> getNavPostBoardDTO() {
		List<BoardDTO> list = boardMapper.getNavPostBoardDTO();
		for (BoardDTO boardDTO : list) {
			boardDTO.setFileList(fileMapper.findByBoardNum(boardDTO.getBoard_num()));
		}
		return list;
	}
}
