package com.lee.thec.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lee.thec.board.bean.ReplyDTO;



@Mapper
public interface ReplyMapper {

	public int write(ReplyDTO replyDTO);

	public List<ReplyDTO> getList(int board_num);

	public ReplyDTO get(int reply_num);

	public int update(ReplyDTO replyDTO);

	public int delete(int reply_num);
}
