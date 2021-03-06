package com.lee.thec.board.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.lee.thec.board.bean.BoardDTO;



@Mapper
public interface BoardMapper {
	
	public List<BoardDTO> getListWithPaging(Map<String, String> map);

	public void write(BoardDTO boardDTO);

	public BoardDTO getBoardDTOByBoard_num(int board_num);

	public void boardReplyWrite(BoardDTO boardDTO);

	public int getTotalCount(int board_category_num);

	public void modify(BoardDTO boardDTO);

	public void delete(int board_num);

	public int getMaxBoardNumber();


	public List<BoardDTO> getPostList(int board_category_num);

	public BoardDTO getNewPost();

	public List<BoardDTO> getProductReview(int product_num);

	public List<BoardDTO> getNavPostBoardDTO();

	public List<BoardDTO> getBoardList(int board_category_num);
	
	
}
