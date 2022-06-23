package board.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import board.bean.ReplyDTO;
import board.service.ReplyService;



@RequestMapping("/reply")
@Controller
public class ReplyController {
	
	@Autowired
	private ReplyService replyService;
	
	@PostMapping("/write")
	@ResponseBody
	public void write(ReplyDTO replyDTO) {
		replyService.write(replyDTO);
	}
	
	
	@PostMapping("/list")
	@ResponseBody
	public List<ReplyDTO> getList(int board_num) {
		List<ReplyDTO> list = replyService.getList(board_num);
		return list;
	}
	
	
	@PostMapping("/get")
	@ResponseBody
	public ReplyDTO get(int reply_num) {
		return replyService.get(reply_num);
	}
	
	@PostMapping("/update")
	@ResponseBody
	public void update(ReplyDTO replyDTO) {
		replyService.update(replyDTO);
	}
	
	
	@PostMapping("/delete")
	@ResponseBody
	public void delete(int reply_num) {
		replyService.delete(reply_num);
	}
	
	
	
}
