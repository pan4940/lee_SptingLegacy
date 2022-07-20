package com.lee.thec.board.service;

import java.util.List;
import java.util.Map;

import com.lee.thec.board.bean.BoardDTO;
import com.lee.thec.file.bean.FileDTO;




public interface BoardService {
	
	//조회
	
	//post 외 카테고리별 게시물 리스트 조회. 페이징처리함
	public List<BoardDTO> getBoardList(Map<String, String> map);
	//post 게시물 리스트 조회. 페이징 처리 없어도 됨
	public List<BoardDTO> getPostList(int board_category_num);
	//하나의 게시물 조회
	public BoardDTO getBoardDTOByBoard_num(int board_num);
	//해당 게시판의 작성글 수 반환. 페이징 처리시 필요
	public int getTotalCount(int board_category_num);
	//메인회면 노출시기키 위함
	public BoardDTO getNewPost();
	
	//삽입
	//게시물 작성. 
	public void write(BoardDTO boardDTO);
	//게시물 작성. post외의 리뷰, qna 등등
	//public void writeNotPOST(BoardDTO boardDTO);
	
	
	//댓글 작성
	public void boardReplyWrite(BoardDTO boardDTO);

	//수정
	//게시물 수정
	public void modify(BoardDTO boardDTO);

	//삭제
	public void delete(int board_num);
	
	
	public List<FileDTO> getFileList(int board_num);
	
	
	public List<BoardDTO> getProductReview(int product_number);
	
	//nav의 post항목 미리보기 위한 메소드 
	public List<BoardDTO> getNavPostBoardDTO();



}
