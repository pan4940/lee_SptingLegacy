package com.lee.thec.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lee.thec.board.bean.ReplyDTO;
import com.lee.thec.board.mapper.ReplyMapper;


@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	private ReplyMapper replyMapper;
	
	@Override
	public int write(ReplyDTO replyDTO) {
		
		return replyMapper.write(replyDTO);
	}
	
	@Override
	public List<ReplyDTO> getList(int board_number) {
		return replyMapper.getList(board_number);
	}
	
	@Override
	public ReplyDTO get(int reply_num) {
		return replyMapper.get(reply_num);
	}
	
	@Override
	public int update(ReplyDTO replyDTO) {
		
		return replyMapper.update(replyDTO);
	}
	
	@Override
	public int delete(int reply_num) {
		return replyMapper.delete(reply_num);
	}
}
